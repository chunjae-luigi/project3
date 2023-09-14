package kr.co.tspoon.dao;

import kr.co.tspoon.dto.Notice;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NoticeDAOImpl implements NoticeDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Notice> noticeList() throws Exception {
        return sqlSession.selectList("notice.noticeList");
    }

    @Override
    public Notice noticeGet(int no) throws Exception {
        sqlSession.update("notice.noticeVisited", no);
        return sqlSession.selectOne("notice.noticeGet", no);
    }

    @Override
    public void noticeInsert(Notice notice) throws Exception {
        sqlSession.insert("notice.noticeInsert", notice);
    }

    @Override
    public void noticeUpdate(Notice notice) throws Exception {
        sqlSession.update("notice.noticeUpdate", notice);
    }

    @Override
    public void noticeDelete(int no) throws Exception {
        sqlSession.delete("notice.noticeDelete", no);
    }
}
