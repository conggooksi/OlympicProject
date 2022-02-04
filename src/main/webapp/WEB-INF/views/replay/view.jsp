<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id="main">

    <div class="row" style="background-color: rgb(0,87,168); color: white;">
        <div class="col-9">
            <div class="embed-responsive embed-responsive-16by9" style="margin-top: 50px">
                <video src="${rvo.mname}" autoplay controls></video>
            </div>
            <h3>${rvo.title}</h3>
            <p>${rvo.contents}</p>
        </div>
        <div class="col-3">
            <ul style="margin-top: 50px; overflow:auto; height:400px;">
                <li>
                    <span>재생목록</span>
                    <hr>
                </li>
                <c:forEach var="r" items="${rvoall}">
                <li>
                    <a href="/replay/view?rno=${r.rno}">
                        <img src="${r.fname}">
                    </a>
                    <p>
                        ${r.title}
                    </p>
                    <hr>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="row">
        <div class="col"></div>
        <div class="col-3" style="margin-top: 50px">
            <h2><i class="bi bi-snow3" style="color: blue"></i><b> 관련 콘텐츠</b></h2>
        </div>
        <div class="col-8"></div>
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col"></div>
        <div class="col-10">
            <ul>
            <c:forEach var="r" items="${rvoall}" >
                <li class="movlist" style="margin-right: 50px; float: left">
                    <div class="movcontent" style="margin-left: -35px">
                        <a href="/replay/view?rno=${r.rno}">
                            <div class="replayli" style="position: relative"><img src="${r.fname}" style="width: 380px; height: 214px"></div>
                        </a>
                        <a href="">
                            <p style="width:380px; font-size:20px; color: black">${r.title}</p>
                        </a>
                    </div>
                </li>
            </c:forEach>
            </ul>
        </div>
        <div class="col"></div>
    </div>

</div><%-- main--%>
