package kr.co.tspoon.controller;

import kr.co.tspoon.dto.Free;
import kr.co.tspoon.dto.News;
import kr.co.tspoon.dto.Notice;
import kr.co.tspoon.service.FreeService;
import kr.co.tspoon.service.NoticeService;
import kr.co.tspoon.util.Crawler;
import kr.co.tspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Controller
public class HomeController {
    // http:localhost:8081/pro03_war == root
    // http:localhost:8081/pro03_war/index.jsp == http:localhost:8081/pro03_war/WEB-INF/views/index.jsp
    @Autowired
    private NoticeService noticeService;

    @Autowired
    private FreeService freeService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(HttpServletRequest request, Model model) throws Exception {
        List<Notice> noticeList = noticeService.noticeList();

        model.addAttribute("noticeList", noticeList);

//        String type = request.getParameter("type");
//        String keyword = request.getParameter("keyword");
//        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
//
//        Page page = new Page();
//        page.setSearchType(type);
//        page.setSearchKeyword(keyword);
//        int total = freeService.totalCount(page);
//
//        page.makeBlock(curPage, total);
//        page.makeLastPageNum(total);
//        page.makePostStart(curPage, total);
//
//
//        List<Free> freeList = freeService.freeList(page);
//
//        model.addAttribute("type", type);
//        model.addAttribute("keyword", keyword);
//        model.addAttribute("page", page);
//        model.addAttribute("curPage", curPage);
//
//
//        model.addAttribute("freeList", freeList);

        return "/index";
    }

    @RequestMapping(value = "/template", method = RequestMethod.GET)
    public String template(Model model) throws Exception {
        List<News> newsList = Crawler.naverNewsKeyword("천재교육");
        model.addAttribute("newsList", newsList);
        return "/template";
    }

    @RequestMapping(value = "/company01", method = RequestMethod.GET)
    public String company01(Model model){
        return "/company/company01";
    }

    @RequestMapping(value = "/company02", method = RequestMethod.GET)
    public String company02(Model model){
        return "/company/company02";
    }

    @RequestMapping(value = "/company03", method = RequestMethod.GET)
    public String company03(Model model){
        return "/company/company03";
    }

    @RequestMapping(value = "/event1", method = RequestMethod.GET)
    public String event1(Model model){
        return "/company/event1";
    }

    @RequestMapping(value = "/event2", method = RequestMethod.GET)
    public String event2(Model model){
        return "/company/event2";
    }

}
