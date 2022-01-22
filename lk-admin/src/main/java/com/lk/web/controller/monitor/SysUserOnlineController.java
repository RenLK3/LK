package com.lk.web.controller.monitor;

import com.lk.common.annotation.Log;
import com.lk.common.core.controller.BaseController;
import com.lk.common.core.domain.LayResult;
import com.lk.common.core.text.Convert;
import com.lk.common.enums.BusinessType;
import com.lk.common.enums.OnlineStatus;
import com.lk.common.utils.ShiroUtils;
import com.lk.framework.shiro.session.OnlineSession;
import com.lk.framework.shiro.session.OnlineSessionDAO;
import com.lk.system.domain.SysUserOnline;
import com.lk.system.service.ISysUserOnlineService;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 在线用户
 * @author LiKe_Ren
 */
@Controller
@RequestMapping("/monitor/online")
public class SysUserOnlineController extends BaseController {

    private String prefix = "monitor/online";

    @Autowired
    private ISysUserOnlineService userOnlineService;

    @Autowired
    private OnlineSessionDAO onlineSessionDAO;

    @RequiresPermissions("monitor:online:view")
    @GetMapping()
    public String online()
    {
        return prefix + "/online";
    }

    @RequiresPermissions("monitor:online:list")
    @PostMapping("/list")
    @ResponseBody
    public LayResult list(SysUserOnline userOnline, int page, int limit)
    {
        List<SysUserOnline> list = userOnlineService.selectUserOnlineList(userOnline);
        return page(list,page,limit);
    }

    @RequiresPermissions(value = { "monitor:online:batchForceLogout", "monitor:online:forceLogout" }, logical = Logical.OR)
    @Log(title = "在线用户", businessType = BusinessType.FORCE)
    @PostMapping("/batchForceLogout")
    @ResponseBody
    public LayResult batchForceLogout(String ids)
    {
        for (String sessionId : Convert.toStrArray(ids))
        {
            SysUserOnline online = userOnlineService.selectOnlineById(sessionId);
            if (online == null)
            {
                return error("用户已下线");
            }
            OnlineSession onlineSession = (OnlineSession) onlineSessionDAO.readSession(online.getSessionId());
            if (onlineSession == null)
            {
                return error("用户已下线");
            }
            if (sessionId.equals(ShiroUtils.getSessionId()))
            {
                return error("当前登录用户无法强退");
            }
            onlineSessionDAO.delete(onlineSession);
            online.setStatus(OnlineStatus.off_line);
            userOnlineService.saveOnline(online);
            userOnlineService.removeUserCache(online.getLoginName(), sessionId);
        }
        return ok();
    }
}
