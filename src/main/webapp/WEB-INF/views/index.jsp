<%@ page pageEncoding="UTF-8" %>

<script>
    var timer = setInterval(currentTime, 1000);
    function currentTime() {
        var d = new Date();
        var t = "현재시간 : ";
        document.getElementById("currentTime").innerHTML =
            t + d.toLocaleTimeString();
    }

    var myCarousel = document.querySelector('#myCarousel')
    var carousel = new bootstrap.Carousel(myCarousel)
</script>

<p id="currentTime" class="time"></p>
<div id="floatMenu">
    <a href="/member/magree">
        <img src="imgss/그림.jpg">
    </a>
</div>

<main id="container">

    <section id="sec01">
        <h1 class="text-primary"><i class="bi bi-snow"></i> 오늘의 하이라이트</h1>
    <div class="row">
        <div class="col-7">
            <iframe width="650" height="320" src="https://www.youtube.com/embed/-L80JguJ2JY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>

    <div class="col-5">
        <iframe width="450" height="250" src="https://www.youtube.com/embed/FGNnYMADDEs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
    </div>
        <button type="button" class="btn btn-light border" style="margin-left: 500px">
            <a href="/replay/replay" target="_self">
            다른 동영상 보기</a></button>
    </section>

        <section id="sec02">
            <h1 class="text-primary"><i class="bi bi-snow"></i> 오늘의 뉴스</h1>
            <div class="row">
            <div class="col-7">
                <div class="imges">
                <img src="imgss/선수단.png" style="width: 700px">
                    <div class="text">
                        <a href="https://olympics.com/ko/news/team-korea-squad-list-confirmed-for-beijing-2022" target="_self">
                        <p style="font-size: 20px"><strong>베이징 2022 대한민국 선수단 확정</strong></p></a>
                    </div>
                </div>
            </div>
            <div class="col-5">
                <div class="imges">
                    <img src="imgss/선수단2.png" style="width: 500px"><br>
                </div>
                <h6 style="text-align: center; text-decoration: underline">
                    <a href="https://olympics.com/ko/news/introducing-korean-alpine-skiing-team" target="_self">
                        알파인스키: 대한민국 국가대표팀을 소개합니다</a></h6>
            </div>
            </div><br>

            <div class="row">
                <div class="col-4">
                    <div class="imges">
                        <img src="imgss/news1.png" style="width: 350px"><br>
                    </div>
                    <p style="text-align: center; text-decoration: underline">
                        <a href="https://olympics.com/ko/news/top-things-to-know-about-yun-sungbin" target="_self">
                        노력하는 천재, 윤성빈의 세 번째 도전</a></p>
                </div>
                <div class="col-4">
                    <div class="imges">
                        <img src="imgss/news2.png" style="width: 350px"><br>
                    </div>
                    <p style="text-align: center; text-decoration: underline">
                        <a href="https://olympics.com/ko/news/top-things-to-know-about-korean-figure-skater-birthdaygirl-kim-yelim" target="_self">
                            1월 23일: 대한민국 여자 피겨의 희망 김예림의 19번째 생일 </a></p>
                </div>
                <div class="col-4">
                    <div class="imges">
                        <img src="imgss/news3.png" style="width: 350px"><br>
                    </div>
                    <p style="text-align: center; text-decoration: underline">
                        <a href="https://olympics.com/ko/news/how-to-watch-ice-hockey-at-the-olympic-winter-games-beijing-2022" target="_self">
                            베이징 2022 동계올림픽 대회에서 아이스하키를 즐기는 방법 </a></p>
                </div>
            </div>
            <button type="button" class="btn btn-light border" style="margin-left: 500px">
                <a href="/news/news" target="_self">
                더많은 뉴스 보기</a></button>
        </section>

    </main>

</div><!-- main -->
<div class="row">
    <div class="col-2"></div>
    <div class="col-3">
        <img src="imgss/Olympichome.jpg" style="height: 300px; position: relative">
    </div>
    <div class="col-5">
        <p style="font-size: 6em;margin-top: 50px"><strong>올림픽 경기장</strong></p>
    </div>
    <div class="col-2"></div>
</div>
<div class="row">
    <img src="imgss/경기장1.png" style="height: 350px">
</div>
<div class="row">
    <img src="imgss/월드와이드파트너.png">
</div>


