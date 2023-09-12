package kr.co.tspoon.controller;

import kr.co.tspoon.dto.Member;
import kr.co.tspoon.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/member/*")
public class MemberCtrl {

    @Autowired
    private MemberService memberService;

    @Autowired
    HttpSession session;
    BCryptPasswordEncoder pwEncoding = new BCryptPasswordEncoder();

    @RequestMapping(value = "List.do", method = RequestMethod.GET)
    public String memberList(Model model) throws Exception{
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        model.addAttribute("title", "회원목록");
        return "/member/memberList";
    }

    @GetMapping(value = "Get.do")
    public String memberGet(@RequestParam String id, Model model) throws Exception{
        Member member = memberService.memberGet(id);
        model.addAttribute("member", member);
        return "/member/memberGet";
    }
    @GetMapping("mypage.do")
    public String mypage(Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        Member member = memberService.memberGet(id);
        model.addAttribute("member", member);
        return "/member/mypage";
    }
    @GetMapping("term.do")
    public String Agree(Model model) throws Exception {
        return "/member/agree";
    }
    //회원 가입 - 회원가입폼 페이지 로딩
    @GetMapping("join.do")
    public String getJoin(Model model) throws Exception {
        return "/member/memberInsert";
    }
    //회원 가입 - Ajax로 아이디 중복 체크
    @RequestMapping(value="idCheck.do", method=RequestMethod.POST)
    public void idCheck(HttpServletResponse response, HttpServletRequest request, Model model) throws Exception {
        String id = request.getParameter("id");
        Member mem = memberService.getMember(id);
        boolean result = false;
        if(mem!=null){
            result = false;
        } else {
            result = true;
        }
        JSONObject json = new JSONObject();
        json.put("result", result);
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }

    //회원 가입 - 회원 가입 처리
    @RequestMapping(value="insert.do", method = RequestMethod.POST)
    public String memberWrite(Member member, Model model) throws Exception {
        String ppw = member.getPw();
        String pw = pwEncoder.encode(ppw);
        member.setPw(pw);
        memberService.memberInsert(member);
        return "redirect:/";
    }

    //로그인 폼 로딩
    @RequestMapping("login.do")
    public String memberLoginForm(Model model) throws Exception {
        return "/member/loginForm";
    }

    //로그인을 컨트롤러에서 처리
    @PostMapping("signin.do")
    public String memberSignIn(@RequestParam String id, @RequestParam String pw, Model model) throws Exception {
        Member mem = memberService.signIn(id);
        if(mem!=null){
            boolean loginSuccess = pwEncoder.matches(pw, mem.getPw());
            if(loginSuccess){
                session.setAttribute("member", mem);
                session.setAttribute("sid", id);
                return "redirect:/";
            } else {
                return "redirect:login.do";
            }
        } else {
            return "redirect:login.do";
        }
    }
    //서비스에서 로그인 로직 처리
    @RequestMapping(value = "loginpro.do", method = RequestMethod.POST)
    public String memberLogin(@RequestParam String id, @RequestParam String pw, Model model) throws Exception {
        boolean ps = memberService.loginCheck(id, pw);
        if(ps){
            session.setAttribute("sid", id);
            return "redirect:/";
        } else {
            return "redirect:login.do";
        }
    }

    @GetMapping("logout.do")
    public String memberLogout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/";
    }
}
