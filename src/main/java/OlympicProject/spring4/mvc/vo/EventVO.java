package OlympicProject.spring4.mvc.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor // 기본생성자
@AllArgsConstructor  // 매개변수 포함 생성자
// @ToString  <-- 여기 있는 값들을 다 출력하고 싶을 때 사용
// @Data            // 위 5가지 속성을 모두 포함
public class EventVO {
    private String eno;
    private String event;
    private String eventkor;
    private String exp;
    private String exp_img;
    private String best;
    private String best_img;
    private String schedule;
    private String place;
    private String play;
    private String history;

}
