package eMarket.admin.controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.databind.ObjectMapper;
import eMarket.entity.security.Master;
import eMarket.entity.security.MasterRole;
import eMarket.entity.security.Role;

@Transactional
@Controller
@RequestMapping("admin/master-role")
public class MasterRoleController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("index")
	public String index() {
		return "admin/master-role";
	}

	@ResponseBody
	@RequestMapping("update")
	public String update(@RequestParam("mid") String mid, @RequestParam("rid") String rid,
			@RequestParam("state") Boolean state) {
		Session session = factory.getCurrentSession();
		if (state == true) {
			Role role = (Role) session.get(Role.class, rid);
			Master master = (Master) session.get(Master.class, mid);
			MasterRole masterRole = new MasterRole();
			masterRole.setMaster(master);
			masterRole.setRole(role);
			session.save(masterRole);
			return "Secessfully";
		} else {
			String hql = "DELETE MasterRole" + " WHERE master.id=:mid AND role.id=:rid";
			Query query = session.createQuery(hql);
			query.setParameter("mid", mid);
			query.setParameter("rid", rid);
			query.executeUpdate();

			return "Secessfully";
		}
	}

	@ResponseBody
	@RequestMapping("get-roles")
	public String getRolesByMasters(@RequestParam("masterId") String mid) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT mr.role.id " + " FROM MasterRole mr " + " WHERE mr.master.id=:mid";
		Query query = session.createQuery(hql);
		query.setParameter("mid", mid);
		List<String> roleIds = query.list();

		try {
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(roleIds);
			return json;
		} catch (Exception e) {
			return "[]";
		}
	}

	@ModelAttribute("roles")
	public List<Role> getRoles() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Role";
		Query query = session.createQuery(hql);
		List<Role> list = query.list();
		return list;
	}

	@ModelAttribute("masters")
	public List<Master> getMaster() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Master";
		Query query = session.createQuery(hql);
		List<Master> list = query.list();
		return list;
	}
}
