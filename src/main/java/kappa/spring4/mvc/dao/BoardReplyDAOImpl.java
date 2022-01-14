package kappa.spring4.mvc.dao;

import kappa.spring4.mvc.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("brdao")
public class BoardReplyDAOImpl implements BoardReplyDAO{

    @Autowired private JdbcTemplate jdbcTemplate;
    @Value("#{sql['selectReply']}") private String selectReply;

    // 댓글 조회
    @Override
    public List<ReplyVO> selectReply(String bno) {
        Object[] params = new Object[] { bno };

        return jdbcTemplate.query(selectReply, params,
                (rs, num) -> new ReplyVO(
                        rs.getString("rno"),
                        rs.getString("cno"),
                        rs.getString("bno"),
                        rs.getString("reply"),
                        rs.getString("userid"),
                        rs.getString("regdate") ) );
    }
}
