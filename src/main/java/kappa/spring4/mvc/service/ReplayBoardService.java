package kappa.spring4.mvc.service;

import kappa.spring4.mvc.vo.ReplayBoardVO;

import java.util.List;

public interface ReplayBoardService {

    List<ReplayBoardVO> readReplay(String event, String country);
}
