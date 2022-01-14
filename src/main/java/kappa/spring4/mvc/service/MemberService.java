package kappa.spring4.mvc.service;

import kappa.spring4.mvc.vo.MemberVO;

public interface MemberService {
    int checkUserid(String uid);
    String findZipcode(String dong);

    boolean newMember(MemberVO mvo);

    boolean loginMember(MemberVO mvo);
}
