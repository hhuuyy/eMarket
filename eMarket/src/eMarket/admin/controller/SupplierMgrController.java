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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import eMarket.entity.Supplier;

@Transactional
@Controller
@RequestMapping("admin/supplier")
public class SupplierMgrController {
	@Autowired
	SessionFactory factory;

	@Autowired
	ServletContext app;

	@RequestMapping("delete")
	public String delete(ModelMap model, Supplier supplier) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(supplier);
			t.commit();
			model.addAttribute("message", "Delete Secessfully  !");
			model.addAttribute("model", new Supplier());
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Delete fail !");
			model.addAttribute("model", supplier);
		} finally {
			session.close();
		}
		model.addAttribute("items", getSuppliers());
		return "admin/supplier";
	}

	@RequestMapping("update")
	public String update(ModelMap model, Supplier supplier, @RequestParam("uplogo") MultipartFile logo) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			// upload
			if (!logo.isEmpty()) {
				supplier.setLogo(logo.getOriginalFilename());
				String path = app.getRealPath("/images/suppliers/" + supplier.getLogo());
				logo.transferTo(new File(path));
			}
			// update
			session.update(supplier);
			t.commit();
			model.addAttribute("message", "Update Secessfully !");
		} catch (Exception e) {
			
			t.rollback();
			model.addAttribute("message", "Update fail !");
		} finally {
			session.close();
		}
		model.addAttribute("model", supplier);
		model.addAttribute("items", getSuppliers());
		return "admin/supplier";
	}

	@RequestMapping("edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") String id) {
		Session session = factory.getCurrentSession();
		Supplier supplier = (Supplier) session.get(Supplier.class, id);

		model.addAttribute("model", supplier);
		model.addAttribute("items", getSuppliers());
		return "admin/supplier";
	}

	@RequestMapping("insert")
	public String insert(ModelMap model, Supplier supplier, @RequestParam("uplogo") MultipartFile logo) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			// upload
			if (!logo.isEmpty()) {
				supplier.setLogo(logo.getOriginalFilename());
				String path = app.getRealPath("/images/suppliers/" + supplier.getLogo());
				logo.transferTo(new File(path));
			} else {
				supplier.setLogo("supplier.png");
			}
			// insert
			session.save(supplier);
			t.commit();
			model.addAttribute("message", "Insert Secessfully !");
			model.addAttribute("model", new Supplier());
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Insert fail !");
			model.addAttribute("model", supplier);
		} finally {
			session.close();
		}
		model.addAttribute("items", getSuppliers());
		return "admin/supplier";
	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		Supplier supplier = new Supplier();
		model.addAttribute("model", supplier);

		model.addAttribute("items", getSuppliers());
		return "admin/supplier";
	}

	private List<Supplier> getSuppliers() {
		String hql = "FROM Supplier";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Supplier> list = query.list();
		return list;
	}
}
