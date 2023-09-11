package kr.co.tspoon.service;

import kr.co.tspoon.dao.MemberDAO;
import kr.co.tspoon.dto.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberDAO memberDAO;
    @Override
    public List<Member> memberList() throws Exception {
        return memberDAO.memberList();
    }

    @Override
    public Member memberDetail(String id) throws Exception {
        return memberDAO.memberDetail(id);
    }

    @Override
    public boolean login(String id, String pw) throws Exception {
        boolean flag = false;
        Member member = memberDAO.login(id);
        if(member.getId().equals(id) && member.getPw().equals(pw)){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean idCheck(String id) throws Exception {
        boolean flag = false;
        if(memberDAO.idCheck(id).getId()==null){
            flag = true;
        }
        return flag;
    }

    @Override
    public void memberInsert(Member dto) throws Exception {
        memberDAO.memberInsert(dto);
    }

    @Override
    public void memberDelete(String id) throws Exception {
        memberDAO.memberDelete(id);
    }

    @Override
    public void memberEdit(Member dto) throws Exception {
        memberDAO.memberEdit(dto);
    }
}
