<%@ page pageEncoding="UTF-8" %>

<script>
    // 리스트 페이지에서 '검색하기' 버튼 클릭시
    $('#findbtn').on('click', function () {
        if ($('#findkey').val() == '') alert('검색어를 입력하세요!');
        else {
            let params = '?ftype=' + $('#findtype').val();
            params = params + '&fkey=' + $('#findkey').val();
            params = params + '&cpage=1';
            location.href = '/pds/list' + params;
        }
    });

    // 리스트 페이지에서 '새글쓰기' 버튼 클릭시
    $('#newbtn').on('click', function () {
        location.href = '/pds/write';
    });

    // 새글쓰기 페이지에서 '입력완료' 버튼 클릭시
    $('#writebtn').on('click', function () {
        if ($('#title').val() == '') alert('제목을 작성하세요!');
        else if ($('#contents').val() == '') alert ('본문을 작성하세요!');
        else if ($('#userid').val() == '') alert ('로그인하세요!');
        //else if (grecaptcha.getResponse().length == 0) alert ('자동가입방지 체크하세요!');
        else if ($('#file1').val() == '') alert('첨부파일을 작성하세요!');
        else {
            $('#pdsfrm').attr('method', 'post');
            $('#pdsfrm').attr('enctype', 'multipart/form-data');
            //$('#g-recaptcha').val( grecaptcha.getResponse() );
            $('#pdsfrm').submit();
        }
    });
    // 입력완료 클릭 시
    // writeok() -> newPds() -> insertPds()

    // 댓글쓰기 버튼 처리
    $('#cmtbtn').on('click', function () {
        if ($('#userid').val() == '' || $('#pno').val() == '') alert('로그인 하세요!');
        else if ($('#reply').val() == '') alert('댓글을 작성하세요!');
        else {
            $('#cmtfrm').attr('method', 'post');
            $('#cmtfrm').attr('action', '/pds/replyok');
            $('#cmtfrm').submit();
        }
    });

    // 대댓글창 띄우기
    function addReply(cno) {
        $('#cno').val(cno);  // 숨김필드에 댓글번호 대입
        $('#replyModal').modal('show'); // 대댓글 대화상자 띄움
    }

    // 대댓글쓰기 버튼 처리 -> replyok
    $('#rpbtn').on('click', function () {
        if ($('#userid').val() == '' || $('#pno').val() == '') alert('로그인 하세요!');
        else if ($('#rereply').val() == '') alert('대댓글을 작성하세요!');
        else {
            $('#rpfrm').attr('method', 'post');
            $('#rpfrm').attr('action', '/pds/replyok');
            $('#rpfrm').submit();
        }
    });
</script>