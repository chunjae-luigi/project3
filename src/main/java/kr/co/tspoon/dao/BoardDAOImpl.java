package kr.co.tspoon.dao;

import kr.co.tspoon.dto.DataBoard;
import kr.co.tspoon.dto.DataFile;
import kr.co.tspoon.dto.Notice;
import kr.co.tspoon.dto.Qna;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class BoardDAOImpl implements BoardDAO {

    @Autowired
    private SqlSession sqlSession;


    // DataBoard
    @Override
    public List<DataBoard> dataBoardList() throws Exception {
        return sqlSession.selectList("board.dataBoardList");
    }

    @Transactional
    @Override
    public DataBoard dataBoardGet(int bno) throws Exception {
        sqlSession.update("board.dataBoardCountUp", bno);
        return sqlSession.selectOne("board.dataBoardGet", bno);
    }

    @Override
    public int dataBoardCount() throws Exception {
        return sqlSession.selectOne("board.dataBoardCount");
    }

    @Transactional
    @Override
    public void dataBoardInsert(DataBoard dataBoard) throws Exception {
        sqlSession.insert("board.dataBoardInsert", dataBoard);
        DataBoard last = sqlSession.selectOne("board.dataBoardGetLast");
        int bno = last.getBno();

        List<DataFile> datafiles = sqlSession.selectList("dataFile.dataFileInsertList");
        for(DataFile df: datafiles){
            df.setBno(bno);
            df.setRelations("databoard");
            sqlSession.update("dataFileUpdate", df);
            System.out.println(bno+" "+df.getFileName());
        }

        if(!datafiles.isEmpty()){
            last.setRelations("datafile");
            sqlSession.update("board.dataBoardUpdate", last);
        }
    }

    @Override
    public void dataBoardUpdate(DataBoard dataBoard) throws Exception {
        sqlSession.update("board.dataBoardUpdate", dataBoard);
    }

    @Override
    public void dataBoardDelete(int bno) throws Exception {
        sqlSession.delete("board.dataBoardDelete", bno);
    }


    // Qna
    @Override
    public List<Qna> qnaList() throws Exception {
        return sqlSession.selectList("board.qnaList");
    }

    @Transactional
    @Override
    public Qna qnaGet(int qno) throws Exception {
        sqlSession.update("board.qnaCountUp", qno);
        return sqlSession.selectOne("board.qnaGet", qno);
    }

    @Override
    public int qnaCount() throws Exception {
        return sqlSession.selectOne("board.qnaCount");
    }

    @Transactional
    @Override
    public void qnaInsert(Qna qna) throws Exception {
        sqlSession.insert("board.qnaInsert", qna);
        sqlSession.update("qnaPar");
    }

    @Override
    public void qnaUpdate(Qna qna) throws Exception {
        sqlSession.update("board.qnaUpdate", qna);
    }

    @Override
    public void qnaDelete(int qno) throws Exception {
        sqlSession.delete("board.qnaDelete", qno);
    }

}
