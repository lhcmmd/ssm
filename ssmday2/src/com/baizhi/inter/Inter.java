package com.baizhi.inter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class Inter implements HandlerInterceptor{

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.out.println("3_________________");
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		System.out.println("2__________________");
	}
//«Î«Û¿πΩÿ
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		System.out.println("1_______________");
		HttpSession session = request.getSession(true);
		Object value = session.getAttribute("loginflag");
	
		System.out.println(value);
		if(value==null){
			
			response.sendRedirect("/ssmday2/view/login.jsp");
			return false;
		}
		else{
		return true;}
	}

}
