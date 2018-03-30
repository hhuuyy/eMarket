<%@ page pageEncoding="utf-8"%>
<%

	String view = request.getParameter("view");
	if(view.startsWith("user/")){
		pageContext.forward("layout_user.jsp");
	}
	else if(view.startsWith("admin/")){
		pageContext.forward("layout_admin.jsp");
	}
	else if(view.startsWith("order/")) {
		pageContext.forward("layout_other.jsp");
	}
%>