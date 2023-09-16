package kr.co.tspoon.dao;

import kr.co.tspoon.dto.Vote;
import kr.co.tspoon.dto.VoteList;
import kr.co.tspoon.dto.VoteUser;
import kr.co.tspoon.vo.VoteCount;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class VoteDAOImpl implements VoteDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Vote> voteAllList() throws Exception {
        return sqlSession.selectList("vote.voteAllList");
    }

    @Override
    public Vote voteDetail(int vno) throws Exception {
        return sqlSession.selectOne("vote.voteDetail", vno);
    }

    @Override
    public int totalCount() throws Exception {
        return sqlSession.selectOne("vote.totalCount");
    }

    @Override
    public void voteInsert(Vote vote) throws Exception {
        sqlSession.insert("vote.voteInsert", vote);
    }

    @Override
    public void voteDelete(int vno) throws Exception {
        sqlSession.delete("vote.voteDelete", vno);
    }

    @Override
    public void voteUpdateState(int vno) throws Exception {
        sqlSession.update("vote.voteUpdateState", vno);
    }

    @Override
    public void voteEdit(Vote vote) throws Exception {
        sqlSession.update("vote.voteEdit", vote);
    }

    @Override
    public void voteVisitCount(int vno) throws Exception {
        sqlSession.update("vote.voteVisitCount", vno);
    }

    @Override
    public List<VoteList> voteAnswerList(int vno) throws Exception {
        return sqlSession.selectList("vote.voteAnswerList", vno);
    }

    @Override
    public void voteAnswerInsert(VoteList voteList) throws Exception {
        sqlSession.insert("vote.voteAnswerInsert", voteList);
    }

    @Override
    public void voteAnswerDelete(int lno) throws Exception {
        sqlSession.delete("vote.voteAnswerDelete", lno);
    }

    @Override
    public void voteAnswerEdit(VoteList voteList) throws Exception {
        sqlSession.update("vote.voteAnswerEdit", voteList);
    }

    @Override
    public VoteUser voteUserList(VoteUser voteUser) throws Exception {
        return sqlSession.selectOne("vote.voteUserList", voteUser);
    }

    @Override
    public void voteUserInsert(VoteUser voteUser) throws Exception {
        sqlSession.insert("vote.voteUserInsert", voteUser);
    }

    @Override
    public void voteUserDelete(int uno) throws Exception {
        sqlSession.delete("vote.voteUserDelete", uno);
    }

    @Override
    public void voteUserEdit(VoteUser voteUser) throws Exception {
        sqlSession.update("vote.voteUserEdit", voteUser);
    }

    @Override
    public List<VoteCount> voteCountList(int vno) throws Exception {
        return sqlSession.selectList("vote.voteCountList", vno);
    }

    @Override
    public int voteCountCnt(int vno) throws Exception {
        return sqlSession.selectOne("vote.voteCountCnt", vno);
    }
}