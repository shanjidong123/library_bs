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
import com.yonyou.iuap.bookManagement.dao.hotBookDao;
import com.yonyou.iuap.bookManagement.pojo.BookInfo;
import com.yonyou.iuap.example.entity.meta.Instit;
import com.yonyou.iuap.example.entity.meta.Telbook;
import com.yonyou.iuap.example.repository.meta.TelBookDao;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.persistence.vo.pub.util.StringUtil;

import org.springframework.transaction.annotation.Transactional;

@Service
public class hotBookService {

    @Autowired
    private hotBookDao hotBookDao;

    /**
     * 分页相关
     */
    public Page<BookInfo> selectAllByPage(PageRequest pageRequest, SearchParams searchParams) {
        return hotBookDao.selectAllByPage(pageRequest, searchParams.getSearchMap());
    }

}
