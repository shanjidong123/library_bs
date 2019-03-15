package com.yonyou.iuap.system.web.login;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springside.modules.security.utils.Digests;
import org.springside.modules.utils.Encodes;

import com.yonyou.iuap.auth.session.SessionManager;
import com.yonyou.iuap.auth.shiro.AuthConstants;
import com.yonyou.iuap.auth.token.ITokenProcessor;
import com.yonyou.iuap.auth.token.TokenParameter;
import com.yonyou.iuap.bookManagement.pojo.BookInfo;
import com.yonyou.iuap.example.web.BaseController;
import com.yonyou.iuap.mvc.type.SearchParams;
import com.yonyou.iuap.system.entity.LoginLog;
import com.yonyou.iuap.system.entity.MgrUser;
import com.yonyou.iuap.system.repository.LoginDao;
import com.yonyou.iuap.system.service.AccountService;

/**
 * 默认登录逻辑示例，项目使用时候根据自己的需求，添加rsa加密、配置token生成参数等
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController extends BaseController{
	
    private final Logger logger = LoggerFactory.getLogger(getClass());
	
	public static final int HASH_INTERATIONS = 1024;
	
    @Autowired
    private SessionManager sessionManager;

	@Autowired
	protected AccountService accountService;
	//为网页版本的登录Controller指定webTokenProcessor 相应的移动的指定为maTokenProcessor
	@Autowired()
	protected ITokenProcessor webTokenProcessor;
	
	@Autowired
	private LoginDao loginDao;
	
	@RequestMapping(method = RequestMethod.GET)
	public String login(Model model) {
		
		//return "login." + InvocationInfoProxy.getLocale()+".html";
		return "login";
	}
	
	@RequestMapping(method = RequestMethod.POST,value="formLogin")
	public String formLogin(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        
		/**
		 * 注意，此示例中简单验证了用户的登录过程，正规上线环境，需要考虑
		 * 前端用ras算法加密，此处用iuap-security组件中的RsaUtils解密，前端需要做输入校验
		 */
		String userName = request.getParameter("username");
        String passWord = request.getParameter("password");
		
		MgrUser user = accountService.findUserByLoginName(userName);
		if (passWord!=null && user != null) {
			byte[] hashPassword = Digests.sha1(passWord.getBytes(), Encodes.decodeHex(user.getSalt()), HASH_INTERATIONS);
			String checkPwd = Encodes.encodeHex(hashPassword);
			if(checkPwd.equals(user.getPassword())){
                
                TokenParameter tp = new TokenParameter();
                tp.setUserid(userName);
                // 设置登录时间
                tp.setLogints(String.valueOf(System.currentTimeMillis()));
                // 租户信息,saas应用登录的时候获取用户信息，设置租户id
                tp.getExt().put(AuthConstants.PARAM_TENANTID , "test_tenant_id");
                
                Cookie[] cookies = webTokenProcessor.getCookieFromTokenParameter(tp);
                Cookie ck = new Cookie("userame",userName);
                ck.setPath("/");
                for(Cookie cookie : cookies){
            	   response.addCookie(cookie);
                }
                response.addCookie(ck);
                
                loginDao.Insert(userName);
            } else {
            	logger.error("用户名密码错误!");
                model.addAttribute("accounterror", "用户名密码错误!");
                return "login";
            }
            return "redirect";
		} else {
            model.addAttribute("accounterror", "你输入的用户不存在!");
            return "login";
		}
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String fail(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName, Model model) {
		model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
		return "login";
	}
	
	/**
    *
    * @param pageRequest
    * @param searchParams
    * @return
    */
   @RequestMapping(value = "/list", method = RequestMethod.GET)
   public @ResponseBody Object page(PageRequest pageRequest, SearchParams searchParams) {
       Page<LoginLog> tmpdata = loginDao.selectAllByPage(pageRequest, searchParams.getSearchMap());
       return buildSuccess(tmpdata);
   }

}
