package eMarket.admin.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import eMarket.entity.Category;

@Transactional
@Controller
@RequestMapping("admin/category")
public class CategoryController {

	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model ){
		Category category = new Category();
		
		model.addAttribute("model", category);
		// dung cho table
		model.addAttribute("items", getCategories());
		
		return"admin/category";
	}
	
	@ModelAttribute("categories")
	public List<Category> getCategories() {
		String hql = "FROM Category";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		return list;
	}
	
	@RequestMapping("insert")
	public String insert(ModelMap model, Category category) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(category);
			t.commit();
			model.addAttribute("message", "Insert Secessfully!");
			model.addAttribute("model", new Category());
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Insert fail!");
			model.addAttribute("model", category);
		} finally {
			session.close();
		}
		model.addAttribute("model", category);
		model.addAttribute("items", getCategories());
		return "admin/category";
	}

	@RequestMapping("edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		Category category = (Category) session.get(Category.class, id);
		model.addAttribute("model", category);
		model.addAttribute("items", getCategories());
		return "admin/category";
	}

	@RequestMapping("update")
	public String update(ModelMap model, Category category) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(category);
			t.commit();
			model.addAttribute("message", "Update Secessfully!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Update fail!");
		} finally {
			session.close();
		}
		model.addAttribute("model", category);
		model.addAttribute("items", getCategories());
		return "admin/category";
	}

	@RequestMapping("delete")
	public String delete(ModelMap model, Category category) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(category);
			t.commit();
			model.addAttribute("message", "Delete Secessfully!");

			model.addAttribute("model", new Category());
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Delete fail!");

			model.addAttribute("model", category);
		} finally {
			session.close();
		}
		model.addAttribute("model", category);
		model.addAttribute("items", getCategories());
		return "admin/category";
	}
}
