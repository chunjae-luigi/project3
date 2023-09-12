package kr.co.tspoon.service;

import kr.co.tspoon.dto.Member;

import java.util.List;

public interface MemberService {
    public List<Member> memberList() throws Exception;
    public Member memberGet(String id) throws Exception;
    public boolean login(String id, String pw) throws Exception;
    public void memberInsert(Member dto) throws Exception;
    public void memberDelete(String id) throws Exception;
    public void memberUpdate(Member dto) throws Exception;
}
