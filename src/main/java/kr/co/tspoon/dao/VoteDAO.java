package kr.co.tspoon.dao;

import kr.co.tspoon.dto.Vote;
import kr.co.tspoon.dto.VoteList;
import kr.co.tspoon.dto.VoteUser;
import kr.co.tspoon.vo.VoteCount;

import java.util.List;

public interface VoteDAO {

    public List<Vote> voteAllList() throws Exception;
    public Vote voteDetail(int vno) throws Exception;
    public int totalCount() throws Exception;
    public void voteInsert(Vote vote) throws Exception;
    public void voteDelete(int vno) throws Exception;
    public void voteUpdateState(int vno) throws Exception;
    public void voteEdit(Vote vote) throws Exception;
    public void voteVisitCount(int vno) throws Exception;

    public List<VoteList> voteAnswerList(int vno) throws Exception;
    public void voteAnswerInsert(VoteList voteList) throws Exception;
    public void voteAnswerDelete(int lno) throws Exception;
    public void voteAnswerEdit(VoteList voteList) throws Exception;

    public VoteUser voteUserList(VoteUser voteUser) throws Exception;
    public void voteUserInsert(VoteUser voteUser) throws Exception;
    public void voteUserDelete(int uno) throws Exception;
    public void voteUserEdit(VoteUser voteUser) throws Exception;

    public List<VoteCount> voteCountList(int vno) throws Exception;
    public int voteCountCnt(int vno) throws Exception;

}