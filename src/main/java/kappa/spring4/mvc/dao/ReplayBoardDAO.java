package kappa.spring4.mvc.dao;

import kappa.spring4.mvc.vo.ReplayBoardVO;

import java.util.List;

public interface ReplayBoardDAO {

    List<ReplayBoardVO> selectReplay(String event, String country);
}
