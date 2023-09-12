package kr.co.tspoon.service;

import kr.co.tspoon.dao.BoardDAO;
import kr.co.tspoon.dao.DataFileDAO;
import kr.co.tspoon.dto.DataFile;
import kr.co.tspoon.dto.Qna;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DataFileServiceImpl implements DataFileService {

    @Autowired
    private DataFileDAO dataFileDAO;

    @Override
    public List<DataFile> dataFileList() throws Exception {
        return dataFileDAO.dataFileList();
    }

    @Override
    public List<DataFile> dataFileBoardList(DataFile dataFile) throws Exception {
        return dataFileDAO.dataFileBoardList(dataFile);
    }

    @Override
    public DataFile dataFileGet(int fno) throws Exception {
        return dataFileDAO.dataFileGet(fno);
    }

    @Override
    public int dataFileCount() throws Exception {
        return dataFileDAO.dataFileCount();
    }

    @Override
    public void dataFileInsert(DataFile dataFile) throws Exception {
        dataFileDAO.dataFileInsert(dataFile);
    }

    @Override
    public void dataFileUpdate(DataFile dataFile) throws Exception {
        dataFileDAO.dataFileUpdate(dataFile);
    }

    @Override
    public void dataFileDelete(int fno) throws Exception {
        dataFileDAO.dataFileDelete(fno);
    }
}
