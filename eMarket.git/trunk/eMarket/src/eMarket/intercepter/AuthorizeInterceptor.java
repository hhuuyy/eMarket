package eMarket.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import eMarket.entity.security.Master;

public class AuthorizeInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession httpSession = request.getSession();
		Master master = (Master) httpSession.getAttribute("master");
		String cpath = request.getContextPath();
		String url = request.getRequestURI().replace(cpath, "");
		if(master == null){
			httpSession.setAttribute("AdminBackUrl", url);
			response.sendRedirect(cpath+"/order/login.php");
			return false;
		}
		return true;
	}
}
