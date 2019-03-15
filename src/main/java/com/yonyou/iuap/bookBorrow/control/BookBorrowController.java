package com.yonyou.iuap.bookBorrow.control;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yonyou.iuap.bookBorrow.pojo.BookBorrow;
import com.yonyou.iuap.bookBorrow.service.BookBorrowService;
import com.yonyou.iuap.bookManagement.pojo.BookInfo;
import com.yonyou.iuap.bookManagement.service.BookInfoService;
import com.yonyou.iuap.example.entity.meta.EnumVo;
import com.yonyou.iuap.example.entity.meta.Sex;
import com.yonyou.iuap.example.entity.meta.Telbook;
import com.yonyou.iuap.example.service.TelBookService;
import com.yonyou.iuap.example.utils.EnumUtils;
import com.yonyou.iuap.example.validator.TelBookValidator;
import com.yonyou.iuap.example.web.BaseController;
import com.yonyou.iuap.mvc.type.SearchParams;

@Controller
@RequestMapping(value = "/bookBorrow")
public class BookBorrowController extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(BookBorrowController.class);

    @Autowired
    private BookBorrowService bookBorrowService;
    
    /**
     * 待归还图书列表
     * */
    @RequestMapping(value = "/staybackList", method = RequestMethod.GET)
	public @ResponseBody Object listStayback(SearchParams searchParams){
		List<BookBorrow> list = bookBorrowService.listStayback(searchParams);
		return buildSuccess(list);
	}	
    
    /**
     * 已超时图书列表
     * */
    @RequestMapping(value = "/timeoutList", method = RequestMethod.GET)
	public @ResponseBody Object listTimeout(SearchParams searchParams){
		List<BookBorrow> list = bookBorrowService.listTimeout(searchParams);
		return buildSuccess(list);
	}	
    
    /**
     * 归还图书
     * */
    @RequestMapping(value = "/backBook", method = RequestMethod.GET)
	public @ResponseBody Object backbook(SearchParams searchParams){
		bookBorrowService.backbook(searchParams);
		return buildSuccess();
	}	
    
    /**
     * 超时归还图书
     * */
    @RequestMapping(value = "/timeoutBackBook", method = RequestMethod.GET)
	public @ResponseBody Object timeoutbackbook(SearchParams searchParams){
		bookBorrowService.timeoutbackbook(searchParams);
		return buildSuccess();
	}	
    
    /**
     * 租用图书
     * */
    @RequestMapping(value = "/borrow", method = RequestMethod.POST)
    public @ResponseBody Object save(@RequestBody List<BookInfo> list) {
    	bookBorrowService.save(list);
        return buildSuccess();
    }
    
    /**
     * 更新超时时长
     * */
    @RequestMapping(value = "/updateTimeout", method = RequestMethod.GET)
    public @ResponseBody Object updatetimeout() {
    	bookBorrowService.updatetimeout();
        return buildSuccess();
    }
}
