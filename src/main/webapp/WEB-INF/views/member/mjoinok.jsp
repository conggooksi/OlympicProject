<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

    <!--Bootstrap Icons-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    
    <title>tproject</title>
    <style>
        #home { width: 200px;
                height: 150px;
                margin: auto}
        #logo { margin-left: 10px}
        
        .m1030{margin:10px 30px 10px 50px;}
        .mt25 {margin-top: 25px}
        
    </style>
</head>
<body>
        <header class="row border">
            <div class="col" id="logo">
                <img src="/tproject/imgss/Olympichome.jpg" id="home">
            </div>
            <div class="col-7">
                <h1 style="margin-top: 50px">Welcome</h1>
            </div>
        </header> <!-- header-end -->
       <div class="row">
           <img src="/tproject/imgss/%EC%9D%B4%EB%AF%B8%EC%A7%80_20220119_001.png"
           style="width: 100%" class="img-fluid">
       </div>
       
       
        <main class="container">
           <div class="mt25">
               <h3>회원가입 완료</h3>
               <small>안전하고 편리한 홈페이지 이용을 위해 회원님의 아이디와
                비밀번호 관리에 주의해 주시기 바랍니다.</small>
           </div>
           <div class="jumbotron bg-warning m1030">
            <h1 class="display-3">회원가입을 축하합니다!!</h1>
            <p class="lead">게시판 글작성, 쇼핑몰 이용등의 일부 서비스는
                실명확인 후 이용하실 수 있습니다.<br>
                실명확인 후에도 가입하신 아이디는 변경할 수 없습니다.</p>
            <hr class="my-4">
            <p>회원가입 이후 아이디와 비밀번호로 일반회원으로
                로그인하셔서 추가 인적사항등을 등록해주시기 바랍니다.</p>
            <p>Lorem Ipsom과 함께 즐거운 시간 되십시오</p>
        </div><!-- 알림판 -->

        <div class="text-center" style="margin: 100px 0;">
            <button type="button" id="go2index"
                    class="btn btn-primary">
                <i class="bi bi-info-circle"></i>
                메인으로 이동</button>
        </div><!-- 버튼 -->
        </main> <!-- //main-end -->
       
       <footer class="row">
           <img src="/tproject/imgss/%EC%9D%B4%EB%AF%B8%EC%A7%80_20220119_002.png"
           style="width: 100%" class="img-fluid">
       </footer><!-- footer -->
       
    <!-- 로그인 모달 -->
    <div id="loginmodal" role="dialog" class="modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">로그인</h3>
                    <button class="btn btn-light"
                     type="button" data-dismiss="modal">닫기</button>
                </div> 
                <!-- modal header-end -->
                
                <div class="modal-body">
                    <form id="loginfrm" name="loginfrm">
                        <div class="form-group row text-danger">
                            <label form="userid" 
                            class="col-form-label col-4 text-right">
                            아이디</label>
                            <input type="text" name="userid"
                            id="userid" 
                            class="form-control col-6 border-danger">
                        </div>
                        
                        <div class="form-group row text-danger">
                            <label form="userpw" 
                            class="col-form-label col-4 text-right">
                            비밀번호</label>
                            <input type="password" name="userpw"
                            id="userpw" 
                            class="form-control col-6 border-danger">
                        </div>
                        
                        <div class="form-group row">
                            <div class="col-4"></div>
                            <div class="form-check">
                                <input type="checkbox" name="autolgn"
                                class="form-check-input">
                                <label class="form-check-label text-warning">
                                    로그인 상태 유지
                                </label>
                            </div>
                        </div>
                    </form>
                </div> <!-- modal body-end -->
                
                <div class="modal-footer justify-content-center">
                    <button class="btn btn-danger"
                     type="button" id="loginbtn">로그인</button>
                    <button class="btn btn-warning text-write"
                     type="button" id="findipbtn">아이디/비밀번호 찾기</button>
                </div> <!-- modal footer-end -->
            </div>
        </div>
    </div>
              
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>    
</body>
</html>