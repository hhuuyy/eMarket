package eMarket.admin.controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller("adminHomeController")
@RequestMapping("admin/home")
public class HomeController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("index")
	public String index(ModelMap model) {

		model.addAttribute("catess", getCates());
		Session session = factory.getCurrentSession();
		String hql = "Select p.category.nameVN," + " sum(p.quantity)," + " sum(p.quantity*p.unitPrice),"
				+ " min(p.unitPrice)," + " max(p.unitPrice)," + "	avg(p.unitPrice)"
				+ " From Product p group by p.category.nameVN";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		model.addAttribute("group", "Category");
		model.addAttribute("items", list);
		return "admin/home/index";
	}

	public long getCates() {
		Session session = factory.getCurrentSession();
		String hql = "Select count(id) from Category";
		Query query = session.createQuery(hql);
		Long c = (Long) query.uniqueResult();
		return c;
	}
}
