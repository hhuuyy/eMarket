package eMarket.controller;

import java.io.File;
import java.net.HttpCookie;
import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.velocity.runtime.directive.Parse;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import eMarket.component.ShoppingCart;
import eMarket.entity.Customer;
import eMarket.entity.Order;
import eMarket.entity.OrderDetail;
import eMarket.entity.Product;

@Transactional
@Controller
@RequestMapping("user/order")
public class OrderController {
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext app;
	@Autowired
	ShoppingCart cart;
	@Autowired
	JavaMailSender mailler;

	@RequestMapping("checkout")
	public String checkout(ModelMap model, HttpSession httpSession, HttpServletResponse response) {
		Customer user = (Customer) httpSession.getAttribute("users");
		Order order = new Order();
		order.setOrderDate(new Date());

		order.setAmount(cart.getAmount());
		order.setCustomer(user);
		model.addAttribute("order", order);
		model.addAttribute("cart", cart);
		return "user/order/checkout";
	}

	@RequestMapping("user")
	public String register(ModelMap model) {
		Customer user = new Customer();
		model.addAttribute("user", user);
		return "user/order/user";
	}

	@RequestMapping(value = "user", method = RequestMethod.POST)
	public String register(ModelMap model, @ModelAttribute("user") Customer user,
			@RequestParam("upphoto") MultipartFile upphoto, HttpServletResponse response, HttpSession httpSession) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();

		try {
			// upload images
			if (!upphoto.isEmpty()) {
				user.setPhoto(upphoto.getOriginalFilename());
				String path = app.getRealPath("/images/customers/" + user.getPhoto());
				upphoto.transferTo(new File(path));
			} else {
				user.setPhoto("user.png");
			}
			double a = (Math.random() * 1000);
			double c = (Math.random() * 10000);
			String b = Double.toString(a);
			String d = Double.toString(c);
			user.setId("" + a);
			user.setPassword("" + d);
			Cookie chkId = new Cookie("uidd", user.getId());
			Cookie chkPw = new Cookie("pwdd", user.getPassword());
			Cookie chkem = new Cookie("emm", user.getEmail());
			response.addCookie(chkId);
			response.addCookie(chkPw);
			response.addCookie(chkem);
			session.save(user);
			t.commit();
			model.addAttribute("message", "Dang ki thanh cong!");
			httpSession.setAttribute("users", user);
			return "redirect:/user/order/checkout.php";
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Dang ki that bai !");
		} finally {
			session.close();
		}
		return "user/order/checkout";
	}

	@RequestMapping("purchase")
	public String purchase(ModelMap model, HttpSession httpSession, @ModelAttribute("order") Order order,HttpServletResponse response) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Customer user = (Customer) httpSession.getAttribute("users");
			session.save(order);
			for (Product p : cart.getItems()) {
				OrderDetail detail = new OrderDetail();
				detail.setDiscount(p.getDiscount());
				detail.setOrder(order);
				detail.setProduct(p);
				detail.setQuantity(p.getQuantity());
				detail.setUnitPrice(p.getUnitPrice());
				System.out.println("run" + cart.getItems());
				session.save(detail);
			}
			t.commit();
			try {
				
				MimeMessage mail = mailler.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(mail, "utf-8");
				helper.setFrom("", "Emarket");
				helper.setTo(user.getEmail());
				helper.setSubject("Đơn hàng của bạn");

				String body = "giá"+order.getAmount();
				helper.setText(body, true);
				helper.setReplyTo("hiennt3006@gmail.com");

				mailler.send(mail);
			} catch (Exception e) {
			}
			cart.clear();

			model.addAttribute("message", "Dat hang thanh cong!");
			// return "redirect:/user/order/list.php";
		} catch (Exception e) {
			System.out.println("runqq");
			e.printStackTrace();
			t.rollback();
			model.addAttribute("message", "Dat hang that bai!");
		} finally {
			session.close();
		}
		return "user/order/checkout";
	}

	@RequestMapping("list/{id}")
	public String list(ModelMap model, HttpSession httpSession, @PathVariable("id") String id) {
		// Customer user = (Customer) httpSession.getAttribute("user");

		Session session = factory.getCurrentSession();
		String hql = "FROM Order WHERE order.id=:cid";
		Query query = session.createQuery(hql);
		query.setParameter("cid", id);
		List<Order> list = query.list();

		model.addAttribute("orders", list);
		return "user/order/list";
	}

	@RequestMapping("detail")
	public String detail(ModelMap model, @RequestParam("id") Integer id) {

		Session session = factory.getCurrentSession();
		Order order = (Order) session.get(Order.class, id);
		Hibernate.initialize(order.getOrderDetails());

		model.addAttribute("order", order);
		return "user/order/detail";
	}

	@RequestMapping("items")
	public String items(ModelMap model, HttpSession httpSession) {
		Customer user = (Customer) httpSession.getAttribute("user");

		Session session = factory.getCurrentSession();
		String hql = "SELECT DISTINCT d.product " + "FROM OrderDetail d " + "WHERE d.order.customer.id=:cid";
		Query query = session.createQuery(hql);
		query.setParameter("cid", user.getId());
		List<Product> list = query.list();

		model.addAttribute("prods", list);
		return "user/product/list";
	}
}
