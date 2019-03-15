package com.yonyou.iuap.collegeManagement.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
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

import com.sun.tools.internal.ws.wsdl.document.jaxws.Exception;
import com.yonyou.iuap.bookManagement.pojo.BookInfo;
import com.yonyou.iuap.collegeManagement.pojo.CollegeInfo;
import com.yonyou.iuap.example.entity.meta.Instit;
import com.yonyou.iuap.example.entity.meta.Telbook;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.bs.dao.MetadataDAO;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;
import com.yonyou.iuap.persistence.jdbc.framework.util.SQLHelper;
import com.yonyou.iuap.system.entity.MgrUser;

@Repository
public class CollegeInfoDao {

  private Logger logger = LoggerFactory.getLogger(CollegeInfoDao.class);

  @Autowired
  private MetadataDAO metadataDAO;
  
  @Autowired
  private JdbcTemplate jdbcTemplate;
  
  @Autowired
  private HttpServletRequest request;

	/**
	 *分页相关
	 */
  public Page<CollegeInfo> selectAllByPage( PageRequest pageRequest , Map<String, Object> searchParams )
      throws DAOException {

	StringBuilder sql = new StringBuilder("select * from collegeinfo ");
    SQLParameter sqlparam = new SQLParameter();

    if (null != searchParams && !searchParams.isEmpty()) {
      sql.append(" where ");
      for (Entry<String, Object> key : searchParams.entrySet()) {
        if (key.getKey().equalsIgnoreCase("searchParam")) {
        	sql.append(" (name like ? OR code like ? ) AND ");
        	for (int i = 0; i < 2; i++) {
            sqlparam.addParam("%" + key.getValue() + "%");
          }
        }
        else if (key.getKey().equalsIgnoreCase("collegeTypeIds")) {
          sql.append(" pk_collegetype in (");
          String value = (String) key.getValue();
          String[] ids = value.split(",");
          for (String s : ids) {
        	  sql.append("? ,");
            sqlparam.addParam(s);
          }
          sql.deleteCharAt(sql.length() - 1);
          sql.append(") AND ");
        }
      }
      sql.delete(sql.length() - 4, sql.length());
    }
    return metadataDAO.queryPage(sql.toString(), sqlparam, pageRequest, CollegeInfo.class);
  }

	/**
	 *批量操作
	 */
  public void batchInsert( List<CollegeInfo> addList ) throws DAOException {
    metadataDAO.insert(addList);
    addNum(addList);
  }

  public void batchUpdate( List<CollegeInfo> updateList ) throws DAOException {

    metadataDAO.update(updateList);
  }

  public void batchDelete( List<CollegeInfo> list ) throws DAOException {

    metadataDAO.remove(list);
    deleteNum(list);
  }
  
  public void batchAuthorization( List<CollegeInfo> list ) throws java.lang.Exception {
	  for(CollegeInfo c : list){
		  if(c.getLogin_status().equals("已授权")){
			  throw new java.lang.Exception(c.getName()+"已经授权,请勿重复授权!");
		  }else{
			  MgrUser mgrUser = new MgrUser();
			  mgrUser.setId(UUID.randomUUID().toString());
			  mgrUser.setLoginName(c.getCode());
			  mgrUser.setName(c.getName());
			  mgrUser.setPassword("691b14d79bf0fa2215f155235df5e670b64394cc");
			  mgrUser.setSalt("7efbd59d9741d34f");
			  mgrUser.setRoles("user");
			  mgrUser.setMoney(0);
			  DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			  String format = df.format(new Date());
			  
			  String sql = "insert into mgr_user values('"+mgrUser.getId()+"','"+mgrUser.getLoginName()+"','"
					  +mgrUser.getName()+"','"+mgrUser.getPassword()+"','"+mgrUser.getSalt()+"','"+mgrUser.getRoles()
					  +"','"+format+"',"+mgrUser.getMoney()+")";
			  String sql1 = "update collegeinfo set login_status = '已授权' where id = '"+c.getId()+"'";
			  jdbcTemplate.execute(sql);
			  jdbcTemplate.execute(sql1);
		  }
	  }
	  
  }
  
  public void addNum(List<CollegeInfo> addList){
	  StringBuffer sql = new StringBuffer();
	  for(CollegeInfo college : addList){
		  sql.append("update collegetype set student_num = student_num + 1 where id = '");
		  sql.append(college.getPk_collegetype() + "'");
		  jdbcTemplate.execute(sql.toString());
	  }
  }
  
  public void deleteNum(List<CollegeInfo> delList){
	  StringBuffer sql = new StringBuffer();
	  for(CollegeInfo college : delList){
		  sql.append("update collegetype set student_num = student_num - 1 where id = '");
		  sql.append(college.getPk_collegetype() + "'");
		  jdbcTemplate.execute(sql.toString());
	  }
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
}
