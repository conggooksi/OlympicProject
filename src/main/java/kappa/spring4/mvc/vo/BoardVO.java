package kappa.spring4.mvc.vo;

import lombok.*;

@Setter
@Getter
@NoArgsConstructor // 기본생성자
@AllArgsConstructor  // 매개변수 포함 생성자
// @ToString  <-- 여기 있는 값들을 다 출력하고 싶을 때 사용
// @Data            // 위 5가지 속성을 모두 포함
public class BoardVO {
    private String bno;
    private String title;
    private String userid;
    private String regdate;
    private String thumbs;
    private String views;
    private String contents;

}
