package OlympicProject.spring4.mvc.dao;



import OlympicProject.spring4.mvc.vo.ReplyVO;

import java.util.List;

public interface BoardReplyDAO {
    List<ReplyVO> selectReply(String bno);

    void insertReply(ReplyVO rvo);

    void insertReReply(ReplyVO rvo);
}
