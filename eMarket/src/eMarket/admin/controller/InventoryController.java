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
@Controller
@RequestMapping("admin/inventory")
public class InventoryController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("bycategory")
	public String byCategory(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "Select p.category.nameVN," + " sum(p.quantity)," + " sum(p.quantity*p.unitPrice),"
				+ " min(p.unitPrice)," + " max(p.unitPrice)," + "	avg(p.unitPrice)"
				+ " From Product p group by p.category.nameVN";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		model.addAttribute("items", list);
		model.addAttribute("group", "Category");
		return "admin/inventory";
	}

	@RequestMapping("bysupplier")
	public String bySupplier(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "Select p.supplier.name," + " sum(p.quantity)," + " sum(p.quantity*p.unitPrice),"
				+ " min(p.unitPrice)," + " max(p.unitPrice)," + "	avg(p.unitPrice)"
				+ " From Product p group by p.supplier.name";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		model.addAttribute("items", list);
		model.addAttribute("group", "Supplier");
		return "admin/inventory";
	}

	

}
