package kappa.spring4.mvc.dao;

import kappa.spring4.mvc.vo.BoardVO;

import java.util.List;

public interface BoardDAO {

    List<BoardVO> selectBoard(int startnum, String ftype, String fkey);

    int countBoard(String ftype, String fkey);

    int insertBoard(BoardVO bvo);

    BoardVO selectOneBoard(String bno);

    void viewCountBoard(String bno);
}
