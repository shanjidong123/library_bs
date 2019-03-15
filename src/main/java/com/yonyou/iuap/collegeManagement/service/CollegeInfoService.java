package com.yonyou.iuap.collegeManagement.service;

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
import com.yonyou.iuap.collegeManagement.dao.CollegeInfoDao;
import com.yonyou.iuap.collegeManagement.pojo.CollegeInfo;
import com.yonyou.iuap.example.entity.meta.Instit;
import com.yonyou.iuap.example.entity.meta.Telbook;
import com.yonyou.iuap.example.repository.meta.TelBookDao;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.persistence.vo.pub.util.StringUtil;

import org.springframework.transaction.annotation.Transactional;

@Service
public class CollegeInfoService {

    @Autowired
    private CollegeInfoDao collegeInfoDao;

    /**
     * 分页相关
     */
    public Page<CollegeInfo> selectAllByPage(PageRequest pageRequest, SearchParams searchParams) {
        return collegeInfoDao.selectAllByPage(pageRequest, searchParams.getSearchMap());
    }

    /**
     * 保存（插入和更新）
     */
    @Transactional
    public void save(List<CollegeInfo> recordList) {
        List<CollegeInfo> addList = new ArrayList<>(recordList.size());
        List<CollegeInfo> updateList = new ArrayList<>(recordList.size());
        for (CollegeInfo collegeinfo : recordList) {

            if (collegeinfo.getId() == null) {
            	collegeinfo.setId(UUID.randomUUID().toString());
            	collegeinfo.setDr(0);
                addList.add(collegeinfo);
            } else {
                updateList.add(collegeinfo);
            }
        }
        if (CollectionUtils.isNotEmpty(addList)) {
        	collegeInfoDao.batchInsert(addList);
        }
        if (CollectionUtils.isNotEmpty(updateList)) {
        	collegeInfoDao.batchUpdate(updateList);
        }
    }

    /**
     * 批量删除
     */
    public void batchDeleteByPrimaryKey(List<CollegeInfo> list) {
    	collegeInfoDao.batchDelete(list);
    }
    
    /**
     * 批量登录授权
     * @throws Exception 
     */
    public void batchAuthorization(List<CollegeInfo> list) throws Exception {
    	collegeInfoDao.batchAuthorization(list);
    }
}
