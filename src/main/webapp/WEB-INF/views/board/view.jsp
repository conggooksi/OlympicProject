<%@page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- 잘부꿈 문자(\r\n)를 newChar 변수에 저장 --%>
<%-- JSP 객체의 생존기간 : scope --%>
<c:set var="newChar" value="
" scope="application" />

<div id="main">
            <div class="mt25">
                <h2><i class="bi bi-chat-text-fill"></i> 자유게시판</h2>
                <hr>
            </div>
            
            <div class="row">
               <div class="col"></div>
               <div class="col-5">
                    <button type="button" class="btn btn-light"><i class="bi bi-chevron-left"></i> 이전게시물</button>
                    <button type="button" class="btn btn-light"><i class="bi bi-chevron-right"></i> 다음게시물</button>
                </div>
               <div class="col-5 text-right">
                    <button type="button" class="btn btn-light"><i class="bi bi-plus-circle-fill"></i> 새글쓰기</button>
                </div>
               <div class="col"></div>
            </div>
                
            <div class="row mt25">
                <div class="col"></div>
                <div class="col-10">
                    <table class="table">
                        <tbody>
                            <tr><td colspan="2" class="vhead"
                                style="padding: 45px 0">
                                <h3>${bvo.title}</h3>
                            </td></tr> <!-- 제목 -->
                            
                            <tr class="bg1">
                            <td>${bvo.userid}</td>
                            <td class="text-right">${bvo.regdate} / ${bvo.thumbs} / ${bvo.views}</td>
                            </tr> <!-- 작성일, 추천수, 조회수 -->
                            
                            <tr>
                            <td colspan="2" class="vhead2" style="height: 550px">
                                ${fn:replace(bvo.contents, newChar, '<br>')}
                            </td>
                            </tr> <!-- 본문 -->
                        </tbody>
                    </table>
                </div>
                <div class="col"></div>
            </div><!-- 본문 -->
            
            <div class="row">
                <div class="col"></div>
               <div class="col-5">
                    <button type="button" class="btn btn-warning text-white"><i class="bi bi-pencil-square"></i> 수정하기</button>
                    <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i> 삭제하기</button>
                </div>
               <div class="col-5 text-right">
                    <button type="button" class="btn btn-light"><i class="bi bi-plus-circle-fill"></i> 목록으로</button>
                </div>
               <div class="col"></div>
            </div>
            
            <div class="row mt25">
                <div class="col"></div>
                <div class="col-10">
                    <h3><i class="bi bi-chat-quote-fill"></i> 나도 한마디</h3>
                    <table class="table rhead">
                        <c:forEach var="r" items="${rps}">
                            <c:if test="${r.rno eq r.cno}"> <!-- rno와 cno가 같으면 -->
                            <tr>
                                <td class="cmtwd"><h4>${r.userid}</h4></td>
                                <td>
                                    <div class="cmtbg">${r.regdate}</div>
                                    <p class="cmt">${r.reply}</p>
                                </td>
                            </tr> <!-- 댓글 출력 끝-->
                            </c:if>

                            <c:if test="${r.rno ne r.cno}"> <!-- rno와 cno가 다르면 -->
                                <tr><td></td>
                                    <td><ul class="rply">
                                        <li><div class="rplybg"><span><b>${r.userid}</b></span>
                                            <span style="float: right">${r.regdate}</span></div>
                                            <p class="cmt">${r.reply}</p></li></ul>
                                    </td>
                                </tr>
                            </c:if><%-- 댓글의 댓글 --%>
                        </c:forEach>
                    </table>
                </div>
                <div class="col"></div>
            </div><!-- 댓글 -->
            
            <div class="row mtb25">
                <div class="col"></div>
                <div class="col-10 card card-body bg-light">
                    <form name="comtfrm" id="comtfrm">
                        <div class="form-group row">
                            <label style="margin: auto">로그인하세요</label>
                            <textarea rows="7" class="form-control col-7" style="margin-bottom: -15px"></textarea>
                            <button type="button" class="btn btn-dark" style="margin: auto">댓글쓰기</button>
                        </div>
                    </form>
                </div>
                <div class="col"></div>
            </div> <!-- 댓글쓰기 -->
            
        </div> <!-- // main -->