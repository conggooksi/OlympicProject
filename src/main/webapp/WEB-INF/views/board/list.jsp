<%@page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
    // 현재 페이지에 따라 보여줄 페이지 블록을 결정
    // ex) 총 페이지수pages가 27일 때
    // cp = 1 : 1 2 3 4 5 6 7 8 9 10
    // cp = 3 : 1 2 3 4 5 6 7 8 9 10
    // cp = 9 : 1 2 3 4 5 6 7 8 9 10
    // cp = 11 : 11 12 13 14 15 16 17 18 19 20
    // cp = 17 : 11 12 13 14 15 16 17 18 19 20
    // cp = 23 : 21 22 23 24 25 26 27
    // cp = n: ? ?+1 ?+2 ... ?+9
    startpage = ((cpage-1) / 10) * 10 + 1
    endpage = startpage + 9
--%>
<%--
    String spage = request.getParameter("cpage");
    int cp = Integer.parseInt(cpage);
 --%>
<%--현재 페이지 및 페이지블럭(네비게이션) 처리--%>
<fmt:parseNumber var="cp" value="${param.cpage}" />
<fmt:parseNumber var="sp" integerOnly="true" value="${((cp-1) / 10)}" />
<fmt:parseNumber var="sp" value="${sp * 10 + 1}" />
<fmt:parseNumber var="ep" value="${(sp+9)}" />

<%--총 페이지수 처리--%>
<fmt:parseNumber var="tp" integerOnly="true" value="${bdcnt / 25}" />
<c:if test="${bdcnt % 25 gt 0}">
    <fmt:parseNumber var="tp"  value="${tp + 1}" />
</c:if>

<%--
    검색여부에 따른 링크 출력 처리
    일반목록 출력 : /board/list?cpage=
    검색후 목록 출력 : /board/list?ftype=???&fkey=???&cpage=
--%>
<c:set var="navlink" value="/board/list?cpage=" />
<c:if test="${not empty param.fkey}">
    <c:set var="navlink" value="/board/list?ftype=${param.ftype}&fkey=${param.fkey}&cpage=" />
</c:if>

<script>
    var timer = setInterval(currentTime, 1000);
    function currentTime() {
        var d = new Date();
        var t = "현재시간 : ";
        document.getElementById("currentTime").innerHTML =
            t + d.toLocaleTimeString();

    }
</script>

<p id="currentTime" class="time"></p>

    <div class="container">
      <div id="main">
          <div class="mt25">
              <h3><i class="bi bi-chat-text-fill"></i>
                  자유게시판</h3>
          </div>
          <hr>

          <div class="col"></div>
          <div class="col-11 text-right">
              <button type="button" class="btn btn-light" id="newbtn">
              <i class="bi bi-plus-circle-fill"></i>새글쓰기</button>
              </div>
              <div class="col"></div>
      </div><!-- 새글쓰기 버튼 -->

          
          <div class="row">
              <div class="col"></div>
              <div class="col-10">
                  <table class="table table-striped table-hover">
                      <thead style="background: #2597f5">
                          <tr>
                              <th style="width: 7%">번호</th>
                              <th>제목</th>
                              <th style="width: 12%">작성자</th>
                              <th style="width: 10%">작성일</th>
                              <th style="width: 7%">추천</th>
                              <th style="width: 7%">조회</th>
                          </tr>
                      </thead>
                      
                      <tbody>
                          <tr class="text-danger">
                              <th>인기</th>
                              <th><span class="badge-danger">Hot</span>
                                    평창올림픽 한지 엊그제같은데 벌써 올림픽하는거 실화냐?가슴이 웅장해진다 ㅇㅈ하면 추천 ㄱㄱ</th>
                              <th>rorpeter</th>
                              <th>2021.12.31</th>
                              <th>999</th>
                              <th>123</th>
                          </tr>

                          <tr class="text-info">
                              <th>공지</th>
                              <th><span class="badge-info">필독</span>
                                    불법도박하지 않는 청렴한 회원이 되세요</th>
                              <th>관리자</th>
                              <th>2022.01.21</th>
                              <th>486</th>
                              <th>12</th>
                          </tr>

                          <%-- for (BoardVO b : bd) java list부분참고--%>
                          <c:forEach var="b" items="${bd}">
                          <tr>
                              <td>${b.bno}</td>
                              <td><a href="/board/view?bno=${b.bno}">
                                ${b.title}</a></td>
                              <td>${b.userid}</td>
                              <td>${fn:substring(b.regdate,0 ,10 )}</td>
                              <td>${b.thumbs}</td>
                              <td>${b.views}</td>
                          </tr>
                          </c:forEach>

                      </tbody>
                  </table>
              </div>
              <div class="col"></div>
          </div><!--게시판-->

            <div class="row">
                <div class="col-6"></div>
                <div class="col-6 form-group row">
                    <select name="findtype" id="findtype"
                            class="form-control col-3">
                        <option value="title">제 &nbsp; 목</option><!--option value 써야할때= 데이터와 서버가 불일치하면/서버는 영어이기때문 -->
                        <option value="userid">작성자</option>
                        <option value="contents">본 문</option>
                    </select>&nbsp;
                    <input type="text" name="findkey" id="findkey"
                           class="form-control col-5">&nbsp;
                    <button type="button" class="btn btn-light" id="findbtn">
                        <i class="bi bi-search"></i>검색하기</button>
                </div> <!-- 검색하기 버튼 -->


          <div class="table">
              <div class="col-12">
                  <ul class="pagination justify-content-center">
                      <c:if test="${sp ne 1}"><li class="page-item "></c:if>
                      <c:if test="${sp eq 1}"><li class="page-item disabled"></c:if>
                          <a href="${navlink}${sp - 10}" class="page-link">이전</a>
                      </li>

                      <%-- for (int i-0; i <= 10; i++ --%>
                      <c:forEach var="i" begin="${sp}" end="${ep}" step="1" >
                          <%-- <c:if test="${i ne cp}"><li class="page-item "></c:if>
                          <c:if test="${i eq cp}"><li class="page-item active"></c:if> --%>

                          <c:if test="${i le tp}"> <%-- 페이지블럭 출력 조건 --%>

                          <%-- 페이지블럭에 active 표시 여부 결정--%>
                          <li class="page-item <c:if test="${i eq cp}">active</c:if>">

                          <a href="${navlink}${i}" class="page-link cpage">${i}</a>
                      </li>
                      </c:if>
                      </c:forEach>

                      <%-- '다음' 버튼에 disabled 표시 여부 결정--%>
                      <li class="page-item <c:if test="${(sp + 9) ge tp}">disabled</c:if> ">
                          <a href="${navlink}${ep + 1}" class="page-link">다음</a>
                      </li>
                  </ul>
              </div>
          </div> <!--페이지 네비게이션 -->

      </div>
      </div><!-- //main -->

    </div>