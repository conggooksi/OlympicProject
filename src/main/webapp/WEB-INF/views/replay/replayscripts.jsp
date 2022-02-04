<%@ page pageEncoding="UTF-8" %>

<script>

    // 종목별 검색
    $('#event').on('change', function() {

        let params = '?event=' + $('#event option:selected').val();

        if ($('#event option:selected').val() == "") location.href = '/replay';

        else { location.href = '/replay' + params; }
    });

    // 나라별 검색
    $('#country').on('change', function() {

        let params = '?country=' + $('#country option:selected').val();

        if ($('#country option:selected').val() == "") location.href = '/replay';

        else { location.href = '/replay' + params; }
    });




    // 더보기 영상출력을 위한 형식 변환
    function makemovs(fname,event, title) {
        let makemovstr = '<li style="margin-right: 40px">';
        makemovstr += '<a href="">';
        makemovstr += '<div class="replayli" style="position: relative">';
        makemovstr += '<img src="'+fname+'" style="width: 330px; height:230px ;margin-left: -38px"></div>';
        makemovstr += '<div style="position: absolute; margin: -40px 0 0 -35px">';
        makemovstr += '<button type="button" class="btn btn-primary" style="font-size: 15px">'+event+'</button></div>';
        makemovstr +='<div style="position: absolute; margin: -40px 0 0 153px">';
        makemovstr +='<button type="button" class="btn btn-primary">';
        makemovstr +='<i class="bi bi-play-fill"></i></button></div>';
        makemovstr +='<div style="position: absolute; margin: -40px 0 0 195px">';
        makemovstr +='<button type="button" style="width: 95px; height: 40px; font-size: 20px" class="btn btn-dark">2:30</button></div>';
        makemovstr +='</a>';
        makemovstr +='<a href="">';
        makemovstr +='<p style="width:330px; font-size:25px; margin-left: -35px">'+title+'</p>';
        makemovstr +='</a>';
        makemovstr +='</li>';
        return makemovstr;
    }


    // 더보기 영상 출력 처리
    $('#morebtn').on('click', function () {

        //alert(document.getElementById('rno').value);

        $.ajax({
            url: '/replay/morePlay',
            type: 'GET',
            data : { 'rno': $('#rno').val()}

        })
            .done(function (data) {
                let d = JSON.stringify(data);
                let test = JSON.parse(d);
                let movediv = '';

                for(var i=0; i<makemovs.length; i++) {
                    console.log(test[i]);
                    movediv += makemovs(test[i].fname, test[i].event, test[i].title);
                }

                document.getElementById('playmovsul').innerHTML += movediv;
                $('#rno').val( parseInt($('#rno').val()) + 1);

            })
            .fail(function (xhr, status, error) {
                alert(xhr.status + "/" + error);

            });
    });

</script>
