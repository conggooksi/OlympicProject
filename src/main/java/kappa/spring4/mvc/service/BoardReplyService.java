package kappa.spring4.mvc.service;

import kappa.spring4.mvc.vo.ReplyVO;

import java.util.List;

public interface BoardReplyService {
    List<ReplyVO> readReply(String bno);

    void newReply(ReplyVO rvo);

    void newReReply(ReplyVO rvo);
}
