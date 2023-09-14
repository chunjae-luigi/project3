package kr.co.tspoon.controller;

import kr.co.tspoon.dto.Notice;
import kr.co.tspoon.dto.Vote;
import kr.co.tspoon.dto.VoteList;
import kr.co.tspoon.dto.VoteUser;
import kr.co.tspoon.service.VoteService;
import kr.co.tspoon.vo.VoteCount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/vote/*")
public class VoteController {

    @Autowired
    private VoteService voteService;

    @Autowired
    HttpSession session;

    @RequestMapping(value = "list.do", method = RequestMethod.GET)
    public String voteList(Model model) throws Exception{
        List<Vote> voteList = voteService.voteAllList();
        model.addAttribute("voteList", voteList);
        return "/vote/voteList";
    }

    @RequestMapping(value = "get.do", method = RequestMethod.GET)
    public String voteDetail(HttpServletRequest req, Model model) throws Exception{

        int vno = req.getParameter("vno") != null ? Integer.parseInt(req.getParameter("vno")) : 0;
        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";

        if(vno == 0) {
            return "redirect:/vote/list.do";
        } else {
            Vote vote = voteService.voteDetail(vno, sid);
            model.addAttribute("vote", vote);

            int cnt = voteService.voteCountCnt(vno);
            model.addAttribute("cnt", cnt);
            
            // 값이 있으면 VoteCount로
            // 값이 없으면 voteList로

            List<VoteCount> voteList = voteService.voteCountList(vno);
            model.addAttribute("voteList", voteList);

            return "/vote/voteDetail";
        }

    }

    @RequestMapping(value = "addAnswer.do", method = RequestMethod.POST)
    public String voteUserInsert(@RequestParam int vno, @RequestParam int lno, HttpServletRequest req, HttpServletResponse res) throws Exception{

        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";

        VoteUser voteUser = new VoteUser();
        boolean result = false;

        if(!sid.equals("")){
            voteUser.setVno(vno);
            voteUser.setLno(lno);
            voteUser.setAuthor(sid);
            voteService.voteUserInsert(voteUser);
            req.setAttribute("msg", true);
        } else {
            return "redirect:/vote/list.do";
        }

        //voteUserInsert
        return "";

    }

}