package com.yonyou.iuap.bookManagement.dao;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

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
public class hotBookDao {

  private Logger logger = LoggerFactory.getLogger(hotBookDao.class);

  @Autowired
  private MetadataDAO metadataDAO;
  
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
      }
      sql.delete(sql.length() - 4, sql.length());
    }
    sql.append(" order by def1 desc ");
    return metadataDAO.queryPage(sql.toString(), sqlparam, pageRequest, BookInfo.class);
  }
}
