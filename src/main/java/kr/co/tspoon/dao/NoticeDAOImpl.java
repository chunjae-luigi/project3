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
        return sqlSession.selectList("Notice.noticeList");
    }

    @Override
    public Notice noticeGet(int no) throws Exception {
        return sqlSession.selectOne("Notice.noticeGet", no);
    }

    @Override
    public void noticeInsert(Notice notice) throws Exception {
        sqlSession.insert("Notice.noticeInsert", notice);
    }

    @Override
    public void noticeUpdate(Notice notice) throws Exception {
        sqlSession.update("Notice.noticeUpdate", notice);
    }

    @Override
    public void noticeDelete(int no) throws Exception {
        sqlSession.delete("Notice.noticeDelete", no);
    }
}
