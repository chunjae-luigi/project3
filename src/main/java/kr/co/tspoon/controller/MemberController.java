package kr.co.tspoon.controller;

import kr.co.tspoon.dto.Member;
import kr.co.tspoon.service.MemberService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();


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
        model.addAttribute("member", dto);
        return "/member/membermypage";
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
    public String login(@RequestParam String id, @RequestParam String pw, Model model) throws Exception {
        Member mem = memberService.login(id);
        if(mem != null) {
            boolean loginSuccess = pwEncoder.matches(pw, mem.getPw());
            System.out.println("pw : " + pw);
            System.out.println("ma : " + mem.getPw());
            System.out.println(loginSuccess);
            if (loginSuccess) {
                session.setAttribute("sid", id);
                model.addAttribute("msg", "로그인을 성공하셨습니다.");
                model.addAttribute("url", "/");
                return "/member/alert";

            } else {
                model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
                model.addAttribute("url", "/member/login.do");
                return "/member/alert";
            }
        }else{
        model.addAttribute("msg", "아이디가 없습니다.");
        model.addAttribute("url", "/member/login.do");
        return "/member/alert";
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
        model.addAttribute("msg", "로그아웃 하셨습니다.");
        model.addAttribute("url", "/");
        return "/member/alert";
    }

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/member/memberInsert";
    }

    @PostMapping("insert.do")
    public String memberInsert(Member member,  Model model) throws Exception {
        String ppw = member.getPw();
        String pw = pwEncoder.encode(ppw);
        member.setPw(pw);
        memberService.memberInsert(member);
        model.addAttribute("msg", "가족이 되신걸 환영합니다.");
        model.addAttribute("url", "/member/login.do");
        return "/member/alert";
    }

    @GetMapping("delete.do")
    public String memberDelete(@RequestParam String id, HttpSession session, Model model) throws Exception {
        memberService.memberDelete(id);
        session.invalidate();
        model.addAttribute("msg", "회원탈퇴가 정상적으로 진행되었습니다.");
        model.addAttribute("url", "/");
        return "/member/alert";

    }

    @GetMapping("update.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        Member dto = memberService.memberGet(id);
        model.addAttribute("member", dto);
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
