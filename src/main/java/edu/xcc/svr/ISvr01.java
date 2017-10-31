package edu.xcc.svr;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.xcc.dao.Logon;
import edu.xcc.module.*;
@Service
public class ISvr01 implements Svr01{
	@Autowired
	private Logon logon;
	public User Dosrv(String id,String pwd){
		return logon.LogQuery(id,pwd);
	}
	public List<Store> storeQuery(String qk){
		List<Store> store=logon.StoreQuery(qk);
		return store;
	}
	@Override
	public List<Spare> spareQuery(String qk) {
		List<Spare> spare=logon.SpareQuery(qk);
		return spare;
	}
	@Override
	public List<Income> incomeQuery(String qk) {
		List<Income> incom=logon.IncomeQuery(qk);
		return incom;
	}
	@Override
	public List<Income> outgoQuery(String qk) {
		List<Income> outgo=logon.OutgoQuery(qk);
		return outgo;
	}
	@Override
	public int ininsert(Map<String, String> map) {
		int n=logon.Inisrt(map);
		return n;
	}
	@Override
	public int inupdate(Map<String, String> map) {
		int n=logon.Inupdate(map);
		return n;
	}
	@Override
	public int indel(Map<String, String> map) {
		int n=logon.Indel(map);
		return n;
	}
	@Override
	public int outgo(Map<String, String> map) {
		int n=logon.Outgo(map);
		return n;
	}
	@Override
	public int outupdate(Map<String, String> map) {
		int n=logon.Outupdate(map);
		return n;
	}
	@Override
	public int outdel(Map<String, String> map) {
		int n=logon.Outdel(map);
		return n;
	}
	@Override
	public List<House> houseq(String qk) {
		List<House> house=logon.Houseq(qk);
		return house;
	}
	public int hsupdate(Map<String, String> map){
		int n=logon.Hsupdate(map);
		return n;
	}
	
	
	
	@Override
	public List<Ware> wareq(String qk) {
		List<Ware> ware=logon.Wareq(qk);
		return ware;
	}
	@Override
	public int hsin(Map<String, String> map) {
		int n=logon.Hsin(map);
		return n;
	}
	@Override
	public int warein(Map<String, String> map) {
		int n=logon.Warein(map);
		return n;
	}
	@Override
	public int wareup(Map<String, String> map) {
		int n=logon.Wareup(map);
		return n;
	}
	@Override
	public List<Ioreport> irpt(Map<String, String> map) {
		List<Ioreport> l=logon.Irpt(map);
		return l;
	}
	@Override
	public List<Ioreport> outrpt(Map<String, String> map) {
		List<Ioreport> l=logon.Outrpt(map);
		return l;
	}
	@Override
	public List<Ioreport> sirpt(Map<String, String> map) {
		if(map.get("se").equals("2")){
			List<Ioreport> l=soutrpt(map);
			return l;}
		else{
			List<Ioreport> l=logon.Sirpt(map);
		return l;
		}
	}
	@Override
	public List<Ioreport> soutrpt(Map<String, String> map) {
		List<Ioreport> l=logon.Soutrpt(map);
		return l;
	}
	@Override
	public List<Income> dqury() {
		List<Income> l=logon.Dqury();
		return l;
	}
	@Override
	public int uup(String nk, String id) {
		int n=logon.Uup(nk, id);
		return n;
	}
	@Override
	public List<User> usrQuery(String s) {
		List<User> l=logon.usrQuery(s);
		return l;
	}
	@Override
	public int usrAdd(Map<String, String> map){
		int n=logon.usrAdd(map);
		return n;
	}
	@Override
	public int usrEd(Map<String, String> map) {
		int n=logon.usrEd(map);
		return n;
	}
	@Override
	public int usrPEd(Map<String, String> map) {
		int n=logon.usrPEd(map);
		return n;
	}
	@Override
	public int usrDel(Map<String, String> map) {
		int n=logon.usrDel(map);
		return n;
	}
}
