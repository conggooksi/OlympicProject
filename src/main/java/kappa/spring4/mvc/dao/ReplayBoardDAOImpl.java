package kappa.spring4.mvc.dao;


import kappa.spring4.mvc.vo.ReplayBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("rdao")
public class ReplayBoardDAOImpl implements ReplayBoardDAO {

    @Autowired private JdbcTemplate jdbcTemplate;
    @Value("#{sql['selectReplay']}") private String selectReplay;


    @Override
    public List<ReplayBoardVO> selectReplay(String event, String country) {
        Object[] params = new Object[] { event, country };



        return jdbcTemplate.query(selectReplay, params,
                (rs, num) -> new ReplayBoardVO(
                   rs.getString("rno"),
                   rs.getString("event"),
                   rs.getString("country"),
                   rs.getString("rec"),
                   rs.getString("views") ) );

    }
}
