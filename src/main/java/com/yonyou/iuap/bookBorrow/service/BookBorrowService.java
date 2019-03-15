package com.yonyou.iuap.bookBorrow.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.yonyou.iuap.bookBorrow.dao.BookBorrowDao;
import com.yonyou.iuap.bookBorrow.pojo.BookBorrow;
import com.yonyou.iuap.bookManagement.dao.BookInfoDao;
import com.yonyou.iuap.bookManagement.pojo.BookInfo;
import com.yonyou.iuap.example.entity.meta.Instit;
import com.yonyou.iuap.example.entity.meta.Telbook;
import com.yonyou.iuap.example.repository.meta.TelBookDao;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.persistence.vo.pub.util.StringUtil;

import org.springframework.transaction.annotation.Transactional;

@Service
public class BookBorrowService {

    @Autowired
    private BookBorrowDao bookBorrowDao;
    
    /**
     * 待归还图书列表
     * */
    public List<BookBorrow> listStayback(SearchParams searchParams){
    	List<BookBorrow> list = bookBorrowDao.listStayback(searchParams.getSearchMap());
    	return list;
    }
    
    /**
     * 已超时图书列表
     * */
    public List<BookBorrow> listTimeout(SearchParams searchParams){
    	List<BookBorrow> list = bookBorrowDao.listTimeout(searchParams.getSearchMap());
    	return list;
    }
    
    /**
     * 归还图书
     * */
    public void backbook(SearchParams searchParams){
        bookBorrowDao.backbook(searchParams.getSearchMap());
    }
    
    /**
     * 超时归还图书
     * */
    public void timeoutbackbook(SearchParams searchParams){
        bookBorrowDao.timeoutbackbook(searchParams.getSearchMap());
    }
    
    /**
     * 更新超时时长
     * */
    public void updatetimeout(){
        bookBorrowDao.updatetimeout();
    }
    
    /**
     * 保存（租用）
     */
    @Transactional
    public void save(List<BookInfo> recordList) {
    	List<BookBorrow> recordList1 = conversion(recordList);
        List<BookBorrow> addList = new ArrayList<>(recordList1.size());
        for (BookBorrow bookborrow : recordList1) {

            if (bookborrow.getId() == null) {
            	bookborrow.setId(UUID.randomUUID().toString());
            	bookborrow.setDr(0);
                addList.add(bookborrow);
            }
        }
        if (CollectionUtils.isNotEmpty(addList)) {
        	bookBorrowDao.batchInsert(addList);
        }
    }
    
    /**
     * 图书信息转租借信息
     * */
    public List<BookBorrow> conversion (List<BookInfo> list){
  	  List<BookBorrow> listrent = new ArrayList<BookBorrow>(list.size());
  	  for(int i=0;i<list.size();++i){
  		  BookBorrow borrow = new BookBorrow();
  		  borrow.setName(list.get(i).getName());
  		  borrow.setCode(list.get(i).getCode());
  		  borrow.setPublish(list.get(i).getPublish());
  		  borrow.setPrice_rent(list.get(i).getPrice_rent());
  		  borrow.setPk_booktype(list.get(i).getPk_booktype());
  		  borrow.setBooktype_name(list.get(i).getBooktype_name());
  		  borrow.setDef1(list.get(i).getDef1());
  		  
  		  listrent.add(borrow);
  	  }
  	  
  	  return listrent;
    }
}
