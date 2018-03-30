package eMarket.controller;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import eMarket.entity.APIWrapper;
import eMarket.entity.Customer;

@Transactional
@Controller
@RequestMapping("user/account")
public class AccountController {
	@Autowired
	SessionFactory factory;

	@Autowired
	ServletContext app;

	@Autowired
	JavaMailSender mailler;

	@RequestMapping("register")
	public String register(ModelMap model) {
		Customer user = new Customer();
		model.addAttribute("user", user);
		return "user/account/register";
	}

	//
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(ModelMap model, @ModelAttribute("user") Customer user,
			@RequestParam("upphoto") MultipartFile upphoto) {
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

			session.save(user);
			t.commit();
			model.addAttribute("message", "Dang ki thanh cong!");

			try {
				MimeMessage mail = mailler.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(mail, "utf-8");
				helper.setFrom("", "Emarket");
				helper.setTo(user.getEmail());
				helper.setSubject("Welcome mail");
				
				String body = "<a href='http://localhost:9999/eMarket/user/account/activate/" + user.getId()
						+ ".php'>Activate</a> your account !";
				helper.setText(body, true);
				helper.setReplyTo("hiennt3006@gmail.com");

				
				mailler.send(mail);
			} catch (Exception e) {
			}
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Dang ki that bai !");
		} finally {
			session.close();
		}
		return "user/account/register";
	}

	@RequestMapping("activate/{id}")
	public String activate(@PathVariable("id") String id) {
		Session session = factory.getCurrentSession();
		Customer user = (Customer) session.get(Customer.class, id);
		user.setActivated(true);
		return "redirect:/user/account/login.php";
	}

	@RequestMapping("login")
	public String login(ModelMap model) {
		return "user/account/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(ModelMap model, @RequestParam("id") String id, @RequestParam("password") String pw,
			@RequestParam(value = "remember", defaultValue = "false") Boolean rm, HttpSession httpSession,
			HttpServletResponse response) {
		Session session = factory.getCurrentSession();
		String url = "";
		try {
			Customer user = (Customer) session.get(Customer.class, id);

			if (!user.getPassword().equals(pw)) {
				model.addAttribute("message", "Dang nhap that bai !");
				url = "user/account/login";
			} else if (!user.getActivated()) {
				model.addAttribute("message", "Tai khoan chua kich hoat!");
				url = "user/account/login";
			} else {
				model.addAttribute("message", "Dang nhap thanh cong!");
				httpSession.setAttribute("user", user);

				Cookie chkId = new Cookie("uid", user.getId());
				Cookie chkPw = new Cookie("pwd", user.getPassword());
				if (rm == true) {
					chkId.setMaxAge(30 * 24 * 60 * 60);
					chkPw.setMaxAge(30 * 24 * 60 * 60);
				} else {
					chkId.setMaxAge(0);
					chkPw.setMaxAge(0);
				}
				response.addCookie(chkId);
				response.addCookie(chkPw);

				// if(httpSession.getAttribute("returnUrl") != null){
				//
				// return "redirect:/" + httpSession.getAttribute("returnUrl");
				//
				// }
				url = "redirect:/user/home/index.php";

				// url = (String) httpSession.getAttribute("BackUrl");
				// if(url != null){
				// return "redirect:"+url;
				// }
			}
		} catch (Exception e) {
			model.addAttribute("message", "Sai tai khoan dang nhap!");
			url = "user/account/login";
		}
		return url;
	}

	// public static Customer checkLoin(String faceookID){
	// PreparedStatement ps = null;
	// ResultSet rs = null;
	// Connection con = null;
	// try{
	// con = DBConnect.getConnection();
	// String sql = "select * from Customers where facebookID=?";
	// ps = con.prepareStatement(sql);
	// ps.setString(1, faceookID);
	// rs = ps.executeQuery();
	// if(rs.next()){
	// String id = rs.getString("id");
	// String fullname = rs.getString("fullname");
	// String facebookID = rs.getString("facebookID");
	// String facebookLink = rs.getString("facebookLink");
	//
	// Customer cus = new Customer();
	// cus.setId(id);
	// cus.setFullname(fullname);
	// cus.setFacebookID(facebookID);
	// cus.setFacebookLink(facebookLink);
	// return cus;
	// }
	// } catch (SQLException ex){
	// ex.printStackTrace();
	// } finally {
	// try{
	// if(rs != null){
	// rs.close();
	// }
	// if(ps != null){
	// ps.close();
	// }
	// if(con != null){
	// con.close();
	// }
	// } catch(SQLException ex){
	// ex.printStackTrace();
	// }
	//
	// }
	//
	// return null;
	// }
	//
	// public static boolean register(String id, String fullname, String
	// facebookID, String facebookLink){
	// PreparedStatement ps = null;
	// Connection con = null;
	// try{
	// con = DBConnect.getConnection();
	// String sql = "insert into Customers(id,fullname,facebookId,facebookLink)"
	// + " values(?,?,?,?)";
	// ps = con.prepareStatement(sql);
	// ps.setString(1, id);
	// ps.setString(2, fullname);
	// ps.setString(3, facebookID);
	// ps.setString(4, facebookLink);
	// int row = ps.executeUpdate();
	// if(row >0){
	// return true;
	// }
	//
	// } catch (Exception ex){
	// ex.printStackTrace();
	// } finally {
	// try{
	// if(ps != null){
	// ps.close();
	// }
	// if(con != null){
	// con.close();
	// }
	// } catch(SQLException ex){
	// ex.printStackTrace();
	// }
	//
	// }
	//
	// return false;
	// }
	//
	// @RequestMapping("dangnhap")
	// public String dangnhap(HttpSession httpSession, HttpServletRequest
	// request,HttpServletResponse response, @RequestParam("code") String code){
	// Session session = factory.getCurrentSession();
	// // Chuyen thanh accessToken
	// APIWrapper wrapper = new APIWrapper();
	// String accessToken = wrapper.getAccessToken(code);
	// wrapper.setAccessToken(accessToken);
	//
	// Customer customer = wrapper.getUserInfo();
	// boolean userExit = AccountController.checkLoin(customer.getFacebookID())
	// != null;
	// customer =
	// (Customer)session.get(Customer.class,customer.getFacebookID());
	//
	// if(!userExit){
	// AccountController.register(customer.getId(), customer.getFullname(),
	// customer.getFacebookID(), customer.getFacebookLink());
	// }
	//
	// httpSession = request.getSession();
	// httpSession.setAttribute("user", customer);
	//
	// return "user/account/login";
	// }
	//
	@RequestMapping("logoff")
	public String logoff(HttpSession httpSession) {
		httpSession.removeAttribute("user");
		return "redirect:/user/account/login.php";
	}

	@RequestMapping("forgot")
	public String forgot() {
		return "user/account/forgot";
	}

	@RequestMapping(value = "forgot", method = RequestMethod.POST)
	public String forgot(ModelMap model, @RequestParam("id") String id, @RequestParam("email") String email) {
		Session session = factory.getCurrentSession();
		try {
			Customer user = (Customer) session.get(Customer.class, id);
			if (!user.getEmail().equals(email)) {
				model.addAttribute("message", "Sai email!");
			} else {
				try {
					MimeMessage mail = mailler.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(mail, "utf-8");
					helper.setFrom("hiennt3006@gmail.com", "eMarket");
					helper.setTo(user.getEmail());
					helper.setSubject("Mật khẩu tài khoản của bạn!");

					String body = "Nhấp vào đây để đổi mật khẩu:  "
							+ "<a href='http://localhost:9999/eMarket/user/account/changepass.php'>Link</a>";
					helper.setText(body, true);
					helper.setReplyTo("hiennt3006@gmail.com");

					mailler.send(mail);
					model.addAttribute("message", "Mat khau da qua mail !");
				} catch (Exception e) {
					model.addAttribute("message", "Gui mail that bai !");
				}
			}
		} catch (Exception e) {
			model.addAttribute("message", "Sai thong tin!");
		}
		return "user/account/forgot";
	}

	@RequestMapping("change")
	public String change() {
		return "user/account/change";
	}

	@RequestMapping(value = "change", method = RequestMethod.POST)
	public String change(ModelMap model, @RequestParam("id") String id, @RequestParam("password") String pw,
			@RequestParam("password1") String pw1, @RequestParam("password2") String pw2, HttpSession httpSession) {
		Session session = factory.getCurrentSession();
		try {
			Customer user = (Customer) session.get(Customer.class, id);
			if (!user.getPassword().equals(pw)) {
				model.addAttribute("message", "Sai Mật Khẩu");
			} else if (!pw1.equals(pw2)) {
				model.addAttribute("message", "Xác nhận mật khẩu thành công!");
			} else {
				model.addAttribute("message", "Đổi mật khẩu thành công!");
				user.setPassword(pw1);
				httpSession.setAttribute("user", user);
			}
		} catch (Exception e) {
			model.addAttribute("message", "Sai tên đăng nhập!");
		}
		return "user/account/change";
	}

	@RequestMapping("changepass")
	public String changepass() {
		return "user/account/changepass";
	}

	@RequestMapping(value = "changepass", method = RequestMethod.POST)
	public String changepass(ModelMap model, @RequestParam("id") String id, @RequestParam("password1") String pw1,
			@RequestParam("password2") String pw2, HttpSession httpSession) {
		Session session = factory.getCurrentSession();
		try {
			Customer user = (Customer) session.get(Customer.class, id);
			if (!pw1.equals(pw2)) {
				model.addAttribute("message", "Xác nhận mật khẩu thành công!");
			} else {
				model.addAttribute("message", "Đổi mật khẩu thành công!");
				user.setPassword(pw1);
				httpSession.setAttribute("user", user);
			}
		} catch (Exception e) {
			model.addAttribute("message", "Sai tên đăng nhập!");
		}
		return "user/account/changepass";
	}

	@RequestMapping("edit")
	public String edit(ModelMap model, HttpSession httpSession) {
		model.addAttribute("user", httpSession.getAttribute("user"));
		return "user/account/edit";
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(ModelMap model, @ModelAttribute("user") Customer user,
			@RequestParam("upphoto") MultipartFile upphoto, HttpSession httpSession) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			// Upload
			if (!upphoto.isEmpty()) {
				user.setPhoto(upphoto.getOriginalFilename());
				String path = app.getRealPath("/images/customers/" + user.getPhoto());
				upphoto.transferTo(new File(path));
			}

			// Cáº­p nháº­t
			session.update(user);
			t.commit();
			model.addAttribute("message", "Cập nhật thành công !");
			httpSession.setAttribute("user", user);
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Cập nhật thất bại !");
		} finally {
			session.close();
		}
		return "user/account/edit";
	}

}
