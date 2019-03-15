package com.yonyou.iuap.bookManagement.control;

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
@RequestMapping(value = "/bookInfo")
public class BookInfoController extends BaseController {
    private static Logger logger = LoggerFactory.getLogger(BookInfoController.class);

    @Autowired
    private BookInfoService bookInfoService;

    /**
     *
     * @param pageRequest
     * @param searchParams
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public @ResponseBody Object page(PageRequest pageRequest, SearchParams searchParams) {
        Page<BookInfo> tmpdata = bookInfoService.selectAllByPage(pageRequest, searchParams);
        return buildSuccess(tmpdata);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public @ResponseBody Object save(@RequestBody List<BookInfo> list) {
    	bookInfoService.save(list);
        return buildSuccess();
    }

    @RequestMapping(value = "/del", method = RequestMethod.POST)
    public @ResponseBody Object del(@RequestBody List<BookInfo> list) {
    	bookInfoService.batchDeleteByPrimaryKey(list);
        return buildSuccess();
    }
}
