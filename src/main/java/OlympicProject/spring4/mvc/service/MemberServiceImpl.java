package OlympicProject.spring4.mvc.service;

import OlympicProject.spring4.mvc.dao.MemberDAO;
import OlympicProject.spring4.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("msrv")
public class MemberServiceImpl implements MemberService{

    @Autowired private MemberDAO mdao;

    @Override
    public int checkUserid(String uid) {
        return mdao.selectOneUserid(uid);
    }

    @Override
    public boolean newMember(MemberVO mvo) {
        boolean isInserted = false;

        if(mdao.insertMember(mvo)>0) isInserted = true;

        return isInserted;
    }
    @Override
    public boolean loginMember(MemberVO mvo) {
        boolean isLogined = false;

        if(mdao.selectOneUserid(mvo)>0)
            isLogined = true;

        return isLogined;
    }

}
