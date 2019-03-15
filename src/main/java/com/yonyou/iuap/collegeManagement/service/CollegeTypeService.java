package com.yonyou.iuap.collegeManagement.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.yonyou.iuap.bookManagement.dao.BookTypeDao;
import com.yonyou.iuap.bookManagement.pojo.BookType;
import com.yonyou.iuap.collegeManagement.dao.CollegeTypeDao;
import com.yonyou.iuap.collegeManagement.pojo.CollegeType;
import com.yonyou.iuap.example.entity.meta.Instit;
import com.yonyou.iuap.example.repository.meta.InstitDao;
import com.yonyou.iuap.mvc.type.SearchParams;

import org.springframework.transaction.annotation.Transactional;

/**
 * <p>Title: BookTypeService</p>
 * <p>Description: </p>
 * @author sjd
 */

@Service
public class CollegeTypeService {
	
    @Autowired
    private CollegeTypeDao collegeTypeDao;
    
    /**
     * 查询所有学院类别
     * 
     * @return
     */
    public List<CollegeType> selectAll() {
        return collegeTypeDao.findAll();
    }

    /**
     * 保存学院类别
     * 
     * @param recordList
     */
    @Transactional
    public void save(List<CollegeType> recordList) {
        List<CollegeType> addList = new ArrayList<>(recordList.size());
        List<CollegeType> updateList = new ArrayList<>(recordList.size());
        for (CollegeType college : recordList) {

            if (college.getId() == null) {
            	college.setId(UUID.randomUUID().toString());
            	college.setDr(0);
                addList.add(college);
            } else {
                updateList.add(college);
            }
        }
        if (CollectionUtils.isNotEmpty(addList)) {
        	collegeTypeDao.batchInsert(addList);
        }
        if (CollectionUtils.isNotEmpty(updateList)) {
        	collegeTypeDao.batchUpdate(updateList);
        }
    }

    /**
     * 删除学院类别
     * 
     * @param list
     */
    public void batchDeleteByPrimaryKey(List<CollegeType> list) {
    	collegeTypeDao.batchDelete(list);
    }

}
