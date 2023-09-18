package kr.co.tspoon.dao;

import kr.co.tspoon.dto.Dat;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DatDAOImpl implements DatDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Dat> datList(int par) throws Exception {
        return sqlSession.selectList("dat.datList", par);
    }

    @Override
    public void datInsert(Dat dto) throws Exception {
        sqlSession.insert("dat.datInsert", dto);
    }

    @Override
    public void datEdit(Dat dto) throws Exception {
        sqlSession.update("dat.datEdit", dto);
    }

    @Override
    public void datDelete(int dno) throws Exception {
        sqlSession.delete("dat.datDelete", dno);
    }
}
