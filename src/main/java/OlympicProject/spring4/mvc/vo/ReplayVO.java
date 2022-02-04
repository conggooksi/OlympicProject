package OlympicProject.spring4.mvc.vo;

import lombok.*;

@Setter
@Getter
@NoArgsConstructor // 기본생성자
@AllArgsConstructor  // 매개변수 포함 생성자
// @ToString  <-- 여기 있는 값들을 다 출력하고 싶을 때 사용
// @Data            // 위 5가지 속성을 모두 포함
public class ReplayVO {
    private String rno;
    private String title;
    private String event;
    private String country;
    private String rec;
    private String views;
    private String fname;
    private String mname;
    private String contents;

}
