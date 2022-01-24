package OlympicProject.spring4.mvc.dao;


import OlympicProject.spring4.mvc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("mdao")
public class MemberDAOImpl implements MemberDAO {

    @Value("#{sql['selectOneUserid']}") private String selectOneUserid;
    @Value("#{sql['insertMember']}") private String insertMember;
    @Value("#{sql['selectUserid']}") private String selectUserid;

    @Autowired private JdbcTemplate jdbcTemplate;

    @Override
    public int selectOneUserid(MemberVO mvo) {
        Object[] params = new Object[]{
                mvo.getUserid(),mvo.getPasswd()
        };
        return jdbcTemplate.queryForObject(selectUserid,params,Integer.class);
    }

    @Override
    public int selectOneUserid(String uid) {
        Object[] params = new Object[]{uid};
        return jdbcTemplate.queryForObject(selectOneUserid,params,Integer.class);
    }

    @Override
    public int insertMember(MemberVO mvo) {
        Object[] params = new Object[] {
                mvo.getUserid(),mvo.getPasswd(),
                mvo.getName(),mvo.getJumin1(),
                mvo.getJumin2(),mvo.getZipcode(),
                mvo.getAddr(),mvo.getEtcaddr(),
                mvo.getEmail(),mvo.getTel()
        };
        return jdbcTemplate.update(insertMember,params);
    }
}
