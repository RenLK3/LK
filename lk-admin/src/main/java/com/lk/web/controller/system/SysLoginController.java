package com.lk.web.controller.system;

import com.lk.common.annotation.Log;
import com.lk.common.core.domain.LayResult;
import com.lk.common.core.controller.BaseController;
import com.lk.common.enums.BusinessType;
import com.lk.common.exception.user.UserException;
import org.apache.logging.log4j.util.Strings;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 登录验证
 * @author LiKe_Ren
 */
@Controller
public class SysLoginController extends BaseController {

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @Log(title = "登陆",businessType = BusinessType.LOGIN)
    @PostMapping("/login")
    @ResponseBody
    public LayResult ajaxLogin(String username, String password,boolean remember){
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, remember);
        Subject subject = SecurityUtils.getSubject();

        try{
            subject.login(token);
            return ok();
        }catch (AuthenticationException e){
            String msg = "用户名或密码错误!";
            if(Strings.isNotEmpty(e.getMessage())){
                msg = e.getMessage();
            }
            return error(msg);
        }
    }

    @GetMapping("/unauth")
    public String unAuth(){
        return "unauth";
    }
}
