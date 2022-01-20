<%@ page pageEncoding="UTF-8"%>

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
                        <label form="passwd"
                               class="col-form-label col-4 text-right">
                            비밀번호</label>
                        <input type="password" name="passwd"
                               id="passwd"
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