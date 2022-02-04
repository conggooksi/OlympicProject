<%@ page pageEncoding="UTF-8"%>

<style>
    *{margin:0;
        padding:0px;
        list-style:none;
    }
    #home { width: 200px; height: 150px; margin: auto}
    #logo { margin-left: 10px}
    #container { margin-top: 20px}
    img{width: 100%}

    <%-- 플로팅 베너 --%>
    #floatMenu {
        position: absolute;
        width: 200px;
        height: 210px;
        left: 30px;
        top: 450px;
    }

    .time {background: black; text-align: center;
        color:#ffffff}

    <%-- 마우스 오버효과 --%>
    .imges {
        box-sizing: border-box;
        font-family: Consolas, monospace;
        margin: 0px auto;
        overflow: hidden;
        position:relative;
    }
    .imges .text {
        position:absolute;
        top:350px;
        left:30px;
        text-decoration: underline;
    }
    .imges img {
        transition: all 0.2s linear;
    }
    .imges:hover img {
        transform: scale(1.4);
    }

</style>
