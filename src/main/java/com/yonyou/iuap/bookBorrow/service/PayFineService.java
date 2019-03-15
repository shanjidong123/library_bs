package com.yonyou.iuap.bookBorrow.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.yonyou.iuap.bookBorrow.dao.BookBorrowDao;
import com.yonyou.iuap.bookBorrow.dao.PayFineDao;
import com.yonyou.iuap.bookBorrow.pojo.BookBorrow;
import com.yonyou.iuap.bookBorrow.pojo.PayFine;
import com.yonyou.iuap.bookManagement.dao.BookInfoDao;
import com.yonyou.iuap.bookManagement.pojo.BookInfo;
import com.yonyou.iuap.example.entity.meta.Instit;
import com.yonyou.iuap.example.entity.meta.Telbook;
import com.yonyou.iuap.example.repository.meta.TelBookDao;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.persistence.vo.pub.util.StringUtil;

import org.springframework.transaction.annotation.Transactional;

@Service
public class PayFineService {

    @Autowired
    private PayFineDao payFineDao;
    
    /**
     * 罚款未缴纳列表
     * */
    public List<PayFine> noborrowList(SearchParams searchParams){
    	List<PayFine> list = payFineDao.noborrowList(searchParams.getSearchMap());
    	return list;
    }
    
    /**
     * 罚款已缴纳列表
     * */
    public List<PayFine> borrowList(SearchParams searchParams){
    	List<PayFine> list = payFineDao.borrowList(searchParams.getSearchMap());
    	return list;
    }
    
    /**
     * 获取用户名称和余额
     * */
    public Map<String,Object> getnameandmoney(){
    	return payFineDao.getnameandmoney();
    }
    
    /**
     * 缴纳罚款
     * */
    public String pay(List<PayFine> list){
    	return payFineDao.pay(list);
    }
    
    /**
     * 充值
     * */
    public String topUp(SearchParams searchParams){
    	return payFineDao.topUp(searchParams.getSearchMap());
    }
}
