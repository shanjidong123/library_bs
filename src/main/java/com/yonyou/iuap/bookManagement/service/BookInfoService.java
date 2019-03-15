package com.yonyou.iuap.bookManagement.service;

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

import com.yonyou.iuap.bookManagement.dao.BookInfoDao;
import com.yonyou.iuap.bookManagement.pojo.BookInfo;
import com.yonyou.iuap.example.entity.meta.Instit;
import com.yonyou.iuap.example.entity.meta.Telbook;
import com.yonyou.iuap.example.repository.meta.TelBookDao;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.persistence.vo.pub.util.StringUtil;

import org.springframework.transaction.annotation.Transactional;

@Service
public class BookInfoService {

    @Autowired
    private BookInfoDao bookInfoDao;

    /**
     * 分页相关
     */
    public Page<BookInfo> selectAllByPage(PageRequest pageRequest, SearchParams searchParams) {
        return bookInfoDao.selectAllByPage(pageRequest, searchParams.getSearchMap());
    }

    /**
     * 保存（插入和更新）
     */
    @Transactional
    public void save(List<BookInfo> recordList) {
        List<BookInfo> addList = new ArrayList<>(recordList.size());
        List<BookInfo> updateList = new ArrayList<>(recordList.size());
        for (BookInfo bookinfo : recordList) {

            if (bookinfo.getId() == null) {
            	bookinfo.setId(UUID.randomUUID().toString());
            	bookinfo.setDr(0);
                addList.add(bookinfo);
            } else {
                updateList.add(bookinfo);
            }
        }
        if (CollectionUtils.isNotEmpty(addList)) {
        	bookInfoDao.batchInsert(addList);
        }
        if (CollectionUtils.isNotEmpty(updateList)) {
        	bookInfoDao.batchUpdate(updateList);
        }
    }

    /**
     * 批量删除
     */
    public void batchDeleteByPrimaryKey(List<BookInfo> list) {
    	bookInfoDao.batchDelete(list);
    }
}
