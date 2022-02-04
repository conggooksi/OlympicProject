package OlympicProject.spring4.mvc.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import OlympicProject.spring4.mvc.dao.ReplayDAO;
import OlympicProject.spring4.mvc.vo.ReplayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("rsrv")
public class ReplayServiceImpl implements ReplayService {

    @Autowired private ReplayDAO rdao;

    // 다시보기 메인 페이지 출력
    @Override
    public List<ReplayVO> readReplay(String cpage, String event, String country) {

        int startnum = (Integer.parseInt(cpage)-1)*3;

        return rdao.selectReplay(startnum, event, country);
    }

    // 조회수 관련
    @Override
    public int countReplay(String event, String country) {

        return rdao.countReplay(event,country);
    }

    // 더보기 관련
    @Override
    public String morePlay(String rno) {
        int startnum = (Integer.parseInt(rno)-1)*3;

        ObjectMapper mapper = new ObjectMapper();
        String json = "";

        try {
            json = mapper.writeValueAsString(rdao.selectAjaxReplay(startnum));
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return json;
    }

    // 영상 보기 관련
    @Override
    public ReplayVO readOneReplay(String rno) {

        return rdao.selectOneReplay(rno);
    }

    @Override
    public List<ReplayVO> readAllReplay() {

        return rdao.selectAllReplay();
    }

    @Override
    public void viewCountReplay(String rno) {
        rdao.viewCountReplay(rno);

    }

    @Override
    public ReplayVO readMaxReplay() {

        return rdao.selectMaxReplay();
    }

    @Override
    public ReplayVO readRecMaxReplay() {
        return rdao.selectRecMaxReplay();
    }


}
