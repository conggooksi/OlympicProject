<%@page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id="main">

    <div class="row">
        <div class="col"></div>
        <div class="col-3" style="margin-top: 50px">
            <h2 style="font-size: 2vw;font-weight: bolder; white-space: nowrap"><i class="bi bi-snow3" style="color: blue"></i><b> ${evo.eventkor}이란?</b></h2>
        </div>
        <div class="col-8"></div>
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col">
            <img src="${evo.exp_img}">
        </div>
    </div>
    <div class="row">
        <div class="col"></div>
        <div class="col-10">${evo.exp}</div>
        <div class="col"></div>
    </div>

    <div class="row">
        <div class="col"></div>
        <div class="col-3" style="margin-top: 50px">
            <h2 style="font-size: 2vw;font-weight: bolder; white-space: nowrap"><i class="bi bi-snow3" style="color: blue"></i><b> 베이징 2022 올림픽 ${evo.eventkor} 최고의 선수</b></h2>
        </div>
        <div class="col-8"></div>
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col">
            <img src="${evo.best_img}">
        </div>
    </div>
    <div class="row">
        <div class="col"></div>
        <div class="col-10">${evo.best}</div>
        <div class="col"></div>
    </div>

    <div class="row">
        <div class="col"></div>
        <div class="col-3" style="margin-top: 50px">
            <h2 style="font-size: 2vw;font-weight: bolder; white-space: nowrap"><i class="bi bi-snow3" style="color: blue"></i><b> 베이징 2022 올림픽 ${evo.eventkor} 일정</b></h2>
        </div>
        <div class="col-8"></div>
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col"></div>
        <div class="col-10">${evo.schedule}</div>
        <div class="col"></div>
    </div>

    <div class="row">
        <div class="col"></div>
        <div class="col-3" style="margin-top: 50px">
            <h2 style="font-size: 2vw;font-weight: bolder; white-space: nowrap"><i class="bi bi-snow3" style="color: blue"></i><b> 베이징 2022 올림픽 ${evo.eventkor} 경기장소</b></h2>
        </div>
        <div class="col-8"></div>
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col"></div>
        <div class="col-10">${evo.place}</div>
        <div class="col"></div>
    </div>

    <div class="row">
        <div class="col"></div>
        <div class="col-3" style="margin-top: 50px">
            <h2 style="font-size: 2vw;font-weight: bolder; white-space: nowrap"><i class="bi bi-snow3" style="color: blue"></i><b> 베이징 2022 올림픽 ${evo.eventkor} 경기방식</b></h2>
        </div>
        <div class="col-8"></div>
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col"></div>
        <div class="col-10">${evo.play}</div>
        <div class="col"></div>
    </div>

    <div class="row">
        <div class="col"></div>
        <div class="col-3" style="margin-top: 50px">
            <h2 style="font-size: 2vw;font-weight: bolder; white-space: nowrap"><i class="bi bi-snow3" style="color: blue"></i><b> 올림픽 ${evo.eventkor} 역사</b></h2>
        </div>
        <div class="col-8"></div>
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col"></div>
        <div class="col-10">${evo.history}</div>
        <div class="col"></div>
    </div>

</div> <%-- main --%>
