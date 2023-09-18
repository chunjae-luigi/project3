package kr.co.tspoon.service;

import kr.co.tspoon.dto.Free;

import java.util.List;

public interface FreeService {
    public List<Free> freeList() throws Exception;
    public Free freeDetail(int fno) throws Exception;
    public void freeInsert(Free dto) throws Exception;
    public void freeEdit(Free dto) throws Exception;
    public void freeDelete(int fno) throws Exception;
}
