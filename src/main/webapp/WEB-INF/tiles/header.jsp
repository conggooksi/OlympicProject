<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="row">

    <div class="col" >
        <a href="http://localhost:8080">
        <img src="/imgss/Olympichome.jpg" id="home">
        </a>
    </div>
    <div class="col-5" id="logo">
        <img src="/imgss/%EA%B4%91%EA%B3%A0.png">
    </div>
    <div class="col-3 text-right">
        <c:if test="${empty sessionScope.uid}">
        <button type="button"
                class="btn"
                data-toggle="modal"
                data-target="#loginmodal"
                style="font-size:20px;">
            <i class="bi bi-play-circle text-danger"></i>
            로그인</button><br>
        <button type="button" class="btn" style="font-size:10px; padding:5px 5px">아이디/비밀번호찾기</button>
        <button type="button"
                class="btn" style="font-size:10px; padding:5px 5px"><i class="bi-person"></i><a href="/member/magree">회원가입</a></button>
        </c:if>

        <c:if test="${not empty sessionScope.uid}">
            <div style="color: blue">${uid}님 방문을 환영합니다&nbsp
            <button type="button" class="btn" id="logoutbtn">
                <i class="bi bi-stop-circle text-danger"></i>
                로그아웃</button></div>
        </c:if>
        <br>
        <br>
        <br>
        <input type="text" name="findkey1" id="findkey1"
               class="border-primary">
        <button type="button" class="btn" id="findtype1">
            <i class="bi-search"></i>검색</button>

    </div>
</header> <!-- header-end -->
<div class="row">
    <img src="/imgss/%EC%9D%B4%EB%AF%B8%EC%A7%80_20220119_001.png"
         style="width: 100%" class="img-fluid">
</div>

<nav class="nav navbar-expand navbar-light bg-light">

    <ul class="navbar-nav nav-fill w-100">
        <div class="col-3"></div>
        <div class="col">
            <li class="nav-item">
                <a class="nav-link" href="/member/magree">회원가입</a>
            </li>
        </div>
        <div class="col">
            <li class="nav-item">
                <a class="nav-link" href="../event">종목</a>
            </li>
        </div>
        <div class="col">
        <li class="nav-item">
            <a class="nav-link" href="/schedule/schedule">일정</a>
        </li>
        </div>
        <div class="col">
        <li class="nav-item">
            <a class="nav-link" href="/news">뉴스</a>
        </li>
        </div>
        <div class="col">
        <li class="nav-item">
            <a class="nav-link" href="../replay">다시보기</a>
        </li>
        </div>
        <div class="col">
        <li class="nav-item">
            <a class="nav-link" href="/board/list?cpage=1">게시판</a>
        </li>
        </div>
        <div class="col-3"></div>
    </ul>

</nav> <!-- nav -->
