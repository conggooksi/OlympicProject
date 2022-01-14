<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<div id="main">
            <div class="mt25">
                <h2><i class="bi bi-people-fill"></i> 회원가입</h2>
                <hr>
            </div>
            
            <nav aria-label="breadcrumb">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item">
                        <span class="badge badge-success" style="padding: 8px">이용약관</span>
                    </li>
                    
                    <li class="breadcrumb-item">
                        <span class="badge badge-success" style="padding: 8px">실명확인</span>
                    </li>
                    
                    <li class="breadcrumb-item">
                        <span class="badge badge-success" style="padding: 8px">정보입력</span>
                    </li>
                    
                    <li class="breadcrumb-item">
                        <span class="badge badge-success" style="padding: 8px">가입완료</span>
                    </li>
                </ul>
            </nav> <!-- 회원가입 진행단계 표시 -->
            
            <div class="mt25">
                <h3>회원정보 입력</h3>
                <small class="text-muted">회원정보는 개인정보 취급방침에 따라 안전하게 보호되며, 회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.</small>
                <hr>
            </div>
            
            <div class="card card-body bg-light m1030">
                <h3>일반회원</h3>
                <form id="joinfrm">
                <div class="row mt35">
                    <div class="col"></div>
                    <div class="col-11">
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-danger" for="name">이름</label>
                            <input type="text" class="form-control col-2 border-danger" name="name" id="name" value="${param.nm}" readonly>
                        </div>
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-danger" for="jumin1">주민등록번호</label>
                            <input type="text" class="form-control col-2 border-danger" name="jumin1" id="jumin1" value="${param.jm1}" readonly>
                            <span class="col-form-label">&nbsp;&ndash;&nbsp;</span>
                            <input type="text" class="form-control col-2 border-danger" name="jumin2" id="jumin2" value="${param.jm2}" readonly>
                        </div>
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-danger" for="userid">아이디</label>
                            <input type="text" class="form-control col-3 border-danger" name="userid" id="userid" value="${mvo.userid}">
                            <span id="uidmsg" class="col-form-label">&nbsp;8~18 자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다.</span>
                        </div>
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-danger" for="passwd">비밀번호</label>
                            <input type="password" class="form-control col-3 border-danger" name="passwd" id="passwd">
                            <span class="col-form-label">&nbsp;8~18 자의 영문 소문자, 숫자와 특수기호(_)만 사용할 수 있습니다.</span>
                        </div>
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-danger" for="repwd">비밀번호 확인</label>
                            <input type="password" class="form-control col-3 border-danger" name="repwd" id="repwd">
                            <span id="pwdmsg" class="col-form-label">&nbsp;이전 항목에서 입력했던 비밀번호를 한번 더 입력하세요.</span>
                        </div>
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-danger" for="zip1">우편번호</label>
                            <input type="text" class="form-control col-1 border-danger" name="zip1" id="zip1"
                                   value="${fn:split(mvo.zipcode, '-')[0]}" readonly>
                            <span class="col-form-label">&nbsp;&ndash;&nbsp;</span>
                            <input type="text" class="form-control col-1 border-danger" name="zip2" id="zip2"
                                   value="${fn:split(mvo.zipcode, '-')[1]}" readonly>&nbsp;&nbsp;
                            <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#zipmodal"><i class="bi bi-question-circle"></i> 우편번호 찾기</button>
                        </div>
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-danger" for="addr1">주소</label>
                            <input type="text" class="form-control col-4 border-danger" name="addr" id="addr1" value="${mvo.addr}">
                            &nbsp;&nbsp;
                            <input type="text" class="form-control col-4 border-danger" name="etcaddr" id="addr2" value="${mvo.etcaddr}">
                        </div>
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-danger" for="email1">전자우편 주소</label>
                            <input type="text" class="form-control col-3 border-danger" name="email1" id="email1">
                            <div class="input-group-append">
                                <span class="input-group-text border-danger">@</span>
                            </div>
                            <input type="text" class="form-control col-3 border-danger" name="email2" id="email2" readonly>&nbsp;
                            <select class="form-control col-2 border-danger" id="email3">
                                <option>선택하세요</option>
                                <option>naver.com</option>
                                <option>gmail.com</option>
                                <option>hotmail.com</option>
                                <option>직접 입력하기</option>
                            </select>
                        </div>
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-danger" for="tel1">개인 연락처</label>
                            <select id="tel1" name="tel1" class="form-control col-1 border-danger">
                                <option>국번</option>
                                <option>010</option>
                                <option>011</option>
                                <option>019</option>
                            </select>
                            <span class="col-form-label">&nbsp;&ndash;&nbsp;</span>
                            <input type="text" class="form-control col-1 border-danger" name="tel2" id="tel2">
                            <span class="col-form-label">&nbsp;&ndash;&nbsp;</span>
                            <input type="text" class="form-control col-1 border-danger" name="tel3" id="tel3">
                        </div>
                        
                        <div class="form-group row">
                            <label class="col-form-label text-right col-2 text-danger">자동 가입방지</label>
                            <div class="g-recaptcha" data-sitekey="6Lfb8fYdAAAAABH90Sqn4H0ssa4tvUleIweFOzQ-"></div>
                            <input type="hidden" name="g-recaptcha" id="g-recaptcha" />
                            <span style="color: red">${checkCaptcha}</span>
                        </div>
                        
                        <div class="form-group row"></div>
                    </div>

                </div> <!-- 회원정보 입력 -->
                <div class="row justify-content-center" style="margin-top: 55px;">
                    <button type="button" class="btn btn-primary" id="joinbtn">
                        <i class="bi bi-check"></i>가입하기
                    </button>&nbsp;
                    <button type="button" class="btn btn-danger" id="cancelbtn">
                        <i class="bi bi-x"></i>취소하기
                    </button>
                </div><!-- 버튼들 -->
                    <input type="hidden" name="zipcode" id="zipcode" />
                    <input type="hidden" name="email" id="email" />
                    <input type="hidden" name="tel" id="tel" />
                </form>
            </div>
            
            
        </div> <!-- // main -->

            
    
    <!-- 우편번호 찾기 모달 -->
    <div id="zipmodal" role="dialog" class="modal">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">우편번호 찾기</h3>
                    <button type="button" data-dismiss="modal" class="btn btn-light">닫기</button>
                </div>
                
                <div class="modal-body">
                    <form>
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-3">
                                <label for="dong" class="text-right text-danger" style="margin-top: -7px">
                                검색하실 주소의<br> 동이름을 입력하세요
                            </label>
                            </div>
                            <div class="col-4">
                                <input type="text" id="dong" name="dong" class="form-control border-danger">
                            </div>
                            <div class="col-3">
                                <button type="button" id="findbtn" class="btn btn-primary">
                                <i class="bi bi-search"></i>검색하기
                                </button>
                            </div>
                            <div class="col-1"></div>
                        </div>
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-11">
                               <hr class="col-10" style="margin-left: -12px">
                                <p>지역의 읍/면/동의 이름을 공백없이 입력하신 후,
                                [검색하기] 버튼을 클릭하세요</p>
                                <select id="addrlist" name="addrlist" size="10" class="form-control col-10">
                                    <%--<option>123-456 서울시 구로구 구로동 더조은아카데미</option>
                                    <option>123-456 서울시 구로구 구로동 더조은아카데미</option>
                                    <option>123-456 서울시 구로구 구로동 더조은아카데미</option>
                                    <option>123-456 서울시 구로구 구로동 더조은아카데미</option>
                                    <option>123-456 서울시 구로구 구로동 더조은아카데미</option>
                                    <option>123-456 서울시 구로구 구로동 더조은아카데미</option>
                                    <option>123-456 서울시 구로구 구로동 더조은아카데미</option>
                                    <option>123-456 서울시 구로구 구로동 더조은아카데미</option>
                                    <option>123-456 서울시 구로구 구로동 더조은아카데미</option>
                                    <option>123-456 서울시 구로구 구로동 더조은아카데미</option>
                                    <option>123-456 서울시 구로구 구로동 더조은아카데미</option>
                                    <option>123-456 서울시 구로구 구로동 더조은아카데미</option>
                                    <option>123-456 서울시 구로구 구로동 더조은아카데미</option>
                                    <option>123-456 서울시 구로구 구로동 더조은아카데미</option>
                                    <option>123-456 서울시 구로구 구로동 더조은아카데미</option>--%>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                
                <div class="modal-footer">
                    <button type="button" id="sendbtn" class="btn btn-danger">선택하고 닫기</button>
                </div>
                
            </div> <!-- // modal-content -->
        </div>
    </div>
