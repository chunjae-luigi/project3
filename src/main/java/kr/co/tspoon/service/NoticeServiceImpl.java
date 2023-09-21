package kr.co.tspoon.service;

import kr.co.tspoon.dao.NoticeDAO;
import kr.co.tspoon.dto.Notice;
import kr.co.tspoon.util.Page;
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
    public List<Notice> noticeListForMain() throws Exception {
        return noticeDAO.noticeListForMain();
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

    @Override
    public List<Notice> noticeListPro(Page page) throws Exception {
        return noticeDAO.noticeListPro(page);
    }

    @Override
    public int noticeCount(Page page) throws Exception {
        return noticeDAO.noticeCount(page);
    }
}
