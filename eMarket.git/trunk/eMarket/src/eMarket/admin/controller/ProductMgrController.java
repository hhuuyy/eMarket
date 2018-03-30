package eMarket.admin.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import eMarket.entity.Category;
import eMarket.entity.Product;
import eMarket.entity.Supplier;
import eMarket.entity.User;;

@Transactional
@Controller
@RequestMapping("admin/product")
public class ProductMgrController {
	@Autowired
	SessionFactory factory;

	@Autowired
	ServletContext app;

	@RequestMapping("delete")
	public String delete(ModelMap model, Product product) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(product);
			t.commit();
			model.addAttribute("message", "Delete Secessfully !");
			model.addAttribute("model", new Product());
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Delete fail !");
			model.addAttribute("model", product);
		} finally {
			session.close();
		}
		model.addAttribute("items", getProducts());
		return "admin/product";
	}

	@RequestMapping("update")
	public String update(ModelMap model, Product product, @RequestParam("upimage") MultipartFile image) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			// upload
			if (!image.isEmpty()) {
				product.setImage(image.getOriginalFilename());
				String path = app.getRealPath("/images/products/" + product.getImage());
				image.transferTo(new File(path));
			}
			// update
			session.update(product);
			t.commit();
			model.addAttribute("message", "Update Secessfully !");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Update fail !");
		} finally {
			session.close();
		}
		model.addAttribute("model", product);
		model.addAttribute("items", getProducts());
		return "admin/product";
	}

	@RequestMapping("edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		Product product = (Product) session.get(Product.class, id);

		model.addAttribute("model", product);
		model.addAttribute("items", getProducts());
		return "admin/product";
	}

	@RequestMapping("insert")
	public String insert(ModelMap model, Product product, @RequestParam("upimage") MultipartFile image) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			// upload
			if (!image.isEmpty()) {
				product.setImage(image.getOriginalFilename());
				String path = app.getRealPath("/images/products/" + product.getImage());
				image.transferTo(new File(path));
			} else {
				product.setImage("product.png");
			}
			// insert
			session.save(product);
			t.commit();
			model.addAttribute("message", "Insert Secessfully !");
			model.addAttribute("model", new Product());
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Insert fail !");
			model.addAttribute("model", product);
		} finally {
			session.close();
		}
		model.addAttribute("items", getProducts());
		return "admin/product";
	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		Product product = new Product();
		model.addAttribute("model", product);

		model.addAttribute("items", getProducts());
		return "admin/product";
	}

	public List<Product> getProducts() {
		String hql = "FROM Product";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}

	@ModelAttribute("categories")
	public List<Category> getCategories() {
		String hql = "FROM Category";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		return list;
	}

	@ModelAttribute("suppliers")
	public List<Supplier> getSuppliers() {
		String hql = "FROM Supplier";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Supplier> list = query.list();
		return list;
	}
	@ModelAttribute("subCategories")
	public List<Supplier> getSubCategory() {
		String hql = "FROM SubCategory";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Supplier> list = query.list();
		return list;
	}
	@ModelAttribute("users")
	public List<Supplier> getUsers() {
		String hql = "FROM User";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Supplier> list = query.list();
		return list;
	}
}
