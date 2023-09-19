package kr.co.tspoon.service;

import kr.co.tspoon.dao.FreeDAO;
import kr.co.tspoon.dto.Free;
import kr.co.tspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeServiceImpl implements FreeService {

    @Autowired
    private FreeDAO freeDAO;

    @Override
    public List<Free> freeList(Page page) throws Exception {
        return freeDAO.freeList(page);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return freeDAO.totalCount(page);
    }

    @Override
    public Free freeDetail(int fno) throws Exception {
        return freeDAO.freeDetail(fno);
    }

    @Override
    public void freeInsert(Free dto) throws Exception {
        freeDAO.freeInsert(dto);
    }

    @Override
    public void freeDelete(int fno) throws Exception {
        freeDAO.freeDelete(fno);
    }

    @Override
    public void freeEdit(Free dto) throws Exception {
        freeDAO.freeEdit(dto);
    }
}