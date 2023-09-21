package kr.co.tspoon.service;

import kr.co.tspoon.dto.Notice;
import kr.co.tspoon.util.Page;

import java.util.List;

public interface NoticeService {

    public List<Notice> noticeList() throws Exception;
    public List<Notice> noticeListForMain() throws Exception;
    public Notice noticeGet(int no) throws Exception;
    public void noticeInsert(Notice notice) throws Exception;
    public void noticeUpdate(Notice notice) throws Exception;
    public void noticeDelete(int no) throws Exception;

    public List<Notice> noticeListPro(Page page) throws Exception;
    public int noticeCount(Page page) throws Exception;
}
