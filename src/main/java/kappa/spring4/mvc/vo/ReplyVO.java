package kappa.spring4.mvc.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReplyVO {
    private String rno;
    private String cno;
    private String bno;
    private String reply;
    private String userid;
    private String regdate;

}
