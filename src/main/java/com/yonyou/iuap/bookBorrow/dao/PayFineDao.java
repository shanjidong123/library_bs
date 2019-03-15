package com.yonyou.iuap.bookBorrow.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.yonyou.iuap.bookBorrow.pojo.BookBorrow;
import com.yonyou.iuap.bookBorrow.pojo.PayFine;
import com.yonyou.iuap.bookManagement.pojo.BookInfo;
import com.yonyou.iuap.example.entity.meta.Instit;
import com.yonyou.iuap.example.entity.meta.Telbook;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.bs.dao.MetadataDAO;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;
import com.yonyou.iuap.persistence.jdbc.framework.util.SQLHelper;

@Repository
public class PayFineDao {

  private Logger logger = LoggerFactory.getLogger(PayFineDao.class);

  @Autowired
  private MetadataDAO metadataDAO;
  
  @Autowired
  private JdbcTemplate jdbcTemplate;
  
  @Autowired
  private HttpServletRequest request;

  public List<PayFine> noborrowList(Map<String,Object> searchParams){
  	String sql = " select * from payFine where payfine_state = '未缴纳' ";
  	SQLParameter parameter = new SQLParameter();
  	if(!searchParams.isEmpty()){
  		sql += " and ";
  		for(String key : searchParams.keySet()){
  			if(key.equals("searchParam")){
  				sql += " (code like ? or name like ?) and ";
  				parameter.addParam("%" + searchParams.get(key).toString() + "%");
  				parameter.addParam("%" + searchParams.get(key).toString() + "%");
  			}
  		}
  		sql = sql.substring(0,sql.length()-4);
  	}
  	sql += " and user_name = '" + getLoginUsername() + "'";
  	return metadataDAO.queryByClause(PayFine.class, sql, parameter);
  }
  
  public List<PayFine> borrowList(Map<String,Object> searchParams){
	  	String sql = " select * from payFine where payfine_state = '已缴纳' ";
	  	SQLParameter parameter = new SQLParameter();
	  	if(!searchParams.isEmpty()){
	  		sql += " and ";
	  		for(String key : searchParams.keySet()){
	  			if(key.equals("searchParam")){
	  				sql += " (code like ? or name like ?) and ";
	  				parameter.addParam("%" + searchParams.get(key).toString() + "%");
	  				parameter.addParam("%" + searchParams.get(key).toString() + "%");
	  			}
	  		}
	  		sql = sql.substring(0,sql.length()-4);
	  	}
	  	sql += " and user_name = '" + getLoginUsername() + "'";
	  	return metadataDAO.queryByClause(PayFine.class, sql, parameter);
  }
  
  public String getLoginUsername(){
	  Cookie [] cookie = request.getCookies();
	  String username = "";
	  if(cookie != null){
		  for(Cookie ck : cookie){
			  if(ck.getName().equals("userame")){
				  username = ck.getValue();
				  break;
			  }
		  }
	  }
	  
	  return username;
  }
  
  public Map<String,Object> getnameandmoney(){
	  	String userName = getLoginUsername();
	  	String sql = "select money,name from mgr_user where login_name = '" + userName + "'";
	  	Map<String,Object> map = jdbcTemplate.queryForMap(sql);
	  	
	  	return map;
  }
  
  public String pay(List<PayFine> list){
	  for(PayFine pay : list){
		  if(pay.getUser_name()!=null && !pay.getUser_name().equals("")){
			  String sql = " select money from mgr_user where login_name = '" + pay.getUser_name() + "'";
			  String money = jdbcTemplate.queryForObject(sql, String.class);
			  if(Double.valueOf(money) > Double.valueOf(pay.getPay_fine())){
				  double differ = Double.valueOf(money) - Double.valueOf(pay.getPay_fine());
				  String sql1 = "update mgr_user set money = " + differ + " where login_name = '" + pay.getUser_name() + "'";
				  String sql2 = "update payfine set payfine_state = '已缴纳',def1 = '" + getTime() + "'"
						  + " where id = '" + pay.getId() + "'";
				  jdbcTemplate.execute(sql1);
				  jdbcTemplate.execute(sql2);
			  }else{
				  return "fail";
			  }
		  }
	  }
	  
	  return "success";
  }
  
  public String topUp(Map<String,Object> searchParams){
	  if(!searchParams.isEmpty()){
		  String sql = " update mgr_user set money = money + " + Double.valueOf(searchParams.get("topUpParam").toString()) + " where login_name ='"
				  + getLoginUsername() + "'";
		  jdbcTemplate.execute(sql);
		  return "success"; 
	  }
	  
	  return "fail"; 
  }
  
  public String getTime(){
	  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  return df.format(new Date());
  }
  
}
