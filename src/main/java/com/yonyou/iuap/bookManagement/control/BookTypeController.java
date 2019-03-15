package com.yonyou.iuap.bookManagement.control;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yonyou.iuap.bookManagement.pojo.BookType;
import com.yonyou.iuap.bookManagement.service.BookTypeService;
import com.yonyou.iuap.example.entity.meta.Instit;
import com.yonyou.iuap.example.service.InstitService;
import com.yonyou.iuap.example.validator.InstitValidator;
import com.yonyou.iuap.example.web.BaseController;

/**
 * <p>
 * Title: BookTypeController
 * </p>
 * <p>
 * Description:
 * </p>
 * 
 * @author sjd
 */

@Controller
@RequestMapping(value = "/bookType")
public class BookTypeController extends BaseController {
    public static Logger logger = LoggerFactory.getLogger(BookTypeController.class);

    @Autowired
    private BookTypeService bookTypeService;

    /**
     * 获取图书类别列表
     * 
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody Object list() {
        List<BookType> data = bookTypeService.selectAll();
        return buildSuccess(data);
    }

    /**
     * 保存图书类别
     * 
     * @param list
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public @ResponseBody Object save(@RequestBody List<BookType> list) {
    	bookTypeService.save(list);
        return buildSuccess();
    }

    /**
     * 删除图书类别
     * 
     * @param list
     * @return
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public @ResponseBody Object del(@RequestBody List<BookType> list) {
    	bookTypeService.batchDeleteByPrimaryKey(list);
        return buildSuccess();
    }
}
