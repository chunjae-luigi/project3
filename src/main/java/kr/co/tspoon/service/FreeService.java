package kr.co.tspoon.service;

import kr.co.tspoon.dto.Free;
import kr.co.tspoon.util.Page;

import java.util.List;

public interface FreeService {
    public List<Free> freeList(Page page) throws Exception;
    public int totalCount(Page page) throws Exception;
    public Free freeDetail(int fno) throws Exception;
    public void freeInsert(Free dto) throws Exception;
    public void freeEdit(Free dto) throws Exception;
    public void freeDelete(int fno) throws Exception;
}
