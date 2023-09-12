package kr.co.tspoon.dao;

import kr.co.tspoon.dto.DataFile;

import java.util.List;

public interface DataFileDAO {
    // DataFile
    public List<DataFile> dataFileList() throws Exception;
    public List<DataFile> dataFileBoardList(DataFile dataFile) throws Exception;
    public DataFile dataFileGet(int fno) throws Exception;
    public int dataFileCount() throws Exception;
    public void dataFileInsert(DataFile dataFile) throws Exception;
    public void dataFileUpdate(DataFile dataFile) throws Exception;
    public void dataFileDelete(int fno) throws Exception;
}
