package kappa.spring4.mvc.dao;

import kappa.spring4.mvc.vo.PdsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("pdao")
public class PdsDAOImpl implements PdsDAO{

    @Autowired private JdbcTemplate jdbcTemplate;

    @Value("#{sql['insertPds']}") private String insertPds;
    @Value("#{sql['selectOnePds']}") private String selectOnePds;

    @Override
    public int insertPds(PdsVO pvo) {
        Object[] params = new Object[] { pvo.getTitle(), pvo.getUserid(),
                pvo.getFname1(), pvo.getFname2(), pvo.getFname3(),
                pvo.getFsize1(), pvo.getFsize2(), pvo.getFsize3(),
                pvo.getFtype1(), pvo.getFtype2(), pvo.getFtype3(),
                pvo.getContents(), pvo.getUuid() };

        return jdbcTemplate.update(insertPds, params);
    }

    // 자료실 본문보기
    @Override
    public PdsVO selectOnePds(String pno) {
        Object[] params = new Object[] { pno } ;

        return jdbcTemplate.queryForObject(selectOnePds, params,
                (rs, num) -> new PdsVO(
                        rs.getString("pno"),
                        rs.getString("title"),
                        rs.getString("userid"),
                        rs.getString("regdate"),
                        rs.getString("thumbs"),
                        rs.getString("views"),
                        rs.getString("fname1"),
                        rs.getString("fname2"),
                        rs.getString("fname3"),
                        rs.getString("fsize1"),
                        rs.getString("fsize2"),
                        rs.getString("fsize3"),
                        rs.getString("ftype1"),
                        rs.getString("ftype2"),
                        rs.getString("ftype3"),
                        rs.getString("fdown1"),
                        rs.getString("fdown2"),
                        rs.getString("fdown3"),
                        rs.getString("contents"),
                        rs.getString("uuid") ) );
    }

    // 다운로드할 파일명 알아내기
    @Override
    public PdsVO selectOneFname(String pno, String order) {
        String dynaSQL = String.format("select fname%s fname1, uuid from pds where pno = ?", order);

        Object[] params = new Object[] { pno };

        return jdbcTemplate.queryForObject(dynaSQL, params,
                (rs, num) -> new PdsVO(
                        rs.getString("fname1"),
                        rs.getString("uuid") ) );
    }

    // 다운로드한 파일 다운 수 처리
    @Override
    public void updateDownPds(String pno, String order) {
        String dynaSQL = String.format(
                "update pds set fdown%s = fdown%s + 1 where pno = ?", order, order);

        Object[] params = new Object[] { pno };

        jdbcTemplate.update(dynaSQL, params);
    }
}
