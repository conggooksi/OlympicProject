<%@ page pageEncoding="UTF-8" %>

<script>
    // 종목 및 나라별 검색
    $('#event').on('click', function() {
        let params = '?event=' + $('#event').val();
        params = params + '&country=' + $('#country').val();
        location.href = '/replayBoard' + params;
    });

</script>
