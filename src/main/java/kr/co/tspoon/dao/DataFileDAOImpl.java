package kr.co.tspoon.dao;

import kr.co.tspoon.dto.DataFile;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DataFileDAOImpl implements DataFileDAO {

    @Autowired
    private SqlSession sqlSession;


    // DataFile
    @Override
    public List<DataFile> dataFileList() throws Exception {
        return sqlSession.selectList("dataFile.dataFileList");
    }

    @Override
    public List<DataFile> dataFileBoardList(DataFile dataFile) throws Exception {
        return sqlSession.selectList("dataFile.dataFileBoardList", dataFile);
    }

    @Override
    public DataFile dataFileGet(int fno) throws Exception {
        sqlSession.update("dataFile.dataFileCountUp", fno);
        return sqlSession.selectOne("dataFile.dataFileGet", fno);
    }

    @Override
    public int dataFileCount() throws Exception {
        return sqlSession.selectOne("dataFile.dataFileCount");
    }

    @Override
    public void dataFileInsert(DataFile dataFile) throws Exception {
        sqlSession.insert("dataFile.dataFileInsert", dataFile);
    }

    @Override
    public void dataFileUpdate(DataFile dataFile) throws Exception {
        sqlSession.update("dataFile.dataFileUpdate", dataFile);
    }

    @Override
    public void dataFileDelete(int fno) throws Exception {
        sqlSession.delete("dataFile.dataFileDelete", fno);
    }
}
