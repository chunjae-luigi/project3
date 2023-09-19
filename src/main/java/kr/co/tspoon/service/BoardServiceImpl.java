package kr.co.tspoon.service;

import kr.co.tspoon.dao.BoardDAO;
import kr.co.tspoon.dto.DataBoard;
import kr.co.tspoon.dto.DataFile;
import kr.co.tspoon.dto.Notice;
import kr.co.tspoon.dto.Qna;
import kr.co.tspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDAO boardDAO;

    @Override
    public List<DataBoard> dataBoardList(Page page) throws Exception {
        return boardDAO.dataBoardList(page);
    }

    @Override
    public DataBoard dataBoardGet(int bno) throws Exception {
        return boardDAO.dataBoardGet(bno);
    }

    @Override
    public int dataBoardCount(Page page) throws Exception {
        return boardDAO.dataBoardCount(page);
    }

    @Transactional
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
    public List<Qna> qnaList(Page page) throws Exception {
        return boardDAO.qnaList(page);
    }

    @Override
    public Qna qnaGet(int qno) throws Exception {
        return boardDAO.qnaGet(qno);
    }

    @Override
    public int qnaCount(Page page) throws Exception {
        return boardDAO.qnaCount(page);
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
