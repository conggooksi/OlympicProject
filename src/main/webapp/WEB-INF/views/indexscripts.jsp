<%@ page pageEncoding="UTF-8" %>

<script>
    //로그인 처리
    $('#loginbtn').on('click',function (){processLogin();});

    function processLogin(){
        if($('#userid').val()=='') alert('아이디를 입력하세요!!');
        else if($('#passwd').val()=='') alert('비밀번호를 입력하세요!!');
        else{
            $('#loginfrm').attr('method','post');
            $('#loginfrm').attr('action','/login');
            $('#loginfrm').submit();
        }
    }

    //로그아웃 처리
    $('#logoutbtn').on('click',function (){
        location.href = '/logout';
    });

    //플롵팅 배너
    $(document).ready(function() {

        // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
        var floatPosition = parseInt($("#floatMenu").css('top'));
        // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

        $(window).scroll(function() {
            // 현재 스크롤 위치를 가져온다.
            var scrollTop = $(window).scrollTop();
            var newPosition = scrollTop + floatPosition + "px";

            /* 애니메이션 없이 바로 따라감
             $("#floatMenu").css('top', newPosition);
             */

            $("#floatMenu").stop().animate({
                "top" : newPosition
            }, 500);

        }).scroll();

    });

    //카카오 로그인
        Kakao.init('832189713d16f02c2d8850e26973579f'); //발급받은 키 중 javascript키를 사용해준다.
        console.log(Kakao.isInitialized()); // sdk초기화여부판단
        //카카오로그인
    $('#kakaologbtn').on('click',function (){kakaoLogin();});
        function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                        console.log(response)
                    },
                    fail: function (error) {
                        console.log(error)
                    },
                })
            },
            fail: function (error) {
                console.log(error)
            },
        })
    }
    //카카오로그아웃
    $('#kakaologoutbtn').on('click',function(){kakaoLogout();});
    function kakaoLogout() {
        if (Kakao.Auth.getAccessToken()) {
            Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (response) {
                    console.log(response)
                },
                fail: function (error) {
                    console.log(error)
                },
            })
            Kakao.Auth.setAccessToken(undefined)
        }
    }



</script>