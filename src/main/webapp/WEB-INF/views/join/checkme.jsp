<%@page pageEncoding="UTF-8" %>
        <div id="main">
            <div class="mt25">
                <h2><i class="bi-people-fill"></i> 회원가입</h2>
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
                        <span class="badge badge-light" style="padding: 8px">정보입력</span>
                    </li>
                    
                    <li class="breadcrumb-item">
                        <span class="badge badge-light" style="padding: 8px">가입완료</span>
                    </li>
                    
                    
                </ul>
            </nav> <!-- 회원가입 진행단계 표시 -->
            
            <div class="mt25">
                <h3>가입인증</h3>
                <small class="text-muted">회원으로 가입하는 방법에는 2가지 방법이 있습니다. 아래에서 원하는 방법을 선택해주세요. <br>입력하신 정보는 가입완료 전까지 본 사이트에 저장되지 않습니다.</small>
                <hr>
            </div>
            
            <div class="card card-body bg-light">
                <h3>회원가입</h3>
                <form>
                    <div class="row">
                        <div class="col"></div>
                        <div class="col-5">
                            <div class="form-group row">
                                <label for="name" class="col-form-label text-right col-4">이름</label>
                                <input type="text" name="name" id="name" class="form-control col-6">
                            </div> <!-- 이름 -->
                            
                            <div class="form-group row">
                                <label for="byear" class="col-form-label text-right col-4">생년월일</label>
                                <select id="byear" class="form-control col-3">
                                    <option>년도</option>
                                    <option>2021</option>
                                    <option>2020</option>
                                    <option>2019</option>
                                </select>&nbsp;
                                <select id="bmonth" class="form-control col-2">
                                    <option>월</option>
                                    <option>12</option>
                                    <option>11</option>
                                    <option>10</option>
                                </select>&nbsp;
                                <select id="bday" class="form-control col-2">
                                    <option>일</option>
                                    <option>31</option>
                                    <option>30</option>
                                    <option>29</option>
                                </select>
                            </div> <!-- 생년월일 -->
                            
                            <div class="form-group row">
                                <label for="male" class="text-right col-4">성별</label>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="male" name="gender"
                                           class="custom-control-input" value="m">
                                    <label for="male" class="custom-control-label">남자</label>
                                </div>
                                &nbsp;&nbsp;&nbsp;
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="female" name="gender"
                                           class="custom-control-input" value="f">
                                    <label for="female" class="custom-control-label">여자</label>
                                </div>
                            </div><!-- 성별 -->
                        </div>
                        
                        <div class="col-5">
                            <ul>
                                <li>주민등록번호 입력 없이 전화번호로 회원가입이 가능합니다.</li>
                                <li>이름, 생년월일과 성별은 <span style="color:red">추후 변경할 수 없습니다.</span></li>
                                <li><span style="color:red">휴대폰 가입인증</span>을 하셔야 공개 게시판 이용이 가능합니다.</li>
                            </ul>
                        </div>
                        <div class="col"></div>
                    </div><!-- 설명 문구 -->
                    
                    <div class="row">
                        <div class="col-12 text-center">
                            <button type="button" id="checkbtn"
                                    class="btn btn-primary">
                                    <i class="bi bi-check"></i> 확인하기</button>
                            <button type="button" id="cancelbtn"
                                    class="btn btn-danger">
                                <i class="bi bi-x"></i> 취소하기</button>
                        </div>
                    </div> <!-- 버튼들 -->
                </form>
            </div> <!--  //회원가입 -->
            
            <div class="card card-body bg-light mt25">
            <h3>실명확인 회원가입</h3>
            <form>
                <div class="row">
                    <div class="col"></div>
                    <div class="col-5 mt35">
                        <div class="form-group row margin30">
                            <label for="name2"
                                class="col-4 col-form-label">이름</label>
                            <input type="text" id="name2"
                                   class="form-control col-6">
                        </div>
                        <div class="form-group row">
                            <label for="jumin1"
                                   class="col-4 col-form-label">주민번호</label>
                            <input type="text" id="jumin1"
                                   class="form-control col-3">&nbsp;
                            <label class="col-form-label">&ndash;</label>&nbsp;
                            <input type="text" id="jumin2"
                                   class="form-control col-3">
                        </div>
                        <div class="form-group row">
                            <label class="col-4"></label>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" id="usejm"
                                        class="custom-control-input">
                                <label for="usejm" class="custom-control-label">
                                    주민등록번호 처리에 동의합니다</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-5">
                        <ul>
                            <li>실명확인 회원가입시 공개 게시판 이용이 가능합니다.</li>
                            <li>타인의 주민등록번호를 임의로 사용하면 <span style="color:red;">'주민등록법'에 의해
			                    3년 이하의 징역 또는 1천만원 이하의 벌금</span>이 부과될 수 있습니다.</li>
                            <li>입력하신 주민등록번호는 <span style="color:red;">별도 저장되지 않으며,
			                    신용평가기관을 통한 실명확인용</span>으로만 이용됩니다.</li>
                            <li>개인정보보호법에 따라 <span style="color:red;">이용 동의</span>를 받습니다.</li>
                        </ul>
                    </div>
                    <div class="col"></div>
                </div>
                <div class="row">
                    <div class="col-12 text-center">
                        <button type="button" id="check2btn"
                                class="btn btn-primary">
                            <i class="bi bi-check"> 확인하기</i></button>
                        <button type="button" id="cancel2btn"
                                class="btn btn-danger">
                            <i class="bi bi-x"> 취소하기</i></button>
                    </div>
                </div>
            </form>
            </div> <!-- 실명확인  -->
            
        </div> <!-- // main -->
