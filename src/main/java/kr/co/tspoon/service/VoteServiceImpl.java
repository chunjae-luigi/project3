package kr.co.tspoon.service;

import kr.co.tspoon.dto.Vote;
import kr.co.tspoon.dto.VoteList;
import kr.co.tspoon.dto.VoteUser;
import kr.co.tspoon.vo.VoteCount;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VoteServiceImpl implements VoteService {

    @Override
    public List<Vote> voteAllList() throws Exception {
        return null;
    }

    @Override
    public List<Vote> votIngList() throws Exception {
        return null;
    }

    @Override
    public List<Vote> votedList() throws Exception {
        return null;
    }

    @Override
    public Vote voteDetail(int vno) throws Exception {
        return null;
    }

    @Override
    public int totalCount() throws Exception {
        return 0;
    }

    @Override
    public void voteInsert(Vote vote) throws Exception {

    }

    @Override
    public void voteDelete(int vno) throws Exception {

    }

    @Override
    public void voteUpdateState(int vno) throws Exception {

    }

    @Override
    public void voteEdit(Vote vote) throws Exception {

    }

    @Override
    public List<VoteList> voteAnswerList(int vno) throws Exception {
        return null;
    }

    @Override
    public void voteAnswerInsert(VoteList voteList) throws Exception {

    }

    @Override
    public void voteAnswerDelete(int lno) throws Exception {

    }

    @Override
    public void voteAnswerEdit(VoteList voteList) throws Exception {

    }

    @Override
    public boolean voteUserCheck(VoteUser voteUser) throws Exception {
        return false;
    }

    @Override
    public void voteUserInsert(VoteUser voteUser) throws Exception {

    }

    @Override
    public void voteUserDelete(int uno) throws Exception {

    }

    @Override
    public void voteAnswerEdit(VoteUser voteUser) throws Exception {

    }

    @Override
    public List<VoteCount> voteCountList(int vno) throws Exception {
        return null;
    }
}