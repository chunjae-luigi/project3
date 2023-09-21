package kr.co.tspoon.dao;

import kr.co.tspoon.dto.Member;
import java.util.List;

public interface MemberDAO {

    public List<Member> memberList() throws Exception;
    public Member memberGet(String id) throws Exception;
    public int memberCount() throws Exception;
    public Member idcheck(String id) throws Exception;
    public Member login(String id) throws Exception;
    public void memberInsert(Member member) throws Exception;
    public void memberUpdate(Member member) throws Exception;
    public void memberDelete(String id) throws Exception;
    public void memberUpdatePoint(Member member) throws Exception;
    public List<Member> getMemberId() throws Exception;

}
