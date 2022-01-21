<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <script src="https://www.google.com/recaptcha/api.js" async defer></script>

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

<main class="container">
    <div class="mt25">
        <h2><i class="bi bi-person"></i>회원가입</h2><hr>
    </div>

    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item">
                       <span class="badge badge-success"
                             style="padding: 8px">이용약관</span>
            </li>
            <li class="breadcrumb-item">
                       <span class="badge badge-success"
                             style="padding: 8px">실명확인</span>
            </li>
            <li class="breadcrumb-item">
                       <span class="badge badge-success"
                             style="padding: 8px">정보입력</span>
            </li>
            <li class="breadcrumb-item">
                       <span class="badge badge-light"
                             style="padding: 8px">가입완료</span>
            </li>

        </ul>
    </nav>
    <!-- 회원가입 진행단계표시 -->

    <div class="mt25">
        <h3>회원정보 입력</h3>
        <small class="text-muted">회원정보는 개인정보 취급방침에 따라 안전하게 보호되며 회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.</small>
        <hr>
    </div>

    <div class="card card-body bg-light m1030">
        <h4>일반회원</h4>
        <form id="joinfrm">
            <div class="row mt35">
                <div class="col"></div>
                <div class="col-11">
                    <div class="form-group row">
                        <label class="col-form-label text-right col-2 text-primary" for="name">이름</label>
                        <input type="text" class="form-control col-2 border-primary"
                               name="name" id="name" value="${param.nm}" placeholder="이름 입력" readonly>
                    </div> <!--이름-->

                    <div class="form-group row">
                        <label class="col-form-label text-right col-2 text-primary" for="jumin1">주민번호</label>
                        <input type="text" id="jumin1" name="jumin1"
                               class="form-control col-3 border-primary" value="${param.jm1}" placeholder="주민번호 앞자리 숫자입력" readonly>&nbsp;
                        <span class="col-form-label border-primary">&ndash;
                            </span>&nbsp;
                        <input type="text" id="jumin2" name="jumin2"
                               class="form-control col-3 border-primary" value="${param.jm2}" placeholder="주민번호 뒤자리 숫자입력" readonly>
                    </div> <!--주민번호-->

                    <div class="form-group row">
                        <label class="col-form-label text-right col-2 text-primary" for="userid">아이디</label>
                        <input type="text" class="form-control col-2 border-primary"
                               name="userid" id="userid" value="${mvo.userid}" placeholder="아이디 입력"><br>
                        <span id="uidmsg" class="col-form-label">*6~16자의 영문 소문자, 숫자및 특수문자 사용할수있습니다</span>
                    </div><!--아이디-->

                    <div class="form-group row">
                        <label class="col-form-label text-right col-2 text-primary" for="passwd">비밀번호</label>
                        <input type="password" class="form-control col-2 border-primary"
                               name="passwd" id="passwd" placeholder="비밀번호 입력"><br>
                        <span class="col-form-label">*6~16 자의 영문 대소문자, 숫자 및 특수문자 사용할수있습니다</span>
                    </div><!--비밀번호-->

                    <div class="form-group row">
                        <label class="col-form-label text-right col-2 text-primary" for="repwd">비밀번호확인</label>
                        <input type="password" class="form-control col-2 border-primary"
                               name="repwd" id="repwd" placeholder="비밀번호 확인 입력"><br>
                        <span id="pwdmsg" class="col-form-label">&nbsp;비밀번호를 한번더 입력해주세요</span>
                    </div><!--비밀번호확인-->

                    <div class="form-group row">
                        <label class="col-form-label text-right col-2 text-primary" for="zipcode">우편번호</label>
                        <input type="text" name="zipcode" id="zipcode" value="${mvo.zipcode}" size="7">
                        <button type="button"
                                toggle="modal"
                                data-target="#zipmodal"
                                class="btn btn-primary" onClick="openDaumPostcode()">
                            <i class="bi bi-question-circle"></i>우편번호 찾기</button>
                    </div><!--우편번호-->

                    <div class="form-group row">
                        <label class="col-form-label text-right col-2 text-primary" for="addr">주소</label>
                        <input type="text" class="form-control col-4 border-primary"
                               name="addr" id="addr" value="${mvo.addr}" placeholder="주소 입력">&nbsp;&nbsp;&nbsp;
                        <input type="text" class="form-control col-4
                            border-primary" placeholder="상세주소 입력"
                               name="etcaddr" id="addr2" value="${mvo.etcaddr}">
                    </div><!--주소-->

                    <div class="form-group row">
                        <label class="col-form-label text-right col-2 text-primary" for="email1">이메일</label>
                        <input type="text" class="form-control col-3 border-primary" placeholder="이메일 입려"
                               name="email1" id="email1" value="${fn:split(mvo.email,'@')[0]}">
                        <div class="input-group-append">
                            <span class="input-group-text border-primary">@</span>
                        </div>
                        <input type="text" class="form-control col-3
                            border-primary"
                               name="email2" id="email2"  value="${fn:split(mvo.email,'@')[1]}" readonly>&nbsp;&nbsp;&nbsp;
                        <select class="form-control col-2 border-primary" id="email3">
                            <option>선택하세요</option>
                            <option>naver.com</option>
                            <option>google.com</option>
                            <option>daum.net</option>
                            <option>직접 입력하기</option>
                        </select>
                    </div><!--전자우편 주소-->

                    <div class="form-group row">
                        <label class="col-form-label text-right col-2 text-primary" for="tel1">연락처</label>
                        <select id="tel1" name="tel1"
                                class="form-control col-1 border-primary">
                            <option>국번</option>
                            <option>010</option>
                            <option>011</option>
                            <option>019</option>
                        </select>
                        <span class="col-form-label border-primary">-
                            </span>
                        <input type="text" class="form-control col-4 border-primary"
                               name="tel2" id="tel2" value="${fn:split(mvo.tel,'-')[1]}">
                        <span class="col-form-label border-primary">-
                            </span>
                        <input type="text" class="form-control col-4
                            border-primary"
                               name="tel3" id="tel3" value="${fn:split(mvo.tel,'-')[2]}">
                    </div><!--개인 연락처-->

                    <div class="form-group row">
                        <label class="col-form-label text-right col-2 text-primary" >자동 가입방지</label>
                        <div class="g-recaptcha"
                             data-sitekey="6Lfc8fYdAAAAALjZYQAgnympiIdJV9L04QZ212Ld"></div>
                        <input type="hidden" name="g-recaptcha" id="g-recaptcha"/>
                        <span style="color:red">${checkCaptcha}</span>
                    </div><!--자동 가입방지-->

                    <div class="row justify-content-center"
                         style="margin-top: 55px;">
                        <button type="button" class="btn btn-primary" id="joinbtn">
                            <i class="bi bi-check"></i>가입하기
                        </button>&nbsp;
                        <button type="button" class="btn btn-danger" id="canclebtn">
                            <i class="bi bi-x"></i>취소하기
                        </button>
                    </div><!-- 버튼들 -->

                </div>

            </div> <!-- 회원정보 입력 -->
            <input type="hidden" name="email" id="email" />
            <input type="hidden" name="tel" id="tel" />

        </form>
    </div>
</main> <!-- //main-end -->