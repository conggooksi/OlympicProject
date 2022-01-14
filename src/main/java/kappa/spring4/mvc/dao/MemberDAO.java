package kappa.spring4.mvc.dao;

import kappa.spring4.mvc.vo.MemberVO;
import kappa.spring4.mvc.vo.ZipcodeVO;

import java.util.List;


public interface MemberDAO {
    int selectOneUserid(String uid);

    List<ZipcodeVO> selectZipcode(String dong);

    int insertMember(MemberVO mvo);

    int selectOneUserid(MemberVO mvo);
}
