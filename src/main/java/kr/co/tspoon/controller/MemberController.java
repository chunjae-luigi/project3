package kr.co.tspoon.controller;

import kr.co.tspoon.dto.Member;
import kr.co.tspoon.service.MemberService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/member/*")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    HttpSession session;

    @GetMapping("list.do")
    public String memberList(Model model) throws Exception {
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        return "/member/memberList";
    }

    @GetMapping("get.do")
    public String memberGet(Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        Member dto = memberService.memberGet(id);
        System.out.println(dto.getId());
        model.addAttribute("member", dto);
        return "/member/memberGet";
    }

    @GetMapping("term.do")
    public String term(){
        return "/member/term";
    }

    @GetMapping("login.do")
    public String loginForm(HttpServletRequest request, Model model) throws Exception {
        return "/member/login";
    }

    @PostMapping("login.do")
    public String loginMember(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        boolean loginSuccess = memberService.login(id, pw);
        if(loginSuccess){
            return "redirect:/";
        } else{
            return "redirect:login.do";
        }
    }

    @RequestMapping(value="idcheck.do", method= RequestMethod.POST)
    public void idCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");
        boolean noId = true;
        if(memberService.memberGet(id)!=null){
            noId = false;
        }
        JSONObject json = new JSONObject();
        json.put("result", noId);
        PrintWriter out = response.getWriter();
        out.println(json.toString()); // 전송이 되는 부분
    }

    @GetMapping("logout.do")
    public String logout(HttpServletRequest request, Model model) throws Exception {
        session.removeAttribute("sid");
        return "redirect:/";
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/member/memberInsert";
    }

    @PostMapping("insert.do")
    public String memberInsert(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String addr1 = request.getParameter("addr1");
        String addr2 = request.getParameter("addr2");
        String postcode = request.getParameter("postcode");
        String birth = request.getParameter("birth");

        Member dto = new Member();
        dto.setId(id);
        dto.setPw(pw);
        dto.setName(name);
        dto.setEmail(email);
        dto.setTel(tel);
        dto.setAddr1(addr1);
        dto.setAddr2(addr2);
        dto.setPostcode(postcode);
        dto.setBirth(birth);
        memberService.memberInsert(dto);
        return "redirect:login.do";
    }

    @GetMapping("delete.do")
    public String memberDelete(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        memberService.memberDelete(id);
        return "redirect:list.do";
    }

    @GetMapping("update.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        Member dto = memberService.memberGet(id);
        model.addAttribute("dto", dto);
        return "/member/memberUpdate";
    }

    @PostMapping("update.do")
    public String memberUpdate(HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String addr1 = request.getParameter("addr1");
        String addr2 = request.getParameter("addr2");
        String postcode = request.getParameter("postcode");
        String birth = request.getParameter("birth");

        Member dto = new Member();
        dto.setId(id);
        dto.setPw(pw);
        dto.setName(name);
        dto.setEmail(email);
        dto.setTel(tel);
        dto.setAddr1(addr1);
        dto.setAddr2(addr2);
        dto.setPostcode(postcode);
        dto.setBirth(birth);

        memberService.memberUpdate(dto);

        model.addAttribute("dto", dto);

        return "redirect:get.do";
    }
}
