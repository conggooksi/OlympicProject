package kappa.spring4.mvc.service;

import kappa.spring4.mvc.dao.ReplayBoardDAO;
import kappa.spring4.mvc.vo.ReplayBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("rsrv")
public class ReplayBoardServiceImpl implements ReplayBoardService {

    @Autowired private ReplayBoardDAO rdao;


    @Override
    public List<ReplayBoardVO> readReplay(String event, String country) {

        return rdao.selectReplay(event, country);
    }
}
