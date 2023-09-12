package kr.co.tspoon.dao;

import kr.co.tspoon.dto.Member;

import java.util.List;

public interface MemberDAO {
    public List<Member> memberList() throws Exception;
    public Member memberDetail(String id) throws Exception;
    public Member login(String id) throws Exception;
    public Member idCheck(String id) throws Exception;
    public void memberInsert(Member dto) throws Exception;
    public void memberDelete(String id) throws Exception;
    public void memberEdit(Member dto) throws Exception;
}
