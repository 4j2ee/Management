package edu.xcc.hmeq;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import edu.xcc.module.User;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession(true);  
		  // 从session 里面获取用户名的信息  
		  User u = (User) session.getAttribute("user");  
		  // 判断如果没有取到用户信息，就跳转到登陆页面，提示用户进行登陆  
		  if (u == null) {
			  //System.out.println("已拦截未登录用户"); 
		   res.sendRedirect("login");
		   return false;
		  }
		  else{
			  //System.out.println(u.getName()+"登录了");
		//System.out.println("经过拦截");
		return true;
		}
	}

}
