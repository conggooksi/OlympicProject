package kappa.spring4.mvc.service;

import kappa.spring4.mvc.dao.BoardReplyDAO;
import kappa.spring4.mvc.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("brsrv")
public class BoardReplyServiceImpl implements BoardReplyService{

    @Autowired private BoardReplyDAO brdao;

    // 댓글 전체 조회
    @Override
    public List<ReplyVO> readReply(String bno) {

        return brdao.selectReply(bno);
    }
}
