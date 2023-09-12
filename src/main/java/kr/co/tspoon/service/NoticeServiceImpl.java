package kr.co.tspoon.service;

import kr.co.tspoon.dao.NoticeDAO;
import kr.co.tspoon.dto.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeDAO noticeDAO;

    @Override
    public List<Notice> noticeList() throws Exception {
        return noticeDAO.noticeList();
    }

    @Override
    public Notice noticeGet(int no) throws Exception {
        return noticeDAO.noticeGet(no);
    }

    @Override
    public void noticeInsert(Notice notice) throws Exception {
        noticeDAO.noticeInsert(notice);
    }

    @Override
    public void noticeUpdate(Notice notice) throws Exception {
        noticeDAO.noticeUpdate(notice);
    }

    @Override
    public void noticeDelete(int no) throws Exception {
        noticeDAO.noticeDelete(no);

    }
}
