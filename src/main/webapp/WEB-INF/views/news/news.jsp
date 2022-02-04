<%@ page pageEncoding="UTF-8" %>

    <main id="container">
        <section id="sec01">
            <h1 style="padding: 40px 0px 20px 0px; font-size: 2.5em; font-weight: bold; font-family: HY견고딕">베이징 2022뉴스</h1>
                <h3 style="padding-bottom: 35px;  font-size: 2em;font-weight: bold; font-family: HY견고딕"><i class="bi bi-globe2" style="color: dodgerblue"></i>주요 뉴스</h3>
            <!-- 머릿글-->
        <div class="row"> <!-- 주요 뉴스 row절-->
                        <div class="col-7">
                            <a href="https://olympics.com/ko/news/top-things-to-know-about-yun-sungbin" target="_self">
                                    <div class="imges">
                                        <img src="imgss/n1.jpg">
                                    </div>

                                    <div class="text">
                                            <p style="font-size: 18px"><strong>노력하는 천재, 윤성빈의 세번째 도전</strong></p>
                                    </div>
                            </a>
                        </div>

                        <div class="col-5">
                            <a href="https://olympics.com/ko/news/top-things-to-know-about-korean-figure-skater-birthdaygirl-kim-yelim" target="_self">
                                <div class="imges">
                                    <div style="position: relative">
                                        <img  src="imgss/n2.jpg"><br>
                                    </div>

                                    <div style="position: relative">
                                        <button class="btn btn-primary bt1" type="button"; >피겨스케이팅</button>
                                    </div>
                                </div>
                                    <p style="font-size: 18px"><strong>1월 23일: 대한민국 여자 피겨의 희망 김예림의 19번째 생일</strong></p>
                            </a>
                        </div>
        </div>

                  <!-- 1번째 div_row줄--> <br> <br>

                <div class="row v1">
                    <div class="col-4">
                        <a href="https://olympics.com/ko/news/olympic-cinderellas-from-white-water-rafting-to-alpine-skiing" target="_self">
                            <div class="imges">
                                    <div style="position: relative">
                                        <img src="/imgss/n3.jpg" img-fluid><br>
                                    </div>

                                    <div style="position: relative">
                                        <button class="btn btn-primary bt1" type="button">Sungbin YUN</button>
                                    </div>
                            </div>
                                    <div class="text">
                                            <p style="font-size: 18px"><strong>알파인스키:대한민국 국가대표를 소개합니다</strong></p>
                                    </div>
                        </a>
                    </div>
                <!-- n3 알파인스키 파트 끝-->

                    <div class="col-4">
                        <a href="https://olympics.com/ko/featured-news/youth-olympics-champion-you-young-triple-axel-kim-yuna-bts-2022" target="_self">
                            <div class="imges">
                                   <div style="position: relative">
                                        <img src="/imgss/n4.jpg" img-fluid>
                                   </div>

                                    <div style="position: relative">
                                        <button class="btn btn-primary bt1" type="button">피겨스케이팅</button>
                                    </div>
                            </div>
                                    <div class="text">
                                            <p style="font-size: 16px"><strong>청소년 올림픽 챔피언 유영:&nbsp;트리플악셀,김연아,BTS&nbsp;춤</strong></p>
                                    </div>
                        </a>
                    </div>
                <!-- n4 유영 파트 끝-->

                    <div class="col-4">
                        <a href="https://olympics.com/ko/news/q-and-a-about-korean-nordiccombined-pioneer-park-jeun" target="_self">
                            <div class="imges">
                                  <div style="position: relative">
                                     <img src="/imgss/n5.jpg">
                                  </div>

                                  <div style="position: relative">
                                      <button class="btn btn-primary bt1" type="button">스키점프</button>
                                  </div>
                            </div>
                                  <div class="text">
                                        <p style="font-size: 18px"><strong>Q&A 노르딕 복합: 선구자 박제언을 알고 계세요?</strong></p>
                                  </div>
                        </a>
                    </div>
                </div>
    <!-- n5 박제언 파트끝 -->
    <!-- 2번째 div_row줄-->
        </section>

    <!--sec01 주요뉴스_row절 끝--> <br><br><br><br>

                <div class="row">
                    <div class="col"></div>
                    <div class="col-10"><a href="https://olympics.com/en/original-series/episode/series-trailer-wait-for-it"><img src="/imgss/img_ad.jpg"></a></div>
                    <div class="col"></div>
                </div>
    <!-- 광고 이미지 절 끝 -->  <br><br><br><br>
        <h1 style="font-size: 2em; padding-bottom: 30px; font-weight: bold; font-family: HY견고딕"><i class="bi bi-globe2" style="color: dodgerblue"></i>모든뉴스</h1>
        <section class="sec02">
            <div class="row">
                <div class="col-4" style="padding-bottom: 50px">
                        <select style="font-size:1.3em;" id="nso1" class="form-control col-12">
                            <option value="spo1">종목</option>
                            <option value="spo2">스키점프</option>
                            <option value="spo3">쇼트트랙</option>
                            <option value="spo4">스켈레톤</option>
                            <option value="spo5">컬링</option>
                            <option value="spo5">피겨스케이팅</option>
                        </select>
                </div>
    <!-- 종목 select절 끝-->
                <div class="col-4">
                        <select style="font-size:1.3em;" id="nso2" class="form-control col-12">
                            <option value="spot1">팀</option>
                            <option value="spot2">대한민국</option>
                            <option value="spot3">노르웨이</option>
                            <option value="spot4">스웨덴</option>
                            <option value="spot5">덴마크</option>
                            <option value="spot6">스위스</option>
                        </select>
                </div>
    <!-- 팀 select절 끝-->
                <div class="col-4"></div>

            </div>

            <div class="row">
                <div class="col-4" style="padding-bottom: 40px">
                    <a href="https://olympics.com/ko/news/what-is-figure-skating-team-event-olympics-beijng-2022" target="_self">
                        <div class="imges">
                            <div style="position: relative">
                                <img src="/imgss/n6.jpg">
                            </div>

                            <div style="position: relative">
                                <button class="btn btn-primary bt1" type="button">피겨스케이팅</button>
                            </div>
                        </div>
                        <div class="text">
                            <p style="font-size: 18px"><strong>피겨스케이팅 단체전은 어떤 종목인가요?</strong></p>
                        </div>
                    </a>
                </div>

                <div class="col-4">
                    <a href="https://olympics.com/ko/news/where-to-watch-the-winter-olympics-in-korea" target="_self">
                        <div class="imges">
                            <div style="position: relative">
                                <img src="/imgss/n7.jpg">
                            </div>

                            <div style="position: relative">
                                <button class="btn btn-primary bt1" type="button">쇼트트랙</button>
                            </div>
                        </div>
                        <div class="text">
                            <p style="font-size: 18px"><strong>대한민국 내 동계 올림픽 중계 방송 안내</strong></p>
                        </div>
                    </a>
                </div>

                <div class="col-4">
                    <a href="https://olympics.com/ko/news/everything-you-need-to-know-curling-mixed-doubles-event-in-beijing-2022" target="_self">
                        <div class="imges">
                            <div style="position: relative">
                                <img src="/imgss/n8.jpg">
                            </div>

                            <div style="position: relative">
                                <button class="btn btn-primary bt1" type="button">컬링</button>
                            </div>
                        </div>
                        <div class="text">
                            <p style="font-size: 18px"><strong>베이징 2022 컬링 믹스더블에 대해 여러분이 알아야할 모든 것</strong></p>
                        </div>
                    </a>
                </div>
            </div>
    <!-- 모든뉴스 1행 3개 끝-->

            <div class="row">
                <div class="col-4">
                    <a href="https://olympics.com/ko/news/how-to-watch-curling-at-the-olympic-winter-games-beijing-2022" target="_self">
                        <div class="imges">
                            <div style="position: relative">
                                <img src="/imgss/n9.jpg">
                            </div>

                            <div style="position: relative">
                                <button class="btn btn-primary bt1" type="button">컬링</button>
                            </div>
                        </div>
                        <div class="text">
                            <p style="font-size: 18px"><strong>베이징 2022 동계올림픽 대회에서 컬링을 즐기는 방법</strong></p>
                        </div>
                    </a>
                </div>

                <div class="col-4">
                    <a href="https://olympics.com/ko/news/watch-speed-skating-olympic-winter-games" target="_self">
                        <div class="imges">
                            <div style="position: relative">
                                <img src="/imgss/n10.jpg">
                            </div>

                            <div style="position: relative">
                                <button class="btn btn-primary bt1" type="button">스피드스케이팅</button>
                            </div>
                        </div>
                        <div class="text">
                            <p style="font-size: 18px"><strong>베이징 2022 동계올림픽 대회에서 스피드스케이팅을 즐기는 방법</strong></p>
                        </div>
                    </a>
                </div>

                <div class="col-4">
                    <a href="https://olympics.com/ko/news/how-to-watch-ice-hockey-at-the-olympic-winter-games-beijing-2022" target="_self">
                        <div class="imges">
                            <div style="position: relative">
                                <img src="/imgss/n11.jpg">
                            </div>

                            <div style="position: relative">
                                <button class="btn btn-primary bt1" type="button">아이스하키</button>
                            </div>
                        </div>
                        <div class="text">
                            <p style="font-size: 18px"><strong>베이징 2022 동계올림픽 대회에서 아이스하키를 즐기는 방법</strong></p>
                        </div>
                    </a>
                </div>
            </div>
    <!-- 모든뉴스 2행 3개 끝-->
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8"><a href="https://olympics.com/en/original-series/on-edge/"><img src="/imgss/img_ad3.jpg" style="padding: 30px 0px 50px 0px"></a></div>
                <div class="col-2"></div>
            </div>
    <!-- 광고 이미지 절 2번째 끝-->

            <div class="row">
                <div class="col-4">
                    <a href="https://https://olympics.com/ko/news/how-to-watch-nordic-combined-at-the-olympic-winter-games-beijing-2022" target="_self">
                        <div class="imges">
                            <div style="position: relative">
                                <img src="/imgss/n12.jpg">
                            </div>

                            <div style="position: relative">
                                <button class="btn btn-primary bt1" type="button">노르딕 복합</button>
                            </div>
                        </div>
                        <div class="text">
                            <p style="font-size: 18px"><strong>베이징 2022 동계올림픽 대회에서 노르딕 복합 경기를 즐기는 방법</strong></p>
                        </div>
                    </a>
                </div>

                <div class="col-4">
                    <a href="https://olympics.com/ko/news/watch-alpine-skiing-winter-olympic-games-beijing" target="_self">
                        <div class="imges">
                            <div style="position: relative">
                                <img src="/imgss/n13.jpg">
                            </div>

                            <div style="position: relative">
                                <button class="btn btn-primary bt1" type="button">미카엘라 시프린</button>
                            </div>
                        </div>
                        <div class="text">
                            <p style="font-size: 18px"><strong>베이징 2022 동계올림픽 대회에서 알파인 스키를 즐기는 방법</strong></p>
                        </div>
                    </a>
                </div>

                <div class="col-4">
                    <a href="https://olympics.com/ko/news/how-to-watch-biathlon-at-the-olympic-winter-games-beijing-2022" target="_self">
                        <div class="imges">
                            <div style="position: relative">
                                <img src="/imgss/n14.jpg">
                            </div>

                            <div style="position: relative">
                                <button class="btn btn-primary bt1" type="button">바이애슬론</button>
                            </div>
                        </div>
                        <div class="text">
                            <p style="font-size: 18px"><strong>베이징 2022 동계올림픽 대회에서 바이애슬론을 즐기는 방법</strong></p>
                        </div>
                    </a>
                </div>
            </div>
    <!-- 모든뉴스 2행 3개 끝-->
            <div style="text-align: center; padding: 40px 0px 60px 0px">
                    <button class="btn btn-primary" type="button" style="font-size: 20px; padding: 20px 40px">뉴스 더 보기</button>
            </div>
        </section>
    <!-- section02 종료 -->
    </main> <!-- main종료 -->