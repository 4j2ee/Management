package edu.xcc.svr;

import java.util.List;
import java.util.Map;

import edu.xcc.module.*;

public interface Svr01 {
	public User Dosrv(String id,String pwd);
	public List<Store> storeQuery(String qk);
	public List<Spare> spareQuery(String qk);
	public List<Income> incomeQuery(String qk);
	public List<Income> outgoQuery(String qk);
	public int ininsert(Map<String, String> map);
	public int inupdate(Map<String, String> map);
	public int indel(Map<String, String> map);
	public int outgo(Map<String, String> map);
	public int outupdate(Map<String, String> map);
	public int outdel(Map<String, String> map);
	public List<House> houseq(String qk);
	public int hsupdate(Map<String, String> map);
	public int hsin(Map<String, String> map);
	public List<Ware> wareq(String qk);
	public int warein(Map<String, String> map);
	public int wareup(Map<String, String> map);
	public List<Ioreport> irpt(Map<String, String> map);
	public List<Ioreport> outrpt(Map<String, String> map);
	public List<Ioreport> sirpt(Map<String, String> map);
	public List<Ioreport> soutrpt(Map<String, String> map);
	public List<Income> dqury();
	public int uup(String nk, String id);
	public List<User> usrQuery(String s);
	public int usrAdd(Map<String, String> map);
	public int usrEd(Map<String, String> map);
	public int usrPEd(Map<String, String> map);
	public int usrDel(Map<String, String> map);
	
}
