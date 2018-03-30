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

import eMarket.entity.security.Master;

@Transactional
@Controller
@RequestMapping("admin/master")
public class MasterMgrController {
	@Autowired
	SessionFactory factory;

	@Autowired
	ServletContext app;

	@RequestMapping("delete")
	public String delete(ModelMap model, Master master) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(master);
			t.commit();
			model.addAttribute("message", "Delete Secessfully !");
			model.addAttribute("model", new Master());
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Delete fail !");
			model.addAttribute("model", master);
		} finally {
			session.close();
		}
		model.addAttribute("items", getMasters());
		return "admin/master";
	}

	@RequestMapping("update")
	public String update(ModelMap model, Master master) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
		
			session.update(master);
			t.commit();
			model.addAttribute("message", "Update Secessfully!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Update fail!");
		} finally {
			session.close();
		}
		model.addAttribute("model", master);
		model.addAttribute("items", getMasters());
		return "admin/master";
	}

	@RequestMapping("edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") String id) {
		Session session = factory.getCurrentSession();
		Master master = (Master) session.get(Master.class, id);

		model.addAttribute("model", master);
		model.addAttribute("items", getMasters());
		return "admin/master";
	}

	@RequestMapping("insert")
	public String insert(ModelMap model, Master master) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(master);
			t.commit();
			model.addAttribute("message", "Insert Secessfully!");
			model.addAttribute("model", new Master());
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Insert fail !");
			model.addAttribute("model", master);
		} finally {
			session.close();
		}
		model.addAttribute("items", getMasters());
		return "admin/master";
	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		Master master = new Master();
		model.addAttribute("model", master);

		model.addAttribute("items", getMasters());
		return "admin/master";
	}

	@SuppressWarnings("unchecked")
	private List<Master> getMasters() {
		String hql = "FROM Master";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Master> list = query.list();
		return list;
	}
}
