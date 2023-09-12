package kr.co.tspoon.service;

import kr.co.tspoon.dao.MemberDAO;
import kr.co.tspoon.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    HttpSession session;

    @Autowired
    private MemberDAO memberDAO;

    private BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();

    @Override
    public List<Member> memberList() throws Exception {
        return memberDAO.memberList();
    }

    @Override
    public Member memberDetail(String id) throws Exception {
        String pw = (String) session.getAttribute("spw");
        Member member = memberDAO.memberDetail(id);
        member.setPw(pw);
        return member;
    }

    @Override
    public boolean login(String id, String pw) throws Exception {
        boolean flag = false;
        Member member = memberDAO.login(id);
        boolean pwMatch = bcryptPasswordEncoder.matches(pw, member.getPw());
        if(member.getId().equals(id) && pwMatch){
            session.setAttribute("sid", id);
            session.setAttribute("spw", pw);
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean idCheck(String id) throws Exception {
        boolean flag = false;
        if(memberDAO.idCheck(id)==null){
            flag = true;
        }
        return flag;
    }

    @Override
    public void memberInsert(Member dto) throws Exception {
        String pw = dto.getPw();
        String cryptPw = bcryptPasswordEncoder.encode(pw);
        dto.setPw(cryptPw);
        memberDAO.memberInsert(dto);
    }

    @Override
    public void memberDelete(String id) throws Exception {
        memberDAO.memberDelete(id);
    }

    @Override
    public void memberEdit(Member dto) throws Exception {
        String pw = dto.getPw();
        String cryptPw = bcryptPasswordEncoder.encode(pw);
        dto.setPw(cryptPw);
        memberDAO.memberEdit(dto);
    }
}
