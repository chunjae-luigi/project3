package kr.co.tspoon.service;

import kr.co.tspoon.dao.DatDAO;
import kr.co.tspoon.dto.Dat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DatServiceImpl implements DatService {

    @Autowired
    private DatDAO datDAO;

    @Override
    public List<Dat> datList(int par) throws Exception {
        return datDAO.datList(par);
    }

    @Override
    public void datInsert(Dat dto) throws Exception {
        datDAO.datInsert(dto);
    }

    @Override
    public void datEdit(Dat dto) throws Exception {
        datDAO.datEdit(dto);
    }

    @Override
    public void datDelete(int dno) throws Exception {
        datDAO.datDelete(dno);
    }
}
