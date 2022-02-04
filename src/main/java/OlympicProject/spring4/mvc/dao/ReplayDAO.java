package OlympicProject.spring4.mvc.dao;

import OlympicProject.spring4.mvc.vo.ReplayVO;

import java.util.List;

public interface ReplayDAO {

    List<ReplayVO> selectReplay(int startnum, String event, String country);

    int countReplay(String event, String country);

    List<ReplayVO> selectAjaxReplay(int startnum);

    ReplayVO selectOneReplay(String rno);

    List<ReplayVO> selectAllReplay();

    void viewCountReplay(String rno);

    ReplayVO selectMaxReplay();

    ReplayVO selectRecMaxReplay();
}
