package kr.co.tspoon.dao;
import kr.co.tspoon.dto.DataBoard;
import kr.co.tspoon.dto.Notice;
import kr.co.tspoon.dto.Qna;
import kr.co.tspoon.util.Page;


import java.util.List;
public interface BoardDAO {
    // DataBoard
    public List<DataBoard> dataBoardList(Page page) throws Exception;
    public DataBoard dataBoardGet(int bno) throws Exception;
    public int dataBoardCount(Page page) throws Exception;
    public void dataBoardInsert(DataBoard dataBoard) throws Exception;
    public void dataBoardUpdate(DataBoard dataBoard) throws Exception;
    public void dataBoardDelete(int bno) throws Exception;

    // QnaBoard
    public List<Qna> qnaList(Page page) throws Exception;
    public Qna qnaGet(int qno) throws Exception;
    public int qnaCount(Page page) throws Exception;
    public void qnaInsert(Qna qna) throws Exception;
    public void qnaUpdate(Qna qna) throws Exception;
    public void qnaDelete(int qno) throws Exception;
    public List<Qna> qnaGetPar(int par) throws Exception;

}

