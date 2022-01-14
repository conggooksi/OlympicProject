package kappa.spring4.mvc.service;

import kappa.spring4.mvc.dao.BoardDAO;
import kappa.spring4.mvc.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bsrv")
public class BoardServiceImpl implements BoardService{

    @Autowired private BoardDAO bdao;

    @Override
    public List<BoardVO> readBoard(String cpage, String ftype, String fkey) {
        // 페이징 처리 시 시작번호 계산
        int startnum = (Integer.parseInt(cpage) - 1) * 25;

        return bdao.selectBoard(startnum, ftype, fkey);
    }

    // 게시물 총 갯수 조회
    @Override
    public int countBoard(String ftype, String fkey) {

        return bdao.countBoard(ftype, fkey);
    }

    // 새글쓰기 처리
    @Override
    public boolean newBoard(BoardVO bvo) {
        boolean isInserted = false;

        if (bdao.insertBoard(bvo) > 0) isInserted = true;

        return isInserted;
    }

    // 본문글 처리
    @Override
    public BoardVO readOneBoard(String bno) {

        return bdao.selectOneBoard(bno);
    }

    // 본문글 조회수 처리
    @Override
    public void viewCountBoard(String bno) {
        bdao.viewCountBoard(bno);

    }


}
