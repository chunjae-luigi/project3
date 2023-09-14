package kr.co.tspoon.service;

import kr.co.tspoon.dao.VoteDAO;
import kr.co.tspoon.dto.Vote;
import kr.co.tspoon.dto.VoteList;
import kr.co.tspoon.dto.VoteUser;
import kr.co.tspoon.vo.VoteCount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VoteServiceImpl implements VoteService {

    @Autowired
    private VoteDAO voteDAO;

    @Override
    public List<Vote> voteAllList() throws Exception {
        return voteDAO.voteAllList();
    }

    @Override
    public Vote voteDetail(int vno, String author) throws Exception {
        if(!author.equals("admin")) {
            voteDAO.voteVisitCount(vno);
        }
        return voteDAO.voteDetail(vno);
    }

    @Override
    public int totalCount() throws Exception {
        return voteDAO.totalCount();
    }

    @Override
    public void voteInsert(Vote vote) throws Exception {
        voteDAO.voteInsert(vote);
    }

    @Override
    public void voteDelete(int vno) throws Exception {
        voteDAO.voteDelete(vno);
    }

    @Override
    public void voteUpdateState(int vno) throws Exception {
        voteDAO.voteUpdateState(vno);
    }

    @Override
    public void voteEdit(Vote vote) throws Exception {
        voteDAO.voteEdit(vote);
    }

    @Override
    public List<VoteList> voteAnswerList(int vno) throws Exception {
        return voteDAO.voteAnswerList(vno);
    }

    @Override
    public void voteAnswerInsert(VoteList voteList) throws Exception {
        voteDAO.voteAnswerInsert(voteList);
    }

    @Override
    public void voteAnswerDelete(int lno) throws Exception {
        voteDAO.voteAnswerDelete(lno);
    }

    @Override
    public void voteAnswerEdit(VoteList voteList) throws Exception {
        voteDAO.voteAnswerEdit(voteList);
    }

    @Override
    public boolean voteUserCheck(VoteUser voteUser) throws Exception {
        boolean pass = false;
        VoteUser voteList =  voteDAO.voteUserCheck(voteUser);
        if(voteList != null) {
            pass = true;
        }
        return pass;
    }

    @Override
    public void voteUserInsert(VoteUser voteUser) throws Exception {
        voteDAO.voteUserInsert(voteUser);
    }

    @Override
    public void voteUserDelete(int uno) throws Exception {
        voteDAO.voteUserDelete(uno);
    }

    @Override
    public void voteUserEdit(VoteUser voteUser) throws Exception {
        voteDAO.voteUserEdit(voteUser);
    }

    @Override
    public List<VoteCount> voteCountList(int vno) throws Exception {
        return voteDAO.voteCountList(vno);
    }

    @Override
    public int voteCountCnt(int vno) throws Exception {
        return voteDAO.voteCountCnt(vno);
    }
}