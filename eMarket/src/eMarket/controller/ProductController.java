package eMarket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import eMarket.entity.Category;
import eMarket.entity.Product;
import eMarket.entity.SubCategory;
import eMarket.pagination.Product2;
import eMarket.util.HibernateUtils;

@Transactional
@Controller
@RequestMapping("product")
public class ProductController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("detail/{id}")
	public String detail(ModelMap model, @PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		Product p = (Product) session.get(Product.class, id);

		// Kèm các sản phẩm cùng loại và nhà cung cấp
		Hibernate.initialize(p.getCategory().getProducts());
		Hibernate.initialize(p.getSupplier().getProducts());

		model.addAttribute("prod", p);
		return "user/product/detail";
	}

	@RequestMapping("list-by-special/{id}")
	public String listBySpecial(ModelMap model, @PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		Query query = null;
		String hql;
		switch (id) {
		case 0: // bán chạy
			hql = "FROM Product ORDER BY SIZE(orderDetails)";
			query = session.createQuery(hql);
			query.setMaxResults(9);
			break;
		case 1: // mới
			hql = "FROM Product WHERE latest=true";
			query = session.createQuery(hql);
			break;
		case 2: // giảm giá
			hql = "FROM Product WHERE discount > 0 ORDER BY discount";
			query = session.createQuery(hql);
			query.setMaxResults(9);
			break;
		case 3: // đặc biệt
			hql = "FROM Product WHERE special=true";
			query = session.createQuery(hql);
			break;
		case 4: // xem nhiều
			hql = "FROM Product WHERE views > 0 ORDER BY views";
			query = session.createQuery(hql);
			query.setMaxResults(9);
			break;
		}
		List<Product> list = query.list();

		model.addAttribute("prods", list);

		return "user/product/list";
	}

	@RequestMapping("search")
	public String searchByName(ModelMap model, @RequestParam("keywords") String keywords) {
		String hql = "FROM Product WHERE name LIKE :kw OR " + " category.name LIKE :kw OR "
				+ " category.nameVN LIKE :kw OR " + " supplier.name LIKE :kw";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("kw", "%" + keywords + "%");
		List<Product> list = query.list();

		model.addAttribute("prods", list);

		return "user/product/list";
	}

	@RequestMapping("list-by-subcategory/{id}")
	public String listByCategory(ModelMap model, @PathVariable("id") Integer id) {
		String hql = "FROM Product WHERE subCategory.id=:cid";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("cid", id);
		List<Product> list = query.list();
		model.addAttribute("prods", list);
		return "user/product/list";
	}

	@RequestMapping("list-by-category/{id}")
	public String listBysubCategory(ModelMap model, @PathVariable("id") Integer id, HttpServletRequest request) {
//		String hql = "FROM Product WHERE category.id=:cid";
//		Session session = factory.getCurrentSession();
//		Query query = session.createQuery(hql);
//		query.setParameter("cid", id);
//		List<Product> list = query.list();
		
//		model.addAttribute("prods", list);
		request.setAttribute("idPagination", id);
		return "user/product/list";
	}

	@RequestMapping("list-by-supplier/{id}")
	public String listBySupplier(ModelMap model, @PathVariable("id") String id) {
		String hql = "FROM Product WHERE supplier.id=:sid";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		query.setParameter("sid", id);
		List<Product> list = query.list();
		model.addAttribute("prods", list);
		return "user/product/list";
	}

	public List<Category> showCate() {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			String hql = "From Category";
			Query query = session.createQuery(hql);
			List<Category> list = query.list();
			session.getTransaction().commit();
			return list;
		} catch (HibernateException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return null;
	}

	public List<SubCategory> showSubCateByCate(Integer id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();

		try {
			session.getTransaction().begin();
			String hql = "From SubCategory WHERE category.id =" + id;
			Query query = session.createQuery(hql);
			List<SubCategory> list = query.list();
			session.getTransaction().commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return null;
	}

}
