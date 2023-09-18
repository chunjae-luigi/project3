package kr.co.tspoon.service;

import kr.co.tspoon.dto.DataBoard;
import kr.co.tspoon.dto.Notice;
import kr.co.tspoon.dto.Qna;

import java.util.List;

public interface BoardService {
    // DataBoard
    public List<DataBoard> dataBoardList() throws Exception;
    public DataBoard dataBoardGet(int bno) throws Exception;
    public int dataBoardCount() throws Exception;
    public void dataBoardInsert(DataBoard dataBoard) throws Exception;
    public void dataBoardUpdate(DataBoard dataBoard) throws Exception;
    public void dataBoardDelete(int bno) throws Exception;

    // QnaBoard
    public List<Qna> qnaList() throws Exception;
    public Qna qnaGet(int qno) throws Exception;
    public int qnaCount() throws Exception;
    public void qnaInsert(Qna qna) throws Exception;
    public void qnaUpdate(Qna qna) throws Exception;
    public void qnaDelete(int qno) throws Exception;


}