package kappa.spring4.mvc.dao;

import kappa.spring4.mvc.vo.MemberVO;
import kappa.spring4.mvc.vo.ZipcodeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("mdao")
public class MemberDAOImpl implements MemberDAO{

    @Value("#{sql['selectOneUserid']}") private String selectOneUserid;
    @Value("#{sql['findZipcode']}") private String findZipcode;
    @Value("#{sql['insertMember']}") private String insertMember;
    @Value("#{sql['selectUserid']}") private String selectUserid;

    @Autowired private JdbcTemplate jdbcTemplate;

    // 아이디 중복 체크
    @Override
    public int selectOneUserid(String uid) {
        Object[] params = new Object[] { uid };

        return jdbcTemplate.queryForObject(selectOneUserid, params, Integer.class);
    }

    // 우편번호 검색
    @Override
    public List<ZipcodeVO> selectZipcode(String dong) {
        Object[] params = new Object[] { dong };

        return jdbcTemplate.query(findZipcode, params,
                (rs, num) -> new ZipcodeVO(
                        rs.getString("zipcode"),
                        rs.getString("sido"),
                        rs.getString("gugun"),
                        rs.getString("dong"),
                        rs.getString("ri"))
        );
    }

    // 회원정보 저장
    @Override
    public int insertMember(MemberVO mvo) {
        Object[] params = new Object[] {
                mvo.getUserid(), mvo.getPasswd(), mvo.getName(),
                mvo.getJumin1(), mvo.getJumin2(), mvo.getZipcode(),
                mvo.getAddr(), mvo.getEtcaddr(), mvo.getEmail(), mvo.getTel()
        };

        return jdbcTemplate.update(insertMember, params);
    }

    // 로그인 처리
    @Override
    public int selectOneUserid(MemberVO mvo) {
        Object[] params = new Object[] { mvo.getUserid(), mvo.getPasswd() };

        return jdbcTemplate.queryForObject(selectUserid, params, Integer.class);
    }


}
