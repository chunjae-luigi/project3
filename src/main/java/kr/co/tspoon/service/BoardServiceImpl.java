package kr.co.tspoon.service;

import kr.co.tspoon.dao.BoardDAO;
import kr.co.tspoon.dto.DataBoard;
import kr.co.tspoon.dto.Notice;
import kr.co.tspoon.dto.Qna;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDAO boardDAO;

    @Override
    public List<DataBoard> dataBoardList() throws Exception {
        return boardDAO.dataBoardList();
    }

    @Override
    public DataBoard dataBoardGet(int bno) throws Exception {
        return boardDAO.dataBoardGet(bno);
    }

    @Override
    public int dataBoardCount() throws Exception {
        return boardDAO.dataBoardCount();
    }

    @Override
    public void dataBoardInsert(DataBoard dataBoard) throws Exception {
        boardDAO.dataBoardInsert(dataBoard);
    }

    @Override
    public void dataBoardUpdate(DataBoard dataBoard) throws Exception {
        boardDAO.dataBoardUpdate(dataBoard);
    }

    @Override
    public void dataBoardDelete(int bno) throws Exception {
        boardDAO.dataBoardDelete(bno);
    }


    // Qna
    @Override
    public List<Qna> qnaList() throws Exception {
        return boardDAO.qnaList();
    }

    @Override
    public Qna qnaGet(int qno) throws Exception {
        return boardDAO.qnaGet(qno);
    }

    @Override
    public int qnaCount() throws Exception {
        return boardDAO.qnaCount();
    }

    @Override
    public void qnaInsert(Qna qna) throws Exception {
        boardDAO.qnaInsert(qna);
    }

    @Override
    public void qnaUpdate(Qna qna) throws Exception {
        boardDAO.qnaUpdate(qna);
    }

    @Override
    public void qnaDelete(int qno) throws Exception {
        boardDAO.qnaDelete(qno);
    }

}
