package kr.co.tspoon.service;

import kr.co.tspoon.dao.MemberDAO;
import kr.co.tspoon.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDAO;
    BCryptPasswordEncoder pwEncoding = new BCryptPasswordEncoder();

    @Override
    public List<Member> memberList() throws Exception {
        return memberDAO.memberList();
    }

    @Override
    public Member memberGet(String id) throws Exception {
        return memberDAO.memberGet(id);
    }

    @Override
    public int memberCount() throws Exception {
        return memberDAO.memberCount();
    }

    @Override
    public Member idcheck(String id) throws Exception {
        return memberDAO.idcheck(id);
    }

    @Override
    public Member login(String id) throws Exception {
        return memberDAO.login(id);
    }

    @Override
    public void memberInsert(Member member) throws Exception {
        memberDAO.memberInsert(member);
    }

    @Override
    public void memberUpdate(Member member) throws Exception {
        memberDAO.memberUpdate(member);

    }

    @Override
    public void memberDelete(String id) throws Exception {
        memberDAO.memberDelete(id);

    }
}
