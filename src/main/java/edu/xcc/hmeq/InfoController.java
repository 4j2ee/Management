package edu.xcc.hmeq;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.xcc.module.House;
import edu.xcc.module.User;
import edu.xcc.module.Ware;
import edu.xcc.svr.Svr01;

@Controller
public class InfoController {
	@Resource
	private Svr01 svr01;
	@RequestMapping(value = "/wareQuery", method = RequestMethod.POST)
	@ResponseBody
	public List<Ware> ware(@RequestParam String sk){
		List<Ware> wr=svr01.wareq(sk);
		return wr;
	}
	@RequestMapping(value = "/hsQuery", method = RequestMethod.POST)
	@ResponseBody
	public List<House> house(@RequestParam String sk){
		List<House> hs=svr01.houseq(sk);
		return hs;
	}
	@RequestMapping(value = "/mesag", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView msg(HttpServletRequest req){
		ModelAndView mv=new ModelAndView("message");
		HttpSession s=req.getSession(true);
		mv.addObject("msg",s.getAttribute("msg"));
		return mv;
	}
	
	@RequestMapping(value = "/pwchg", method = RequestMethod.GET)
	public String pwchg(){
		return "pwchg";
	}
	
	@RequestMapping(value = "/pwdr", method = RequestMethod.POST)
	@ResponseBody
	public boolean pwdr(HttpServletRequest req){
		HttpSession s=req.getSession(true);
		User u= (User)s.getAttribute("user");
		if(svr01.Dosrv(u.getId(), req.getParameter("ok"))!=null){
			svr01.uup(req.getParameter("nk"), u.getId());
			return true;
		}else
		{return false;}
	}
	
	@RequestMapping(value = "/usrquery", method = RequestMethod.POST)
	@ResponseBody
	public List<User> useQuery(@RequestParam String sk){
		List<User> hs=svr01.usrQuery(sk);
		return hs;
	}
 
}
