<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>recaptcha</title>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script> <!-- async defer 는 html를 다 읽기 전에 js를 실행하지않겠다는 동기화 -->
        function onSubmit() {
            // '나는 로봇이 아닙니다' 를 클릭하지 않앗다면
            if(grecaptcha.getResponse().length==0){
                alert('recaptcha를 클릭하세요');
                return;
            }else {
                document.getElementById('frm').submit().method = 'post';
                document.getElementById('g-recaptcha').value = grecaptcha.getResponse();
                document.getElementById('frm').submit();
            }
        }
    </script>
</head>
<body>
<h1>recaptcha</h1>
<form name="loginfrm" id="frm">
    <div>아이디 <input type="text" name="uid" id="uid"></div>
    <div>비밀번호 <input type="password" name="pwd" id="pwd"></div>
    <div><button type="button" onclick="onSubmit()">로그인</button></div>
    <div class="g-recaptcha"
         data-sitekey="6Lfc8fYdAAAAALjZYQAgnympiIdJV9L04QZ212Ld"></div>
    <input type="hidden" name="g-recaptcha" id="g-recaptcha">
</form>
</body>
</html>
