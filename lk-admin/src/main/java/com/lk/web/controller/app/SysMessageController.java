package com.lk.web.controller.app;

import com.lk.common.core.controller.BaseController;
import com.lk.common.core.domain.LayResult;
import com.lk.common.core.domain.entity.SysNotice;
import com.lk.system.domain.SysMessage;
import com.lk.system.mapper.SysMessageMapper;
import com.lk.system.service.ISysNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * 显示通知
 *
 * @author LiKe_Ren
 */
@Controller
@RequestMapping("/app/message")
public class SysMessageController extends BaseController {
    private String prefix = "app/message";

    @Autowired
    private ISysNoticeService noticeService;

    @Autowired
    private SysMessageMapper messageMapper;

    @GetMapping()
    public String message() {
        return prefix + "/message";
    }

    @GetMapping("/detail")
    public String detail(Long id, ModelMap map) {
        map.put("id", id);
        return prefix + "/detail";
    }

//    @RequestMapping(value = "/unreadSize", method = {RequestMethod.GET, RequestMethod.POST})
//    @ResponseBody
//    public LayResult unreadSize() {
//        return new LayResult(messageMapper.selectUnreadMessageSize(getUserId()), null);
//    }

    @GetMapping("/notice")
    @ResponseBody
    public LayResult notice(Long id) {
        SysNotice notice = noticeService.selectNoticeById(id);
        return new LayResult(1, new Message(notice.getTitle(), notice.getCreateTime(), notice.getContent()));
    }

    @RequestMapping(value = "/unread", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public LayResult unread(int page, int limit) {
        return page(messageMapper.selectMessageUnreadList(new SysMessage(getUserId())), page, limit);
    }

    @RequestMapping(value = "/read", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public LayResult read(int page, int limit) {
        return page(messageMapper.selectMessageReadList(new SysMessage(getUserId())), page, limit);
    }

    @PostMapping("/convert")
    @ResponseBody
    public LayResult convert(Long noticeId) {
        return new LayResult(messageMapper.updateReadMessage(new SysMessage(getUserId(), noticeId)) - messageMapper.deleteUnreadMessageList(Arrays.asList(new SysMessage(getUserId(), noticeId))));
    }

    @PostMapping("/convertAll")
    @ResponseBody
    public LayResult convertAll() {
        messageMapper.updateReadMessageByUserId(getUserId());
        return toAjax(messageMapper.deleteUnreadMessageByUserId(getUserId()));
    }

    @PostMapping("/del")
    @ResponseBody
    public LayResult del(Long noticeId) {
        return toAjax(messageMapper.deleteReadMessageList(Arrays.asList(new SysMessage(getUserId(), noticeId))));
    }

    @PostMapping("/delAll")
    @ResponseBody
    public LayResult delAll() {
        return toAjax(messageMapper.deleteReadMessageByUserId(getUserId()));
    }

    class Message {
        private String title;
        private Date time;
        private String content;

        public Message(String title, Date time, String content) {
            this.title = title;
            this.time = time;
            this.content = content;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public Date getTime() {
            return time;
        }

        public void setTime(Date time) {
            this.time = time;
        }

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }
    }
}
