package kappa.spring4.mvc.service;

import kappa.spring4.mvc.vo.BoardVO;

import java.util.List;

public interface BoardService {
    List<BoardVO> readBoard(String cpage, String ftype, String fkey);

    int countBoard(String ftype, String fkey);

    boolean newBoard(BoardVO bvo);

    BoardVO readOneBoard(String bno);

    void viewCountBoard(String bno);
}
