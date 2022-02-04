package OlympicProject.spring4.mvc.dao;


import OlympicProject.spring4.mvc.vo.EventVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("edao")
public class EventDAOImpl implements EventDAO {

    @Autowired private JdbcTemplate jdbcTemplate;
    @Value("#{sql['selectOneEvent']}") private String selectOneEvent;

    @Override
    public EventVO selectOneEvent(String event) {
        Object[] params = new Object[] { event };

        return jdbcTemplate.queryForObject(selectOneEvent, params,
                (rs, num) -> new EventVO(
                  rs.getString("eno"),
                  rs.getString("event"),
                  rs.getString("eventkor"),
                  rs.getString("exp"),
                  rs.getString("exp_img"),
                  rs.getString("best"),
                  rs.getString("best_img"),
                  rs.getString("schedule"),
                  rs.getString("place"),
                  rs.getString("play"),
                  rs.getString("history")));
    }

    //@Value("#{sql['selectReplay']}") private String selectReplay;



//    @Override
//    public List<ReplayVO> selectReplay(int startnum, String event, String country) {
//        Object[] params = new Object[] { startnum };
//
//
//        String dynaSQL = selectReplay + pagingReplay;
//        String whereSQL = "";
//
//        if ( event != null ) {
//            whereSQL = String.format(" where event = '%s' ", event);
//            dynaSQL = selectReplay + whereSQL + pagingReplay;
//        } else if ( country != null ) {
//            whereSQL = String.format(" where country = '%s' ", country);
//            dynaSQL = selectReplay + whereSQL + pagingReplay;
//        }
//
//
//        return jdbcTemplate.query(dynaSQL, params,
//                (rs, num) -> new ReplayVO(
//                   rs.getString("rno"),
//                   rs.getString("title"),
//                   rs.getString("event"),
//                   rs.getString("country"),
//                   rs.getString("rec"),
//                   rs.getString("views"),
//                   rs.getString("fname"),
//                   rs.getString("contents")
//                ) );
//
//    }

}
