package kr.co.tspoon.service;

import kr.co.tspoon.dto.Member;

import java.util.List;

public interface MemberService {

    public List<Member> memberList() throws Exception;
    public Member memberGet(String id) throws Exception;
    public int memberCount() throws Exception;
    public Member idcheck(String id) throws Exception;
    public Member login(String id) throws Exception;
    public void memberInsert(Member member) throws Exception;
    public void memberUpdate(Member member) throws Exception;
    public void memberDelete(String id) throws Exception;

}
