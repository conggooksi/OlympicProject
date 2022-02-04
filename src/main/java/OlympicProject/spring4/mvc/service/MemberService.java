package OlympicProject.spring4.mvc.service;

import OlympicProject.spring4.mvc.vo.MemberVO;

public interface MemberService {

    int checkUserid(String uid);

    boolean newMember(MemberVO mvo);

    boolean loginMember(MemberVO mvo);

}
