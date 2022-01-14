<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>recaptcha</title>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script>
        function onSubmit() {
            // '나는 로봇이 아닙니다'를 클릭하지 않았다면
            if (grecaptcha.getResponse().length == 0) {
                alert('recaptcha를 클릭하세요!');
                return;
            } else{
            document.getElementById('frm').submit();
            }
        }
    </script>
</head>
<body>
<h1>recaptcha</h1>
<form name="loginfrm" id="frm">
    <div>아이디 <input type="text" name="uid" id="uid" /></div>
    <div>비밀번호 <input type="password" name="pwd" id="pwd" /></div>
    <div><button type="button" onclick="onSubmit()">로그인</button></div>

    <div class="g-recaptcha"
         data-sitekey="6Lfb8fYdAAAAABH90Sqn4H0ssa4tvUleIweFOzQ-"></div>
</form>


</body>
</html>
