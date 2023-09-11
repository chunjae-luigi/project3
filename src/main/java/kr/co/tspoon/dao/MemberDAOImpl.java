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
    public Member login(String id) throws Exception {
        return sqlSession.selectOne("member.login", id);
    }

    @Override
    public Member idCheck(String id) throws Exception {
        return sqlSession.selectOne("member.idCheck", id);
    }

    @Override
    public Member memberDetail(String id) throws Exception {
        return sqlSession.selectOne("member.memberDetail", id);
    }

    @Override
    public void memberInsert(Member dto) throws Exception {
        sqlSession.insert("member.memberInsert", dto);
    }

    @Override
    public void memberDelete(String id) throws Exception {
        sqlSession.delete("member.memberDelete");
    }

    @Override
    public void memberEdit(Member dto) throws Exception {
        sqlSession.update("member.memberEdit");
    }
}
