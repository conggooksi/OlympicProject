package kappa.spring4.mvc.controller;



import org.json.simple.JSONObject;

import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@Controller
public class CaptchaController {

    // captcha
    // Completely Automated Public Turning
    // test to tell Computers and Humans Apart
    // 어떤 사용자가 실제 사람인지 봇(컴퓨터 프로그램)인지
    // 구별하기 위해 사용하는 기법을 의미 (튜링 테스트의 일종)
    // 봇은 쉽게 구별할 수 없는 그림을 주고 그 그림에 쓰여진 내용을
    // 묻는 방법으로 부터 시작해서 지금은 다양한 기법으로 사용되고 있음

    // 웹사이트에 접근하는 대상이 사람인지 봇인지 판단하기 위해
    // 사용하는 테스트의 일종

    // Google reCaptcha
    // 구글에서 제공하는 봇 방지 API
    // 버젼1을 거쳐 지금 현재는 버젼2(행위기반/반응기반)와 버젼3(화면 로딩시 확인)이 주로 사용
    // developers.google.com/recaptcha

    //
    // codelabs.developers.google.com/codelabs/reCAPTCHA

    // recaptcha 일반키와 비밀키 발급
    // www.google.com/recaptcha/admin


    @GetMapping("/cap01")
    public String cap01() {
        return "cap01";
    }

    @GetMapping("/cap02")
    public String cap02() {
        return "cap02";
    }

    @PostMapping("/cap02")
    public String cap02ok(HttpServletRequest req) {

        // 클라이언트에서 보낸 captcha 문자열을 알아냄
        String gCaptRes = req.getParameter("g-recaptcha");
        System.out.println("g-recaptcha=" + gCaptRes);

        // captcha 문자열을 정합성 여부를 위해
        // 비밀키와 captcha 문자열을 포함한 검증 url 작성
        String secretKey = "6Lfb8fYdAAAAALeE0uLLgfcwe7Djb5mZyGOvefQy";
        String verifyURL = "https://www.google.com/recaptcha/api/siteverify";
        String params = "secret=" + secretKey + "&response=" + gCaptRes;

        try {
            String jsonData = ""; // 결과 저장용 변수 선언

            URL url = new URL(verifyURL);
            HttpURLConnection huconn = (HttpURLConnection) url.openConnection();
            huconn.setRequestMethod("POST"); // 요청방식 지정
            huconn.setDoInput(true);
            huconn.setDoOutput(true);

            DataOutputStream os = new DataOutputStream(huconn.getOutputStream());
            os.writeBytes(params); // 요청매개변수 전송
            os.flush();
            os.close();

            InputStream is = huconn.getInputStream();
            BufferedReader br = new BufferedReader(
                    new InputStreamReader(is, "UTF-8"));
            // 응답결과 받아오기
            StringBuffer sb = new StringBuffer();

            while ((jsonData = br.readLine()) != null) {
                sb.append(jsonData);
            } // 응답결과를 변수에 저장

            JSONParser parser = new JSONParser();
            Object resvObj = parser.parse(sb.toString());
            JSONObject jsonObj = (JSONObject) resvObj;
            // JSON 형식의 문자열을 JSON 객체로 변환환

           System.out.println( jsonObj.get("success") );
            System.out.println( jsonObj.get("score") );
            System.out.println( jsonObj.get("action") );
            // captcha 문자열의 정합성 결과 출력

        } catch (Exception e) {

            e.printStackTrace();
        }

        return "cap02";
    }

}
