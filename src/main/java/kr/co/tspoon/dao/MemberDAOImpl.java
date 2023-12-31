package kr.co.tspoon.dao;

import kr.co.tspoon.dto.Member;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class MemberDAOImpl implements MemberDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Member> memberList() throws Exception {
        return sqlSession.selectList("member.memberList");
    }

    @Override
    public Member memberGet(String id) throws Exception {
        return sqlSession.selectOne("member.memberGet", id);
    }

    @Override
    public int memberCount() throws Exception {
        return sqlSession.selectOne("member.memberCount");
    }

    @Override
    public Member idcheck(String id) throws Exception {
        return sqlSession.selectOne("member.idcheck",id);
    }

    @Override
    public Member login(String id) throws Exception {
        return sqlSession.selectOne("member.login", id);
    }

    @Override
    public void memberInsert(Member dto) throws Exception {
        sqlSession.insert("member.memberInsert", dto);
    }

    @Override
    public void memberUpdate(Member member) throws Exception {
        sqlSession.update("member.memberUpdate", member);

    }

    @Override
    public void memberDelete(String id) throws Exception {
        sqlSession.delete("member.memberDelete", id);

    }

    @Override
    public void memberUpdatePoint(Member member) throws Exception {
        sqlSession.delete("member.memberUpdatePoint", member);

    }

    @Override
    public List<Member> getMemberId() throws Exception {
        return sqlSession.selectList("member.getMemberId");
    }
}
