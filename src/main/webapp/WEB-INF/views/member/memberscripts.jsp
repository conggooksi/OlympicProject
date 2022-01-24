<%@ page pageEncoding="UTF-8" %>

<script>
    function agreecheck() { //이용약관 /개인정보이용 동의 확인
        let agree1 = document.getElementById('agree1');
        let agree2 = document.getElementById('agree2');
        let agree3 = document.getElementById('agree3');

        if (!agree2.checked) alert('이용약관에 동의하세요!');
        else if (!agree3.checked) alert('개인정보 이용에 동의해주세요!');
        else location.href = '/member/mcheckme';
    }

    try {
        let okagree = document.getElementById("okagree");
        okagree.addEventListener('click', agreecheck);
    }catch (e){
        //   alert('agree 관련 오류 발생!!');
    }
    //전체 체크
    $('#agree1').click(function(){
        var checked = $('#agree1').is(':checked');

        if(checked)
            $('input:checkbox').prop('checked',true);
    });

    function realcheck() {
        let name2 = document.getElementById('name2');
        let jumin1 = document.getElementById('jumin1');
        let jumin2 = document.getElementById('jumin2');
        let usejm = document.getElementById('usejm');

        if (name2.value == '') alert('이름을 입력해주세요');
        else if (jumin1.value == ''||jumin2.value == '') alert('주민번호를 입력해주세요');
        else if (!usejm.checked) alert('처리 동의에 체크해주세요!');

        else {
            //질의 문자열 생성
            let params='?nm='+name2.value;
            params+='&jm1='+jumin1.value;
            params+='&jm2='+jumin2.value;
            location.href = '/member/mjoinme' + params;
        }
    }

    //문서 내 특정 요소 지정후 액션 지정 : $(선택자).함수명
    $('#check2btn').on("click",function (){realcheck();});

    //아이디 중복 체크
    $('#userid').on('blur',function (){checkuid()})
    function checkuid(){
        let uid=$('#userid').val().trim();//trim()공백제거용 함수
        if(uid=='') {
            alert('아이디를 입력해주세요!');
            return;//함수 실행 중단
        }
        $.ajax({
            // /member/checkuid?uid=****
            url:'/member/checkuid',//비동기 요청 주소
            type:'get',//비동기 요청 방식
            data:{uid:uid}//비동기 요청시 사용할 데이터
        }) // 비동기 요청
            .done(function (data){
                let msg='사용불가 아이디 입니다!';
                if(data.trim()=='0'){
                    msg='사용가능한 아이디 입니다';
                    $('#uidmsg').attr('style','color:blue');
                }else{
                    $('#uidmsg').attr('style','color:red');
                }
                $('#uidmsg').text(msg);
            }) // 비동기 요청 성공시
            .fail(function (xhr,status,error){
                alert(xhr,status+'/'+error);
            });// 비동기 요청 실패시

    }

    //비밀번호 일치 여부 확인
    $('#repwd').on('blur',function (){checkpwd()})
    function checkpwd(){
        let pwd=$('#passwd').val();
        let repwd=$('#repwd').val();
        let msg = '비밀번호가 서로 일치하지 않습니다!';
        if(pwd==repwd){
            msg='비밀번호가 일치합니다';
            $('#pwdmsg').attr('style','color:blue');
        }else{
            $('#pwdmsg').attr('style','color:red');
        }
        $('#pwdmsg').text(msg);

    }

    //이메일 도메인주소 선택
    $('#email3').on('change',function (){
        //선택한 이메일 도메인 알아냄
        let val=$('#email3 option:selected').text();

        if(val=='직접 입력하기'){
            $('#email2').val(' ');
            $('#email2').attr('readonly',false);//readonly 속성 해제
        }else{
            $('#email2').attr('readonly',true)
            $('#email2').val(val);
        }
    });

    //가입하기 버튼 처리
    $('#joinbtn').on('click',function (){processJoin();});

    function processJoin(){

        if($('#name').val()=='' || $('#jumin1').val()=='' || $('#jumin2').val()==''){
            alert('정산적인 과정으로 회원가입을 진행해주세요!');
        } else if($('#userid').val()==''){
            alert('아이디를 입력해주세요!');
        } else if($('#passwd').val()=='' || $('#repwd').val()==''){
            alert('비밀번호를 입력해주세요!!');
        } else if($('#zipcode').val()==''){
            alert('우편번호 & 주소를 확인해주세요');
        } else if($('#email1').val()=='' || $('#email2').val()==''){
            alert('이메일을 입력해주세요');
        } else if($('#tel1').val()=='' || $('#tel2').val()=='' || $('#tel3').val()==''){
            alert('전화번호를 입력해주세요');
        } else if($('#passwd').val()!=$('#repwd').val()){
            alert('비밀번호가 일치하지않습니다');
        } else if(grecaptcha.getResponse().length==0){
            alert('자동 가입 방지 확인해주세요!!');
        } else {
            $('#g-recaptcha').val(grecaptcha.getResponse());
            $('#email').val($('#email1').val()+'@'+$('#email2').val());
            $('#tel').val($('#tel1').val()+'-'+$('#tel2').val()+'-'+$('#tel3').val());

            $('#joinfrm').attr('method','post');
            $('#joinfrm').submit();
        }

    }

    //메인으로 가기 버튼 처리
    $('#go2index').on('click',function (){
        location.href = '/index';
    });

</script>