package OlympicProject.spring4.mvc.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
    private String mno;
    private String userid;
    private String passwd;
    private String name;
    private String jumin1;
    private String jumin2;
    private String zipcode;
    private String addr;
    private String etcaddr;
    private String email;
    private String tel;
    private String regdate;

}
