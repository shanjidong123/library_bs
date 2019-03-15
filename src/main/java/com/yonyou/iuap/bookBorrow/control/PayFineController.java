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
import com.yonyou.iuap.bookBorrow.pojo.PayFine;
import com.yonyou.iuap.bookBorrow.service.BookBorrowService;
import com.yonyou.iuap.bookBorrow.service.PayFineService;
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
@RequestMapping(value = "/payFine")
public class PayFineController extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(PayFineController.class);

    @Autowired
    private PayFineService payFineService;
    
    /**
     * 罚款未缴纳列表
     * */
    @RequestMapping(value = "/noBorrowList", method = RequestMethod.GET)
	public @ResponseBody Object noborrowList(SearchParams searchParams){
		List<PayFine> list = payFineService.noborrowList(searchParams);
		return buildSuccess(list);
	}	
    
    /**
     * 罚款已缴纳列表
     * */
    @RequestMapping(value = "/BorrowList", method = RequestMethod.GET)
	public @ResponseBody Object borrowList(SearchParams searchParams){
		List<PayFine> list = payFineService.borrowList(searchParams);
		return buildSuccess(list);
	}	
    
    /**
     * 获取用户名称和余额
     * */
    @RequestMapping(value = "/getNameAndMoney", method = RequestMethod.GET)
    public @ResponseBody Object getnameandmoney() {
    	Map<String,Object> map = payFineService.getnameandmoney();
        return buildSuccess(map);
    }
    
    /**
     * 缴纳罚款
     * */
    @RequestMapping(value = "/pay", method = RequestMethod.POST)
    public @ResponseBody Object pay(@RequestBody List<PayFine> list) {
    	String result = payFineService.pay(list);
        return buildSuccess(result);
    }
    
    /**
     * 充值
     * */
    @RequestMapping(value = "/topUp", method = RequestMethod.GET)
	public @ResponseBody Object topUp(SearchParams searchParams){
    	String result = payFineService.topUp(searchParams);
		return buildSuccess(result);
	}	
}
