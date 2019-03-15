package com.yonyou.iuap.bookBorrow.dao;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
public class BookBorrowDao {

  private Logger logger = LoggerFactory.getLogger(BookBorrowDao.class);

  @Autowired
  private MetadataDAO metadataDAO;
  
  @Autowired
  private JdbcTemplate jdbcTemplate;
  
  @Autowired
  private HttpServletRequest request;

  public List<BookBorrow> listStayback(Map<String,Object> searchParams){
	String userName = getLoginUsername();  
  	String sql = " select * from bookborrow where state = '待归还' and login_user = '" + userName + "'";
  	SQLParameter parameter = new SQLParameter();
  	if(!searchParams.isEmpty()){
  		sql += " and ";
  		for(String key : searchParams.keySet()){
  			if(key.equals("searchParam")){
  				sql += " (name like ? or code like ?) and ";
  				parameter.addParam("%" + searchParams.get(key).toString() + "%");
  				parameter.addParam("%" + searchParams.get(key).toString() + "%");
  			}
  		}
  		sql = sql.substring(0,sql.length()-4);
  	}
  	return metadataDAO.queryByClause(BookBorrow.class, sql, parameter);
  }
  
  public List<BookBorrow> listTimeout(Map<String,Object> searchParams){
	  	String userName = getLoginUsername();
	  	String sql = " select * from bookborrow where state = '已超时' and login_user = '" + userName + "'";
	  	SQLParameter parameter = new SQLParameter();
	  	if(!searchParams.isEmpty()){
	  		sql += " and ";
	  		for(String key : searchParams.keySet()){
	  			if(key.equals("searchParam")){
	  				sql += " (name like ? or code like ?) and ";
	  				parameter.addParam("%" + searchParams.get(key).toString() + "%");
	  				parameter.addParam("%" + searchParams.get(key).toString() + "%");
	  			}
	  		}
	  		sql = sql.substring(0,sql.length()-4);
	  	}
	  	return metadataDAO.queryByClause(BookBorrow.class, sql, parameter);
	  }
  
  public void backbook(Map<String,Object> searchParams){
	  	String sql = " update bookborrow set state = '已归还' ";
	  	if(!searchParams.isEmpty()){
	  		for(String key : searchParams.keySet()){
	  			if(key.equals("pk")){
	  				sql += " where id = '" + searchParams.get(key) + "'";
	  			}
	  		}
	  	}
	  	
	  	jdbcTemplate.execute(sql);
  }
  
  public void timeoutbackbook(Map<String,Object> searchParams){
	  	String sql = " update bookborrow set state = '已归还' ";
	  	String pk = "";
	  	if(!searchParams.isEmpty()){
	  		for(String key : searchParams.keySet()){
	  			if(key.equals("pk")){
	  				sql += " where id = '" + searchParams.get(key) + "'";
	  				pk = searchParams.get(key).toString();
	  			}
	  		}
	  	}
	  	
	  	jdbcTemplate.execute(sql);
	  	metadataDAO.insert(findByPk(pk));
}
  
  public void batchInsert( List<BookBorrow> addList ) throws DAOException {
	for(BookBorrow book : addList){
		book.setState("待归还");
		book.setLogin_user(getLoginUsername());
	}
    metadataDAO.insert(addList);
    updateTime(addList);
  }
  
  public PayFine findByPk(String pk){
	  String sql = "select name,code,price_rent,login_user,timeout_length from bookborrow where id = '"
			  	+ pk + "'";
	  Map<String,Object> map = jdbcTemplate.queryForMap(sql);
	  PayFine p = new PayFine();
	  if(!map.isEmpty()){
		  p.setName(map.get("name").toString());
		  p.setCode(map.get("code").toString());
		  p.setPrice_timeoutrent(map.get("price_rent").toString());
		  p.setUser_name(map.get("login_user").toString());
		  p.setTimeout_length(map.get("timeout_length").toString());
		  p.setPayfine_state("未缴纳");
		  p.setPay_fine(conversion(map.get("price_rent").toString(), map.get("timeout_length").toString()));
	  }
	  
	  return p;
  }
  
  public String conversion(String price,String length){
	  DecimalFormat df=new DecimalFormat("0.0");
	  Double fine = Double.valueOf(price) * Double.valueOf(length);
	  return String.valueOf(df.format(fine));
  }
  
  public void updateTime(List<BookBorrow> addList){
	  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  Date date1 = new Date();
	  long diff = date1.getTime() + (1000 * 60 * 60 * 24 * 3);
	  Date date2 = new Date(diff);
	  for(BookBorrow book : addList){
		String sql = "update bookborrow set provisions_back = '" + df.format(date2) + "'";
		sql += ",def2 = '" + df.format(date1) + "' where id = '" + book.getId() + "'";
		jdbcTemplate.execute(sql);
	  }
  }

  public void batchUpdate( List<BookInfo> updateList ) throws DAOException {

    metadataDAO.update(updateList);
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
  
  public void updatetimeout(){
	  	String sql = "select id , provisions_back from bookborrow where state = '待归还' or state = '已超时'";
	  	List<Map<String,Object>> list = jdbcTemplate.queryForList(sql);
	  	for(Map<String,Object> map : list){
	  		if(map.get("id") != null && map.get("provisions_back") != null){
	  			String sql1 = "update bookborrow set timeout_length = '" + compareTime(map.get("provisions_back").toString()) + "'";
	  			if(!compareTime(map.get("provisions_back").toString()).equals("")){
	  				sql1 += " , state = '已超时' ";
	  			}
	  			sql1 += " where id = '" + map.get("id").toString() + "'";
	  			jdbcTemplate.execute(sql1);
	  		}
	  	}
  }
  
  public String compareTime(String dataTime){
	  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  String day = "";
	  try{
		  Date d1 = new Date();
		  Date d2 = df.parse(dataTime);
		  if(d1.getTime() > d2.getTime()){
			 long diff = d1.getTime() - d2.getTime();
			 long days = diff/(1000 * 60 * 60 * 24);
			 if(diff % (1000 * 60 * 60 * 24) != 0){
				 days += 1;
			 }
			 day = String.valueOf(days);
		  }
	  }catch(Exception e){
		  
	  }
	  
	  return day;
  }
  
}
