package kr.co.tspoon.service;

import kr.co.tspoon.dao.MemberDAO;
import kr.co.tspoon.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
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
    public Member memberGet(String id) throws Exception {
        Member member = memberDAO.memberGet(id);
        if(member!=null){
            String pw = (String) session.getAttribute("spw");
            member.setPw(pw);
        }
        return member;
    }

    @Override
    public Member login(String id) throws Exception {
        return memberDAO.login(id);
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
    public void memberUpdate(Member dto) throws Exception {
        String pw = dto.getPw();
        String cryptPw = bcryptPasswordEncoder.encode(pw);
        dto.setPw(cryptPw);
        memberDAO.memberUpdate(dto);
    }

    @Override
    public void memberUpdatePoint(Member member) throws Exception {
        memberDAO.memberUpdatePoint(member);
    }
}
