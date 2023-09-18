package kr.co.tspoon.controller;

import kr.co.tspoon.dto.Member;
import kr.co.tspoon.dto.Vote;
import kr.co.tspoon.dto.VoteCountVo;
import kr.co.tspoon.dto.VoteList;
import kr.co.tspoon.service.MemberService;
import kr.co.tspoon.service.VoteService;
import kr.co.tspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

    @Autowired
    HttpSession session;

    @Autowired
    private MemberService memberService;

    @Autowired
    private VoteService voteService;

    @RequestMapping(value = "MemberListAdmin.do", method = RequestMethod.GET)
    protected String getMemberList(HttpServletRequest request, Model model) throws Exception {
        request.setAttribute("msg", "회원 목록을 출력합니다.");

        String sid = (String) session.getAttribute("sid");

        if(sid != null && sid.equals("admin")) {

            List<Member> memberList = memberService.memberList();

            request.setAttribute("memberList", memberList);

            return "/admin/memberList";
        } else {
            return "redirect:/";
        }
    }

    @RequestMapping(value = "VoteMemberListAdmin.do", method = RequestMethod.GET)
    public String getVoteList(HttpServletRequest request, Model model) throws Exception {

        String sid = (String) session.getAttribute("sid");
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        if(sid != null && sid.equals("admin")) {
            Page page = new Page();
            page.setSearchType(type);
            page.setSearchKeyword(keyword);
            int total = voteService.totalCountForAdmin(page);

            page.makeBlock(curPage, total);
            page.makeLastPageNum(total);
            page.makePostStart(curPage, total);

            List<Vote> voteList = voteService.voteAllListForAdmin(page);

            model.addAttribute("adminNum", 4);
            model.addAttribute("type", type);
            model.addAttribute("keyword", keyword);
            model.addAttribute("page", page);
            model.addAttribute("curPage", curPage);
            model.addAttribute("voteList", voteList);

            return "/admin/voteList";
        } else {
            return "redirect:/";
        }
    }

    @RequestMapping(value = "getVote.do", method = RequestMethod.GET)
    public String getVoteDetail(@RequestParam int vno, Model model) throws Exception {

        String sid = (String) session.getAttribute("sid");

        if(sid != null && sid.equals("admin")) {
            model.addAttribute("adminNum", 4);
            if(vno != 0) {
                Vote vote = voteService.voteDetail(vno);
                model.addAttribute("vote", vote);

                if(!vote.isUseYn()) {
                    List<VoteList> voteAnswerList = voteService.voteAnswerList(vno);
                    model.addAttribute("voteAnswerList", voteAnswerList);
                } else {
                    int cnt = voteService.voteCountCnt(vno);
                    model.addAttribute("cnt", cnt);

                    VoteCountVo getMaxLno = voteService.voteMaxCountList(vno);
                    model.addAttribute("getMaxLno", getMaxLno);

                    List<VoteCountVo> voteCountList = voteService.voteCountList(vno);
                    model.addAttribute("voteCountList", voteCountList);
                }

                return "/admin/voteDetail";
            } else {
                return "redirect:/admin/VoteMemberListAdmin.do";
            }
        } else {
            return "redirect:/";
        }

    }

    @RequestMapping(value = "voteAdd.do", method = RequestMethod.GET)
    public String voteInsert(Model model) throws Exception {

        String sid = (String) session.getAttribute("sid");

        if(sid != null && sid.equals("admin")) {
            model.addAttribute("adminNum", 4);
            return "/admin/voteInsert";
        } else {
            return "redirect:/";
        }

    }

    @RequestMapping(value = "voteEdit.do", method = RequestMethod.GET)
    public String voteUpdate(@RequestParam int vno, Model model) throws Exception {

        String sid = (String) session.getAttribute("sid");

        if(sid != null && sid.equals("admin")) {
            Vote vote = voteService.voteDetail(vno);
            model.addAttribute("vote", vote);
            model.addAttribute("adminNum", 4);
            return "/admin/voteUpdate";
        } else {
            return "redirect:/";
        }

    }


}