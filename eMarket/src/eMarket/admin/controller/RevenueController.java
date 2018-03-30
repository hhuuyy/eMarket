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
@RequestMapping("admin/revenue")
public class RevenueController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("byquarter")
	public String byQuater(ModelMap model) {
		Session session = factory.getCurrentSession();
		// lấy số nguyên trên dùng hàm Ceiling

		String hql = "SELECT " + "	Cast(Ceiling(month(d.order.orderDate)/3.0) as integer) as Q,"
				+ "	SUM(d.quantity), " + "	SUM(d.quantity*d.unitPrice*(1-d.discount)), " + "	MIN(d.unitPrice), "
				+ "	MAX(d.unitPrice), " + "	AVG(d.unitPrice)" + " FROM OrderDetail d "
				+ " GROUP BY Ceiling(month(d.order.orderDate)/3.0)" + " ORDER BY Q";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();

		model.addAttribute("items", list);
		model.addAttribute("group", "Quater");

		return "admin/revenue";
	}

	@RequestMapping("bymonth")
	public String byMonth(ModelMap model) {
		Session session = factory.getCurrentSession();

		String hql = "SELECT " + "	month(d.order.orderDate) as MN," + "	SUM(d.quantity), "
				+ "	SUM(d.quantity*d.unitPrice*(1-d.discount)), " + "	MIN(d.unitPrice), " + "	MAX(d.unitPrice), "
				+ "	AVG(d.unitPrice)" + " FROM OrderDetail d " + " GROUP BY month(d.order.orderDate)"
				+ " ORDER BY MN DESC";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();

		model.addAttribute("items", list);
		model.addAttribute("group", "Month");

		return "admin/revenue";
	}

	@RequestMapping("byyear")
	public String byYear(ModelMap model) {
		Session session = factory.getCurrentSession();

		String hql = "SELECT " + "	year(d.order.orderDate) as YR," + "	SUM(d.quantity), "
				+ "	SUM(d.quantity*d.unitPrice*(1-d.discount)) as DS, " + "	MIN(d.unitPrice), " + "	MAX(d.unitPrice), "
				+ "	AVG(d.unitPrice)" + " FROM OrderDetail d " + " GROUP BY year(d.order.orderDate)"
				+ " ORDER BY YR DESC";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();

		model.addAttribute("items", list);
		model.addAttribute("group", "Year");

		return "admin/revenue";
	}

	@RequestMapping("bysupplier")
	public String bySupplier(ModelMap model) {
		Session session = factory.getCurrentSession();

		String hql = "SELECT " + "	d.product.supplier.name," + "	SUM(d.quantity), "
				+ "	SUM(d.quantity*d.unitPrice*(1-d.discount)), " + "	MIN(d.unitPrice), " + "	MAX(d.unitPrice), "
				+ "	AVG(d.unitPrice)" + " FROM OrderDetail d " + " GROUP BY d.product.supplier.name";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();

		model.addAttribute("items", list);
		model.addAttribute("group", "Supplier");

		return "admin/revenue";
	}

	@RequestMapping("bycategory")
	public String byCategory(ModelMap model) {
		Session session = factory.getCurrentSession();

		String hql = "SELECT " + "	d.product.category.nameVN," + "	SUM(d.quantity), "
				+ "	SUM(d.quantity*d.unitPrice*(1-d.discount)), " + "	MIN(d.unitPrice), " + "	MAX(d.unitPrice), "
				+ "	AVG(d.unitPrice)" + " FROM OrderDetail d " + " GROUP BY d.product.category.nameVN";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();

		model.addAttribute("items", list);
		model.addAttribute("group", "Category");

		return "admin/revenue";
	}

}
