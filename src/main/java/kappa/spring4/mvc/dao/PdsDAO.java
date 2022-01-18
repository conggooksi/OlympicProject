package kappa.spring4.mvc.dao;

import kappa.spring4.mvc.vo.PdsVO;

public interface PdsDAO {
    int insertPds(PdsVO pvo);

    PdsVO selectOnePds(String pno);

    PdsVO selectOneFname(String pno, String order);

    void updateDownPds(String pno, String order);
}
