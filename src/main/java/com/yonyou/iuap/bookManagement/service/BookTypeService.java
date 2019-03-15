package com.yonyou.iuap.bookManagement.service;

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
public class BookTypeService {
	
    @Autowired
    private BookTypeDao bookTypeDao;
    
    /**
     * 查询所有图书类别
     * 
     * @return
     */
    public List<BookType> selectAll() {
        return bookTypeDao.findAll();
    }

    /**
     * 保存图书类别
     * 
     * @param recordList
     */
    @Transactional
    public void save(List<BookType> recordList) {
        List<BookType> addList = new ArrayList<>(recordList.size());
        List<BookType> updateList = new ArrayList<>(recordList.size());
        for (BookType book : recordList) {

            if (book.getId() == null) {
            	book.setId(UUID.randomUUID().toString());
            	book.setDr(0);
                addList.add(book);
            } else {
                updateList.add(book);
            }
        }
        if (CollectionUtils.isNotEmpty(addList)) {
        	bookTypeDao.batchInsert(addList);
        }
        if (CollectionUtils.isNotEmpty(updateList)) {
        	bookTypeDao.batchUpdate(updateList);
        }
    }

    /**
     * 删除图书类别
     * 
     * @param list
     */
    public void batchDeleteByPrimaryKey(List<BookType> list) {
    	bookTypeDao.batchDelete(list);
    }

}
