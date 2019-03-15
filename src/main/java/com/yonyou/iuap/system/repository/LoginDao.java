package com.yonyou.iuap.system.repository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.yonyou.iuap.bookManagement.dao.hotBookDao;
import com.yonyou.iuap.bookManagement.pojo.BookInfo;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.bs.dao.MetadataDAO;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.system.entity.LoginLog;
import com.yonyou.iuap.system.utils.IpUtil;

@Repository
public class LoginDao {
	
  private Logger logger = LoggerFactory.getLogger(hotBookDao.class);

  @Autowired
  private MetadataDAO metadataDAO;
  
  @Autowired
  private HttpServletRequest httpServletRequest;
  
  @Autowired
  private JdbcTemplate jdbcTemplate;
  
  public String findNameByLogin(String LoginName){
	  String sql = "select name from mgr_user where login_name = '"+LoginName+"'";
	  return jdbcTemplate.queryForObject(sql, String.class);
  }
  
  public void Insert(String LoginName){
	  String name = findNameByLogin(LoginName);
	  DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	  String login_time = df.format(new Date());
	  String login_ip = IpUtil.getIpAddr(httpServletRequest);
	  LoginLog loginLog = new LoginLog();
	  loginLog.setId(UUID.randomUUID().toString());
	  loginLog.setName(name);
	  loginLog.setLogin_time(login_time);
	  loginLog.setLogin_ip(login_ip);
	  loginLog.setLogin_type("PC");
	  
	  metadataDAO.insert(loginLog);
  }
  
  /**
   * 分页相关
   * */
  public Page<LoginLog> selectAllByPage( PageRequest pageRequest , Map<String, Object> searchParams )
	    throws DAOException {
	
	  StringBuilder sql = new StringBuilder("select * from loginlog ");
	  SQLParameter sqlparam = new SQLParameter();
	
	  if (null != searchParams && !searchParams.isEmpty()) {
	    sql.append(" where ");
	    for (Entry<String, Object> key : searchParams.entrySet()) {
	    	if (key.getKey().equalsIgnoreCase("searchParam")) {
	    		sql.append(" (name like ?) AND ");
	    		sqlparam.addParam("%" + key.getValue() + "%");
	    	}
	    	}
	    	sql.delete(sql.length() - 4, sql.length());
	  	}
	  	sql.append(" order by login_time desc ");
	  	return metadataDAO.queryPage(sql.toString(), sqlparam, pageRequest, LoginLog.class);
  	}
	
}
