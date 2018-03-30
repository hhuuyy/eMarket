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

import eMarket.entity.security.ActionRole;
import eMarket.entity.security.Role;
import eMarket.entity.security.WebAction;

@Transactional
@Controller
@RequestMapping("admin/web-action-role")
public class ActionRoleController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index() {
		return "admin/web-action-role";
	}
	
	@ResponseBody
	@RequestMapping("get-actions")
	public String getActionsByRole(@RequestParam("rid") String rid) {
		Session session =factory.getCurrentSession();
		String hql = "SELECT webAction.id " +
				" FROM ActionRole  " +
				" WHERE role.id=:rid";
		Query query = session.createQuery(hql);
		query.setParameter("rid", rid);
		List<String> actionIds = query.list();
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			String json = mapper.writeValueAsString(actionIds);
			return json;	
		} 
		catch (Exception e) {
			return "[]";
		}
	}
	
	@ResponseBody
	@RequestMapping("update")
	public String update(@RequestParam("aid") Integer aid, 
			@RequestParam("rid") String rid, 
			@RequestParam("state") Boolean state) {
		Session session = factory.getCurrentSession();
		if(state == true){
			Role role = (Role) session.get(Role.class, rid);
			WebAction action = (WebAction) session.get(WebAction.class, aid);
			ActionRole actionRole = new ActionRole();
			actionRole.setWebAction(action);
			actionRole.setRole(role);
			session.save(actionRole);
			return "Successfully!";
		}
		else{
			String hql = "DELETE ActionRole" +
					" WHERE webAction.id=:aid AND role.id=:rid";
			Query query = session.createQuery(hql);
			query.setParameter("aid", aid);
			query.setParameter("rid", rid);
			query.executeUpdate();
			
			return "Successfully!";
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
	
	@ModelAttribute("actions")
	public List<WebAction> getAction() {
		Session session = factory.getCurrentSession();
		String hql = "FROM WebAction";
		Query query = session.createQuery(hql);
		List<WebAction> list = query.list();
		return list;
	}
}
