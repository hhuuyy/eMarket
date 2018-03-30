package eMarket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import eMarket.entity.Category;
import eMarket.entity.Product;
import eMarket.entity.SubCategory;
import eMarket.util.HibernateUtils;

@Transactional
@Controller
@RequestMapping("user/home")
public class HomeController {

	@Autowired
	SessionFactory factory;

	@RequestMapping("index")
	public String index(ModelMap model) {

		Session session = factory.getCurrentSession();
		// Hiện hàng đặc biệt Special
		String hql3 = "From Product WHERE special=true";
		Query query3 = session.createQuery(hql3);
		List<Product> list3 = query3.list();
		model.addAttribute("specials", list3);

		// Hiện hàng đặc biệt Special
		String hql4 = "From Product WHERE latest=true";
		Query query4 = session.createQuery(hql4);
		List<Product> list4 = query4.list();
		model.addAttribute("latests", list4);

		String hql5 = "From Product WHERE discount>0";
		Query query5 = session.createQuery(hql5);
		List<Product> list5 = query5.list();
		model.addAttribute("discounts", list5);

		// Hiện hàng bán chạy
		String hql = "FROM Product ORDER BY SIZE(orderDetails)";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		model.addAttribute("orders", list);

		// Hiện hàng bán chạy
		String hql2 = "FROM Supplier";
		Query query2 = session.createQuery(hql2);
		List<Product> list2 = query2.list();
		model.addAttribute("sups", list2);
		return "user/home/index";
	}

	@RequestMapping("product")
	public String product(ModelMap model) {
		String hql = "FROM Product";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		model.addAttribute("prods", list);
		return "user/home/product";
	}
}
