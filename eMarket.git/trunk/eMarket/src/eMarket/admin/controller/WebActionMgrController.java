package eMarket.admin.controller;

import java.util.List;

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

import eMarket.entity.security.WebAction;

@Transactional
@Controller
@RequestMapping("admin/web-action")
public class WebActionMgrController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("delete")
	public String delete(ModelMap model, WebAction webAction) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(webAction);
			t.commit();
			model.addAttribute("message", "Delete Secessfully  !");
			model.addAttribute("model", new WebAction());
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Delete fail !");
			model.addAttribute("model", webAction);
		} finally {
			session.close();
		}
		model.addAttribute("items", getWebActions());
		return "admin/web-action";
	}

	@RequestMapping("update")
	public String update(ModelMap model, WebAction webAction) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(webAction);
			t.commit();
			model.addAttribute("message", "Update Secessfully !");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Update fail !");
		} finally {
			session.close();
		}
		model.addAttribute("model", webAction);
		model.addAttribute("items", getWebActions());
		return "admin/web-action";
	}

	@RequestMapping("edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") Integer id) {
		Session session = factory.getCurrentSession();
		WebAction webAction = (WebAction) session.get(WebAction.class, id);

		model.addAttribute("model", webAction);
		model.addAttribute("items", getWebActions());
		return "admin/web-action";
	}

	@RequestMapping("insert")
	public String insert(ModelMap model, WebAction webAction) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(webAction);
			t.commit();
			model.addAttribute("message", "Insert Secessfully !");
			model.addAttribute("model", new WebAction());
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Insert fail!");
			model.addAttribute("model", webAction);
		} finally {
			session.close();
		}
		model.addAttribute("items", getWebActions());
		return "admin/web-action";
	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		WebAction webAction = new WebAction();
		model.addAttribute("model", webAction);

		model.addAttribute("items", getWebActions());
		return "admin/web-action";
	}

	@SuppressWarnings("unchecked")
	private List<WebAction> getWebActions() {
		String hql = "FROM WebAction";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<WebAction> list = query.list();
		return list;
	}
}
