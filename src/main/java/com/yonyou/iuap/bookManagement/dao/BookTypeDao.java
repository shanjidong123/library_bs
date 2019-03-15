package com.yonyou.iuap.bookManagement.dao;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.yonyou.iuap.bookManagement.pojo.BookType;
import com.yonyou.iuap.example.entity.meta.Instit;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.bs.dao.MetadataDAO;
import com.yonyou.iuap.persistence.jdbc.framework.SQLParameter;
import com.yonyou.iuap.persistence.jdbc.framework.util.FastBeanHelper;

/**
 * <p>Title: BookTypeDao</p>
 * <p>Description: </p>
 * @author sjd
 */
@Repository
public class BookTypeDao {
	
	@Qualifier("mdBaseDAO")
	@Autowired
	private MetadataDAO metadataDAO;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
    public List<BookType> findAll() {
    	updateNum();
        return metadataDAO.queryAll(BookType.class);
    }

    public void batchInsert(List<BookType> addList) throws DAOException {
        metadataDAO.insert(addList);
    }

    public void batchUpdate(List<BookType> updateList) {
        metadataDAO.update(updateList);
    }

    public void batchDelete(List<BookType> list) {
        metadataDAO.remove(list);
    }
    
    public void updateNum(){
    	String sql = " update booktype set book_num = (select count(*) from bookinfo) where parent_id is null ";
    	jdbcTemplate.execute(sql);
    }

}
