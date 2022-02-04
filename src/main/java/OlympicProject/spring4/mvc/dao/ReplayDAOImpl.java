package OlympicProject.spring4.mvc.dao;


import OlympicProject.spring4.mvc.vo.ReplayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("rdao")
public class ReplayDAOImpl implements ReplayDAO {

    @Autowired private JdbcTemplate jdbcTemplate;
    @Value("#{sql['selectReplay']}") private String selectReplay;
    @Value("#{sql['pagingReplay']}") private String pagingReplay;
    @Value("#{sql['countReplay']}") private String countReplay;
    @Value("#{sql['selectAjaxReplay']}") private String selectAjaxReplay;
    @Value("#{sql['selectOneReplay']}") private String selectOneReplay;
    @Value("#{sql['selectAllReplay']}") private String selectAllReplay;
    @Value("#{sql['viewCountReplay']}") private String viewCountReplay;
    @Value("#{sql['selectMaxReplay']}") private String selectMaxReplay;
    @Value("#{sql['selectRecMaxReplay']}") private String selectRecMaxReplay;

    // 다시보기 메인페이지 처리
    @Override
    public List<ReplayVO> selectReplay(int startnum, String event, String country) {
        Object[] params = new Object[] { startnum };


        String dynaSQL = selectReplay + pagingReplay;
        String whereSQL = "";

        if ( event != null ) {
            whereSQL = String.format(" where event = '%s' ", event);
            dynaSQL = selectReplay + whereSQL + pagingReplay;
        } else if ( country != null ) {
            whereSQL = String.format(" where country = '%s' ", country);
            dynaSQL = selectReplay + whereSQL + pagingReplay;
        }


        return jdbcTemplate.query(dynaSQL, params,
                (rs, num) -> new ReplayVO(
                   rs.getString("rno"),
                   rs.getString("title"),
                   rs.getString("event"),
                   rs.getString("country"),
                   rs.getString("rec"),
                   rs.getString("views"),
                   rs.getString("fname"),
                   rs.getString("mname"),
                   rs.getString("contents")
                ) );

    }

    // 조회수 처리
    @Override
    public int countReplay(String event, String country) {

        String dynaSQL = countReplay;
        String whereSQL = "";

        if ( event != null ) {
            whereSQL = String.format(" where event = '%s' ", event);
            dynaSQL = countReplay + whereSQL;
        } else if ( country != null ) {
            whereSQL = String.format(" where country = '%s' ", country);
            dynaSQL = countReplay + whereSQL;
        }


        return jdbcTemplate.queryForObject(dynaSQL, Integer.class );

    }

    // 더보기 처리
    @Override
    public List<ReplayVO> selectAjaxReplay(int startnum) {
        Object[] params = new Object[] { startnum };

        return jdbcTemplate.query(selectAjaxReplay, params,
                (rs, num) -> new ReplayVO(
                        rs.getString("rno"),
                        rs.getString("title"),
                        rs.getString("event"),
                        rs.getString("country"),
                        rs.getString("rec"),
                        rs.getString("views"),
                        rs.getString("fname"),
                        rs.getString("mname"),
                        rs.getString("contents") ) );

    }

    // 영상 보기 관련
    @Override
    public ReplayVO selectOneReplay(String rno) {
        Object[] params = new Object[] { rno };

        return jdbcTemplate.queryForObject(selectOneReplay, params,
                (rs, num) -> new ReplayVO(
                        rs.getString("rno"),
                        rs.getString("title"),
                        rs.getString("event"),
                        rs.getString("country"),
                        rs.getString("rec"),
                        rs.getString("views"),
                        rs.getString("fname"),
                        rs.getString("mname"),
                        rs.getString("contents")
                ));
    }

    @Override
    public List<ReplayVO> selectAllReplay() {
        Object[] params = new Object[] { };

        return jdbcTemplate.query(selectAllReplay, params,
                (rs, num) -> new ReplayVO(
                        rs.getString("rno"),
                        rs.getString("title"),
                        rs.getString("event"),
                        rs.getString("country"),
                        rs.getString("rec"),
                        rs.getString("views"),
                        rs.getString("fname"),
                        rs.getString("mname"),
                        rs.getString("contents") ) );
    }

    @Override
    public void viewCountReplay(String rno) {
        Object[] params = new Object[] { rno };

        jdbcTemplate.update((viewCountReplay), params);
    }

    @Override
    public ReplayVO selectMaxReplay() {
        Object[] params = new Object[] { };


        return jdbcTemplate.queryForObject(selectMaxReplay, params,
                (rs, num) -> new ReplayVO(
                        rs.getString("rno"),
                        rs.getString("title"),
                        rs.getString("event"),
                        rs.getString("country"),
                        rs.getString("rec"),
                        rs.getString("views"),
                        rs.getString("fname"),
                        rs.getString("mname"),
                        rs.getString("contents")
                ));
    }

    @Override
    public ReplayVO selectRecMaxReplay() {
        Object[] params = new Object[] { };


        return jdbcTemplate.queryForObject(selectRecMaxReplay, params,
                (rs, num) -> new ReplayVO(
                        rs.getString("rno"),
                        rs.getString("title"),
                        rs.getString("event"),
                        rs.getString("country"),
                        rs.getString("rec"),
                        rs.getString("views"),
                        rs.getString("fname"),
                        rs.getString("mname"),
                        rs.getString("contents")
                ));
    }

}
