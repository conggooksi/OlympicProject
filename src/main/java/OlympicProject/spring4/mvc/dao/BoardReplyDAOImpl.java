package OlympicProject.spring4.mvc.dao;


import OlympicProject.spring4.mvc.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("brdao")
public class BoardReplyDAOImpl implements BoardReplyDAO{

    @Autowired private JdbcTemplate jdbcTemplate;
    @Value("#{sql['selectReply']}") private String selectReply;
    @Value("#{sql['insertReply']}") private String insertReply;
    @Value("#{sql['insertReReply']}") private String insertReReply;


    //댓글 조회
    @Override
    public List<ReplyVO> selectReply(String bno) {
        Object[] params = new Object[] {bno};

        return jdbcTemplate.query(selectReply, params,
                (rs, num) -> new ReplyVO(
                        rs.getString("rno"),
                        rs.getString("cno"),
                        rs.getString("bno"),
                        rs.getString("reply"),
                        rs.getString("userid"),
                        rs.getString("regdate") ) );
    }

    //댓글 처리
    @Override
    public void insertReply(ReplyVO rvo) {
        Object[] param = new Object[] {rvo.getBno(),rvo.getUserid(),rvo.getReply() };

        jdbcTemplate.update(insertReply, param);
    }

    //대댓글 처리
    @Override
    public void insertReReply(ReplyVO rvo) {
        Object[] param = new Object[]{
                rvo.getCno(), rvo.getBno(), rvo.getUserid(), rvo.getReply()
        };

        jdbcTemplate.update(insertReReply, param);
    }
}
