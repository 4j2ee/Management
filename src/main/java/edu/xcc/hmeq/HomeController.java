package edu.xcc.hmeq;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.xcc.module.Income;
import edu.xcc.module.User;
import edu.xcc.svr.Svr01;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Resource
	private Svr01 svr01;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
			return "login";
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String dologin(HttpServletRequest req) throws UnsupportedEncodingException{
		req.setCharacterEncoding("UTF-8");
		String name=req.getParameter("user").toString();
		String pwd=req.getParameter("pwd").toString();
		HttpSession session=req.getSession(true);
		User u=svr01.Dosrv(name, pwd);
		if(u==null){
			session.setAttribute("stat", "登录信息错误");
			return "login";
		}
		else{
			//System.out.println(name+u.getRole());
			List<Income> l=svr01.dqury(); 
			session.setAttribute("user", u);session.setAttribute("msg", l);
			return "redirect:/";
			}
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		HttpSession session=req.getSession(true);
		session.invalidate();
		System.out.println("logout");
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/income", method = RequestMethod.GET)
	public String income() {
		return "income";
	}
	@RequestMapping(value = "/wareq", method = RequestMethod.GET)
	public String wareq() {
		return "wareq";
	}
	@RequestMapping(value = "/inedit", method = RequestMethod.GET)
	public String inedit() {
		return "inedit";
	}
	@RequestMapping(value = "/outgo", method = RequestMethod.GET)
	public String outgo() {
		return "outgo";
	}@RequestMapping(value = "/outedit", method = RequestMethod.GET)
	public String outedit() {
		return "outedit";
	}
	@RequestMapping(value = "/house", method = RequestMethod.GET)
	public String house(){
		return "houseq";
	}
	@RequestMapping(value = "/houseed", method = RequestMethod.GET)
	public String houseed(){
		return "houseed";
	}
	@RequestMapping(value = "/houseadd", method = RequestMethod.GET)
	public String houseadd(){
		return "houseadd";
	}
	@RequestMapping(value = "/wareadd", method = RequestMethod.GET)
	public String wareadd(){
		return "wareadd";
	}
	@RequestMapping(value = "/wareed", method = RequestMethod.GET)
	public String wareed(){
		return "wareed";
	}
	@RequestMapping(value = "/inreport", method = RequestMethod.GET)
	public String inrep(){
		return "inreport";
	}
	@RequestMapping(value = "/outreport", method = RequestMethod.GET)
	public String outrep(){
		return "outreport";
	}
	@RequestMapping(value = "/otreport", method = RequestMethod.GET)
	public String ottrep(){
		return "otreport";
	}
	@RequestMapping(value = "/usermng", method = RequestMethod.GET)
	public String umng(HttpServletRequest req){
		HttpSession session=req.getSession(true);
		User u=(User)session.getAttribute("user");
		if(u.getRole().equals("管理员")){
		return "usermng";}
		else{return "redirect:/";}
	}
}
