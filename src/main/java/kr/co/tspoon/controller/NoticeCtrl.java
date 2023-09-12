package kr.co.tspoon.controller;

import kr.co.tspoon.dto.Notice;
import kr.co.tspoon.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/Notice/*")
public class NoticeCtrl {

    @Autowired
    private NoticeService noticeService;

    @RequestMapping(value = "List.do", method = RequestMethod.GET)
    public String noticeList(Model model) throws Exception{
        List<Notice> noticeList = noticeService.noticeList();
        model.addAttribute("noticeList", noticeList);
        return "/notice/noticeList";
    }

    @GetMapping("Get.do")
    public String noticeGet(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Notice notice = noticeService.noticeGet(no);
        model.addAttribute("notice", notice);
       return "/notice/noticeGet";
    }

    @GetMapping("Insert.do")
    public String noticeInsert(HttpServletRequest request, Model model) throws Exception{
        Notice notice = new Notice();
        notice.setTitle(request.getParameter("title"));
        notice.setContent(request.getParameter("content"));
        noticeService.noticeInsert(notice);
        return "redirect: List.do";
    }

    @PostMapping("Update.do")
    public String noticeUpdate(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Notice notice = new Notice();
        notice.setTitle(request.getParameter("title"));
        notice.setContent(request.getParameter("content"));
        noticeService.noticeUpdate(notice);
        return "redirect: Get.do";
    }

    @GetMapping("Delete.do")
    public String noticedelete(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        noticeService.noticeDelete(no);
        return "redirect: List.do";
    }

}
