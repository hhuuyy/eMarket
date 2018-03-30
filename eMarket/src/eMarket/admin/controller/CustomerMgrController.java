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

import eMarket.entity.Customer;

@Transactional
@Controller
@RequestMapping("admin/customer")
public class CustomerMgrController {
	@Autowired
	SessionFactory factory;

	@Autowired
	ServletContext app;

	@RequestMapping("delete")
	public String delete(ModelMap model, Customer customer) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(customer);
			t.commit();
			model.addAttribute("message", "Delete Secessfully !");
			model.addAttribute("model", new Customer());
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Delete fail!");
			model.addAttribute("model", customer);
		} finally {
			session.close();
		}
		model.addAttribute("items", getCustomers());
		return "admin/customer";
	}

	@RequestMapping("update")
	public String update(ModelMap model, Customer customer, @RequestParam("upphoto") MultipartFile photo) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			// upload
			if (!photo.isEmpty()) {
				customer.setPhoto(photo.getOriginalFilename());
				String path = app.getRealPath("/images/customers/" + customer.getPhoto());
				photo.transferTo(new File(path));
			}
			// update
			session.update(customer);
			t.commit();
			model.addAttribute("message", "Update Secessfully !");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Update fail !");
		} finally {
			session.close();
		}
		model.addAttribute("model", customer);
		model.addAttribute("items", getCustomers());
		return "admin/customer";
	}

	@RequestMapping("edit/{id}")
	public String edit(ModelMap model, @PathVariable("id") String id) {
		Session session = factory.getCurrentSession();
		Customer customer = (Customer) session.get(Customer.class, id);

		model.addAttribute("model", customer);
		model.addAttribute("items", getCustomers());
		return "admin/customer";
	}

	@RequestMapping("insert")
	public String insert(ModelMap model, Customer customer, @RequestParam("upphoto") MultipartFile photo) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			// upload
			if (!photo.isEmpty()) {
				customer.setPhoto(photo.getOriginalFilename());
				String path = app.getRealPath("/images/customers/" + customer.getPhoto());
				photo.transferTo(new File(path));
			} else {
				customer.setPhoto("User.png");
			}
			// insert
			session.save(customer);
			t.commit();
			model.addAttribute("message", "Insert Secessfully !");
			model.addAttribute("model", new Customer());
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Insert fail !");
			model.addAttribute("model", customer);
		} finally {
			session.close();
		}
		model.addAttribute("items", getCustomers());
		return "admin/customer";
	}

	@RequestMapping("index")
	public String index(ModelMap model) {
		Customer customer = new Customer();
		model.addAttribute("model", customer);

		model.addAttribute("items", getCustomers());
		return "admin/customer";
	}

	private List<Customer> getCustomers() {
		String hql = "FROM Customer";
		Session session = factory.getCurrentSession();
		Query query = session.createQuery(hql);
		List<Customer> list = query.list();
		return list;
	}
}
