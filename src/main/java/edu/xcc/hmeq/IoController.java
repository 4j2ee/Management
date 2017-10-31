package edu.xcc.hmeq;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.xcc.module.*;
import edu.xcc.svr.Svr01;

@Controller
public class IoController {
	@Resource
	private Svr01 svr01;
	@RequestMapping(value = "/wquery", method = RequestMethod.GET)
	public String wQery(){
		return "wquery";
	}
	
	@RequestMapping(value = "/stquery", method = RequestMethod.GET)
	@ResponseBody
	public List<Store> storeQuery(HttpServletRequest req){
		List<Store> list=new ArrayList<Store>();
		list=svr01.storeQuery(req.getParameter("sk"));
		return list;
	}
	
	@RequestMapping(value = "/spquery", method = RequestMethod.POST)
	@ResponseBody
	public List<Spare> spareQuery(@RequestParam String sk){
		List<Spare> spare=svr01.spareQuery(sk);
		return spare;
	}
	
	@RequestMapping(value = "/imquery", method = RequestMethod.POST)
	@ResponseBody
	public List<Income> incomQuery(@RequestParam String sk){
		List<Income> income=svr01.incomeQuery(sk);
		return income;
	}
	
	@RequestMapping(value = "/ogquery", method = RequestMethod.POST)
	@ResponseBody
	public List<Income> outgoQuery(@RequestParam String sk){
		List<Income> outgo=svr01.outgoQuery(sk);
		return outgo;
	}
	
	@RequestMapping(value = "/inin", method = RequestMethod.POST)
	@ResponseBody
	public int ininsert(@RequestParam String sk,HttpServletRequest req){
		int n=0;
		try {
			n=svr01.ininsert(rmap(sk,req));
		} catch (Exception e) {
			n=0;
		}
		return n;
	}
	@RequestMapping(value = "/inup", method = RequestMethod.POST)
	@ResponseBody
	public int inupdate(@RequestParam String sk,HttpServletRequest req){
		int n=svr01.inupdate(rmap(sk,req));
		return n;
	}
	@RequestMapping(value = "/indel", method = RequestMethod.POST)
	@ResponseBody
	public int indel(@RequestParam String sk,HttpServletRequest req){
		int n=svr01.indel(rmap(sk,req));
		return n;
	}
	@RequestMapping(value = "/outin", method = RequestMethod.POST)
	@ResponseBody
	public int outgo(@RequestParam String sk,HttpServletRequest req){
		int n=0;
		try {
			n=svr01.outgo(rmap(sk,req));
		} catch (Exception e) {
			n=0;
		}
		return n;
	}
	@RequestMapping(value = "/outup", method = RequestMethod.POST)
	@ResponseBody
	public int outupdate(@RequestParam String sk,HttpServletRequest req){
		int n=svr01.outupdate(rmap(sk,req));
		return n;
	}
	@RequestMapping(value = "/outdel", method = RequestMethod.POST)
	@ResponseBody
	public int outdel(@RequestParam String sk,HttpServletRequest req){
		int n=svr01.outdel(rmap(sk,req));
		return n;
	}
	
	@RequestMapping(value = "/hsup", method = RequestMethod.POST)
	@ResponseBody
	public int hsup(@RequestParam String sk,HttpServletRequest req){
		int n=svr01.hsupdate(rmap(sk,req));
		return n;
	}
	@RequestMapping(value = "/hsin", method = RequestMethod.POST)
	@ResponseBody
	public int hsin(@RequestParam String sk,HttpServletRequest req){
		int n=0;
		try {
			n=svr01.hsin(rmap(sk,req));
		} catch (Exception e) {
			n=0;
		}
		return n;
	}
	@RequestMapping(value = "/warein", method = RequestMethod.POST)
	@ResponseBody
	public int warein(@RequestParam String sk,HttpServletRequest req){
		int n=0;
		try {
			n=svr01.warein(rmap(sk,req));
		} catch (Exception e) {
			n=0;
		}
		return n;
	}
	@RequestMapping(value = "/wareup", method = RequestMethod.POST)
	@ResponseBody
	public int wareup(@RequestParam String sk,HttpServletRequest req){
		int n=svr01.wareup(rmap(sk,req));
		return n;
	}
	
	@RequestMapping(value = "/irpt", method = RequestMethod.POST)
	@ResponseBody
	public List<Ioreport> irpt(@RequestParam String sk,HttpServletRequest req){
		List<Ioreport> l=svr01.irpt(rmap(sk,req));
		return l;
	}
	
	@RequestMapping(value = "/outrpt", method = RequestMethod.POST)
	@ResponseBody
	public List<Ioreport> outrpt(@RequestParam String sk,HttpServletRequest req){
		List<Ioreport> l=svr01.outrpt(rmap(sk,req));
		return l;
	}
	
	@RequestMapping(value = "/othrpt", method = RequestMethod.POST)
	@ResponseBody
	public List<Ioreport> othrpt(@RequestParam String sk,HttpServletRequest req){
		List<Ioreport> l=svr01.sirpt(rmap(sk,req));
		return l;
	}
	
	@RequestMapping(value = "/usradd", method = RequestMethod.POST)
	@ResponseBody
	public int usradd(@RequestParam String sk){
		Map<String, String> map = new HashMap<String, String>();
		String[] dbl=sk.split("&");
		for(String s : dbl){
			String[] l=s.split("=");
			if(l.length<2)
			map.put(l[0],"");
			else
				map.put(l[0], l[1]);
			}
		int n;
		try{n=svr01.usrAdd(map);}
		catch(Exception e){
			n=0;
		}
		return n;
	}
	
	@RequestMapping(value = "/usred", method = RequestMethod.POST)
	@ResponseBody
	public int usred(@RequestParam String sk){
		Map<String, String> map = new HashMap<String, String>();
		String[] dbl=sk.split("&");
		for(String s : dbl){
			String[] l=s.split("=");
			if(l.length<2)
			map.put(l[0],"");
			else
				map.put(l[0], l[1]);
			}
		int n=0;
		try{
			if(map.get("npwd").equals(""))
				n=svr01.usrEd(map);
			else
				n=svr01.usrPEd(map);
			}
		catch(Exception e){
			n=0;
		}
		return n;
	}
	@RequestMapping(value = "/usrdel", method = RequestMethod.POST)
	@ResponseBody
	public int usrdel(@RequestParam String sk){
		Map<String, String> map = new HashMap<String, String>();
		String[] dbl=sk.split("&");
		for(String s : dbl){
			String[] l=s.split("=");
			if(l.length<2)
			map.put(l[0],"");
			else
				map.put(l[0], l[1]);
			}
		int n=0;
		try{
				n=svr01.usrDel(map);
			}
		catch(Exception e){
			n=0;
		}
		return n;
	}
	
	public Map<String,String> rmap(String sk,HttpServletRequest req){
		Map<String, String> map = new HashMap<String, String>();
		String[] dbl=sk.split("&");
		for(String s : dbl){
			String[] l=s.split("=");
			if(l.length<2)
			map.put(l[0],"");
			else
				map.put(l[0], l[1]);
			}
		HttpSession session=req.getSession(true);
		User u=(User)session.getAttribute("user");
		map.put("oid", u.getId());map.put("bcd", map.get("bcd[]"));map.put("hid", map.get("hid[]"));
		map.remove("bcd[]");map.remove("hid[]");
		System.out.println(map);
		return map;
	}
}
