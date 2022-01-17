<%@page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<div id="main">
            <div class="mt25">
                <h2><i class="bi bi-cloud-download-fill"></i> 자료실</h2>
                <hr>
            </div>
            
            <div class="row mt25">
                <div class="col"></div>
                <div class="col-5">
                    <h3><i class="bi bi-plus-circle-fill"></i> 새글쓰기</h3>
                </div>
                <div class="col-5 text-right">
                    <button type="button" class="btn btn-light" id="listbtn">
                        <i class="bi bi-list"></i> 목록으로</button>
                </div>
                <div class="col"></div>
            </div>
            
            <div class="row">
                <div class="col"></div>
                <div class="col-10 card card-body bg-light text-danger mtb25">
                    <form id="pdsfrm">
                    <div class="form-group row">
                        <label for="title" class="col-form-label col-2 text-right">제목</label>
                        <input type="text" name="title" id="title" class="form-control border-danger col-9">
                    </div>
                    
                    <div class="form-group row">
                        <label for="contents" class="col-form-label col-2 text-right">본문내용</label>
                        <textarea rows="15" name="contents" id="contents" class="form-control border-danger col-9"></textarea>
                    </div>

                    <!-- 파일첨부 시작 -->
                    <div class="form-group row">
                        <label for="file1"
                               class="col-form-label col-2 text-right">파일첨부</label>
                        <div class="custom-file col-9">
                            <input type="file" id="file1" name="file"
                                   class="custom-file-input">
                            <label class="custom-file-label">첨부할 파일을 선택하세요</label>
                        </div>
                        <div class="custom-file col-9 offset-2">
                            <input type="file" id="file2" name="file"
                                   class="custom-file-input">
                            <label class="custom-file-label">첨부할 파일을 선택하세요</label>
                        </div>
                        <div class="custom-file col-9 offset-2">
                            <input type="file" id="file3" name="file"
                                   class="custom-file-input">
                            <label class="custom-file-label">첨부할 파일을 선택하세요</label>
                        </div>
                    </div>
                    <!-- 파일첨부 끝 -->

                    <div class="form-group row">
                        <label class="col-form-label col-2 text-right">자동입력방지</label>
                        <div class="g-recaptcha" data-sitekey="6Lfb8fYdAAAAABH90Sqn4H0ssa4tvUleIweFOzQ-"></div>
                        <input type="hidden" name="g-recaptcha" id="g-recaptcha" />
                        <span style="color: red">${checkCaptcha}</span>
                    </div>

                    <%-- 로그인시 저장해둔 아이디를 숨김필드로 설정 --%>
                    <input type="hidden" name="userid" id="userid" value="${sessionScope.uid}">
                    
                    <div class="row">
                       <div class="col-12 text-center">
                        <hr style="background: black">
                        <button type="button" class="btn btn-primary" id="writebtn">
                            <i class="bi bi-check"></i> 입력완료</button>
                        <button type="button" class="btn btn-danger" id="cancelbtn">
                            <i class="bi bi-x"></i> 취소하기</button>
                       </div>
                    </div>
                    </form>
                </div>
                <div class="col"></div>
            </div>
            
        </div> <!-- // main -->
