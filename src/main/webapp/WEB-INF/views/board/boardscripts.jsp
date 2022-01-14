<%@ page pageEncoding="UTF-8" %>

<script>
    // 리스트 페이지에서 '검색하기' 버튼 클릭시
    $('#findbtn').on('click', function () {
        if ($('#findkey').val() == '') alert('검색어를 입력하세요!');
        else {
            let params = '?ftype=' + $('#findtype').val();
            params = params + '&fkey=' + $('#findkey').val();
            params = params + '&cpage=1';
            location.href = '/board/list' + params;
        }
    });

    // 리스트 페이지에서 '새글쓰기' 버튼 클릭시
    $('#newbtn').on('click', function () {
        location.href = '/board/write';
    });

    // 새글쓰기 페이지에서 '입력완료' 버튼 클릭시
    $('#writebtn').on('click', function () {
        if ($('#title').val() == '') alert('제목을 작성하세요!');
        else if ($('#contents').val() == '') alert ('본문을 작성하세요!');
        else if ($('#userid').val() == '') alert ('로그인하세요!');
        else if (grecaptcha.getResponse().length == 0) alert ('자동가입방지 체크하세요!');
        else {
            $('#boardfrm').attr('method', 'post');
            $('#g-recaptcha').val( grecaptcha.getResponse() );
            $('#boardfrm').submit();
        }
    });
    // 입력완료 클릭 시
    // writeok() -> newBoard() -> insertBoard()
</script>