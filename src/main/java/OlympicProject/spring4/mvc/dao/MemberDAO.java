package OlympicProject.spring4.mvc.dao;

import OlympicProject.spring4.mvc.vo.MemberVO;

public interface MemberDAO {
    int selectOneUserid(MemberVO mvo);

    int selectOneUserid(String uid);

    int insertMember(MemberVO mvo);

}
