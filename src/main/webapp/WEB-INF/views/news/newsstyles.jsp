<%@page pageEncoding="UTF-8" %>

<style>
    *{margin:0;
        padding:0px;
        list-style:none}
    #home { width: 200px; height: 150px; margin: auto}
    #logo { margin-left: 10px}
    #main { margin-top: 20px}
    img{width: 100%}

    .imges {
        box-sizing: border-box;
        font-family: Consolas, monospace;
        margin: 0px auto;
        overflow: hidden;
        position:relative;
        width: 100%;
    }

    .imges .text {
        position:absolute;
        text-decoration: underline;
        width: 100%;
    }
    .imges img {
        transition: all 0.2s linear;
    }
    .imges:hover img {
        transform: scale(1.2);
    }

    button.bt1 {
        position:absolute;
        left: 0px;
        bottom: 0px;
        padding: 4px 7px 4px 7px;
        border:0;
        border-radius: 0px 10px 0px 0px;
        background-color: darkblue;
    }

    .v1 img{height: 260px;}

    p {color: rgba(0, 0, 0, 0.74);}

    .npimg {width: 100%}

</style>
