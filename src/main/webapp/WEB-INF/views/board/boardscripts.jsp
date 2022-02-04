<%@page pageEncoding="utf-8" %>

<script>
    //리스트 페이지에서 '검색하기' 버튼 클릭시
    $('#findbtn').on('click',function(){
        if($('#findkey').val()=='') alert('검색어를 입력하세요!');
        else {
            let params = '?ftype=' + $('#findtype').val();
            params = params + '&fkey=' + $('#findkey').val();
            params = params + '&cpage=1';
            location.href = '/board/list' + params;
        }
    });

    //리스트 페이지에서 '새글쓰기' 버튼 클릭시
    $('#newbtn').on('click',function() {
       location.href='/board/write';
    });

    //글쓰기 페이지에서 '목록으로' 버튼 클릭시
    $('#listbtn').on('click', function() {
        location.href='/board/list';
    });

    //새글쓰기 페이지에서 '입력완료' 버튼 클릭시
    $('#writebtn').on('click',function() {
        if ($('#title').val() == '') alert('제목을 작성하세요!');
        else if ($('#contents').val() == '') alert('본문을 작성하세요!');
        else if ($('#userid').val() == '') alert('로그인하세요!');
        else if (grecaptcha.getResponse().length == 0) alert('자동가입방지 체크하세요!');
        else {
                $('#boardfrm').attr('method', 'post');
                $('#g-recaptcha').val(grecaptcha.getResponse() );
                $('#boardfrm').submit();
        }
    });

    //입력완료 클릭시
    //BoardController -> newboard() -> insertBoard()

    //댓글쓰기 버튼 처리
     $('#cmtbtn').on('click', function (){
         if($('#userid').val() == '' || $('#bno').val() == '') alert('로그인 하세요!');
         else if($('#reply').val() == '')
             alert('댓글을 작성하세요!');
         else{
            $('#cmtfrm').attr('method','post');
            $('#cmtfrm').attr('action','/board/replyok');
            $('#cmtfrm').submit();
        }
    });

     // 대댓글 창 띄우기
    function addReply(cno){
        $('#cno').val(cno); // 숨김필드에 댓글 번호 대입
        $('#replyModal').modal('show'); //대댓글 대화상자 띄움

    }

    // 대댓글쓰기 버튼 처리 -> replyok
    $('#rpbtn').on('click',function (){
        if($('#userid').val() == '' || $('#bno').val() == '') alert('로그인 하세요!');
        else if($('#rereply').val() == '')
            alert('댓글을 작성하세요!');
        else{
            $('#rpfrm').attr('method','post');
            $('#rpfrm').attr('action','/board/replyok');
            $('#rpfrm').submit();
        }
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

    //뷰 페이지에서 '수정하기' 버튼 클릭시
        $('#udbtn').on('click', function() {
            location.href='/board/udwrite?bno='+"${bvo.bno}";
    });


    //수정하기 페이지에서 '입력완료' 버튼 클릭시
    $('#udwritebtn').on('click',function() {
        if ($('#title').val() == '') alert('제목을 작성하세요!');
        else if ($('#contents').val() == '') alert('본문을 작성하세요!');
        else if (grecaptcha.getResponse().length == 0) alert('자동가입방지 체크하세요!');
        else {
            $('#udboardfrm').attr('method', 'post');
            $('#g-recaptcha').val(grecaptcha.getResponse() );
            $('#udboardfrm').submit()
            alert('수정에 성공하였습니다!');
        }
    });

    //'삭제하기' 버튼 클릭시
    $('#deletebtn').on('click',function() {
        if($('#userid').val() == '' || $('#bno').val() == '') alert('로그인 하세요!');
        else {
            $('#deletefrm').attr('method', 'post');
            $('#deletefrm').attr('action', '/board/deleteboardok');
            $('#deletefrm').submit();
        }
    });

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



</script>
