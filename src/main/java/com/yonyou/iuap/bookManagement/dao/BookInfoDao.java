package com.yonyou.iuap.bookManagement.dao;

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

import com.yonyou.iuap.bookManagement.pojo.BookInfo;
import com.yonyou.iuap.example.entity.meta.Instit;
import com.yonyou.iuap.example.entity.meta.Telbook;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.bs.dao.MetadataDAO;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;
import com.yonyou.iuap.persistence.jdbc.framework.util.SQLHelper;

@Repository
public class BookInfoDao {

  private Logger logger = LoggerFactory.getLogger(BookInfoDao.class);

  @Autowired
  private MetadataDAO metadataDAO;
  
  @Autowired
  private JdbcTemplate jdbcTemplate;
  
  @Autowired
  private HttpServletRequest request;

	/**
	 *分页相关
	 */
  public Page<BookInfo> selectAllByPage( PageRequest pageRequest , Map<String, Object> searchParams )
      throws DAOException {

	StringBuilder sql = new StringBuilder("select * from bookinfo ");
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
        else if (key.getKey().equalsIgnoreCase("bookTypeIds")) {
          sql.append(" pk_booktype in (");
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
    return metadataDAO.queryPage(sql.toString(), sqlparam, pageRequest, BookInfo.class);
  }

	/**
	 *批量操作
	 */
  public void batchInsert( List<BookInfo> addList ) throws DAOException {
	for(BookInfo book : addList){
		book.setDef1("0");
		book.setDef2(getLoginUsername());
	}
    metadataDAO.insert(addList);
    addNum(addList);
  }

  public void batchUpdate( List<BookInfo> updateList ) throws DAOException {

    metadataDAO.update(updateList);
  }

  public void batchDelete( List<BookInfo> list ) throws DAOException {

    metadataDAO.remove(list);
    deleteNum(list);
  }
  
  public void addNum(List<BookInfo> addList){
	  StringBuffer sql = new StringBuffer();
	  for(BookInfo book : addList){
		  sql.append("update bookType set book_num = book_num + 1 where id = '");
		  sql.append(book.getPk_booktype() + "'");
		  jdbcTemplate.execute(sql.toString());
	  }
  }
  
  public void deleteNum(List<BookInfo> addList){
	  StringBuffer sql = new StringBuffer();
	  for(BookInfo book : addList){
		  sql.append("update bookType set book_num = book_num - 1 where id = '");
		  sql.append(book.getPk_booktype() + "'");
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
