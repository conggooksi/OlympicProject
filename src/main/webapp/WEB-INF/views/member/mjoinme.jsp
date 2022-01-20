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
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script>
    function openDaumPostcode(){

       new daum.Postcode({
          oncomplete:function(data){
             document.getElementById('zipcode').value=data.zonecode;
             document.getElementById('addr').value=data.address;
           }
       }).open();
    }//openDaumPostcode()---
    </script>
    
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
        <h3>회원정보 입력</h3>
               <small class="text-muted">회원정보는 개인정보 취급방침에 따라 안전하게 보호되며 회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.</small>
               <hr>
           </div>
           
           <div class="card card-body bg-light m1030">
              <h4>일반회원</h4>
               <form>
                <div class="row mt35">
                    <div class="col"></div>
                    <div class="col-11">
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-primary" for="name">이름</label>
                            <input type="text" class="form-control col-2 border-primary"
                            name="name" id="name" disabled>
                        </div> <!--이름-->
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-primary" for="jumin1">주민번호</label>
                            <input type="text" id="jumin1" name="jumin1" class="form-control col-2 border-primary" disabled>&nbsp;
                            <span class="col-form-label border-primary">&ndash;
                            </span>&nbsp;
                            <input type="text" id="jumin2" name="jumin2" 
                            class="form-control col-2 border-primary" disabled>
                        </div> <!--주민번호-->
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-primary" for="userid">아이디</label>
                            <input type="text" class="form-control col-2 border-primary"
                            name="userid" id="userid">&nbsp;
                            <span class="col-form-label">&nbsp;6~16자의 영문 소문자, 숫자와 특수기호() 만 사용할수 있습니다</span>
                        </div><!--아이디-->
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-primary" for="passwd">비밀번호</label>
                            <input type="password" class="form-control col-2 border-primary"
                            name="passwd" id="passwd">&nbsp;
                            <span class="col-form-label">&nbsp;6~16 자의 영문 대소문자, 숫자 및 특수 문자 사용 할수 있습니다</span>
                        </div><!--비밀번호-->
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-primary" for="repwd">비밀번호확인</label>
                            <input type="password" class="form-control col-2 border-primary"
                            name="repwd" id="repwd">&nbsp;
                            <span class="col-form-label">&nbsp;이전 항목에서 입력했던 비밀번호를 한번더 입력하세요</span>
                        </div><!--비밀번호확인-->
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-primary" for="zip1">우편번호</label>
                            <input type="text" name="zipcode" id="zipcode" size="5">
                            <button type="button"
                                 toggle="modal"
                                data-target="#zipmodal"
                                class="btn btn-primary" onClick="openDaumPostcode()">
                            <i class="bi bi-question-circle"></i>우편번호 찾기</button>
                        </div><!--우편번호-->
                        
                       
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-primary" for="addr1">주소</label>
                            <input type="text" class="form-control col-4 border-primary"
                            name="addr1" id="addr1">&nbsp;&nbsp;&nbsp;
                            <input type="text" class="form-control col-4
                            border-primary"
                            name="addr2" id="addr2">
                        </div><!--주소-->
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-primary" for="email1">전자우편 주소</label>
                            <input type="text" class="form-control col-3 border-primary"
                            name="email1" id="email1">
                            <div class="input-group-append">
                                <span class="input-group-text border-primary">@</span>
                            </div>
                            <input type="text" class="form-control col-3
                            border-primary"
                            name="email2" id="email2" disabled>&nbsp;&nbsp;&nbsp;
                            <select class="form-control col-2 border-primary" id="email3">
                                <option>선택하세요</option>
                                <option>naver.com</option>
                                <option>google.com</option>
                                <option>daum.net</option>
                                <option>직접 입력하기</option>
                            </select>
                        </div><!--전자우편 주소-->
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-primary" for="tel1">개인 연락처</label>
                            <select id="tel1" name="tel1"
                                class="form-control col-1 border-primary">
                                    <option>국번</option>
                                    <option>010</option>
                                    <option>011</option>
                                    <option>019</option>
                                </select>
                            <span class="col-form-label border-primary">&nbsp;&ndash;&nbsp;
                            </span>
                            <input type="text" class="form-control col-4 border-primary"
                            name="tel2" id="tel2">&nbsp;&nbsp;&nbsp;
                            <span class="col-form-label border-primary">&nbsp;&ndash;&nbsp;
                            </span>
                            <input type="text" class="form-control col-4
                            border-primary"
                            name="tel3" id="tel3">
                        </div><!--개인 연락처-->
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-primary" for="captcha">자동 가입방지</label>
                            <img src="../imgs/bot.gif" width="45%" height="50%" class="mm5">
                            <input type="text" class="form-control col-4 border-primary"
                            name="captcha" id="captcha" style="margin-left: 170px">
                        </div><!--자동 가입방지-->
                        
                            <div class="row justify-content-center"
                             style="margin-top: 55px;">
                            <button type="button" class="btn btn-primary">
                                <i class="bi bi-check"></i>입력하기
                            </button>&nbsp;
                            <button type="button" class="btn btn-danger">
                                <i class="bi bi-x"></i>취소하기
                            </button>
                            </div><!-- 버튼들 -->
                        
                    </div>
                    
                </div> <!-- 회원정보 입력 -->
               </form>  
           </div>
        
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