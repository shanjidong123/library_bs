package com.yonyou.iuap.collegeManagement.dao;

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
import com.yonyou.iuap.collegeManagement.pojo.CollegeType;
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
public class CollegeTypeDao {
	
	@Qualifier("mdBaseDAO")
	@Autowired
	private MetadataDAO metadataDAO;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
    public List<CollegeType> findAll() {
    	updateNum();
        return metadataDAO.queryAll(CollegeType.class);
    }

    public void batchInsert(List<CollegeType> addList) throws DAOException {
        metadataDAO.insert(addList);
    }

    public void batchUpdate(List<CollegeType> updateList) {
        metadataDAO.update(updateList);
    }

    public void batchDelete(List<CollegeType> list) {
        metadataDAO.remove(list);
    }
    
    public void updateNum(){
    	String sql = " update collegetype set student_num = (select count(*) from collegeinfo) where parent_id is null ";
    	jdbcTemplate.execute(sql);
    }

}
