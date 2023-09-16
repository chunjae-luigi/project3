package kr.co.tspoon.controller;

import kr.co.tspoon.dto.Vote;
import kr.co.tspoon.dto.VoteUser;
import kr.co.tspoon.service.VoteService;
import kr.co.tspoon.vo.VoteCount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

            VoteUser voteUser = new VoteUser();
            voteUser.setVno(vno);
            voteUser.setAuthor(sid);
            VoteUser voteUserInfo = voteService.voteUserList(voteUser);

            List<VoteCount> voteList = voteService.voteCountList(vno);
            model.addAttribute("voteList", voteList);
            
            if(!sid.equals("") && (sid.equals("admin") || voteUserInfo != null)) {
                model.addAttribute("voteYn", true);
                if(!sid.equals("admin")) {
                    model.addAttribute("voteUserInfo", voteUserInfo);
                }
                List<VoteCount> voteCountList = voteService.voteCountList(vno);
                model.addAttribute("voteCountList", voteCountList);

            } else {
                model.addAttribute("voteYn", false);
            }

            return "/vote/voteDetail";
        }

    }

    @RequestMapping(value = "addAnswer.do", method = RequestMethod.POST)
    @ResponseBody
    public String voteUserInsert(@RequestParam int vno, @RequestParam int lno, HttpServletRequest req, HttpServletResponse res) throws Exception{

        String sid = session.getAttribute("sid") != null ? (String) session.getAttribute("sid") : "";
        String result = "";

        VoteUser voteUser = new VoteUser();
        voteUser.setVno(vno);
        voteUser.setLno(lno);
        voteUser.setAuthor(sid);

        if(!sid.equals("")){
            voteService.voteUserInsert(voteUser);
            result = "success";
        } else {
            result = "error";
        }
        return result;

    }

}