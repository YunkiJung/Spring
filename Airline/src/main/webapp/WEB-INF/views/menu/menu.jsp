<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/common/css/menu.css?ver=1">
<link rel="stylesheet" href="/resources/ticket/css/search.css">
<style>
</style>
</head>	
<body>
	<div class="tm-main-content" id="top" style="position: fixed;">
            <div class="tm-top-bar" id="tm-top-bar">
                <!-- Top Navbar -->
                <div class="container" style="margin-left: 350px; margin-top: 40px;">
                    <div class="row">
                        <nav class="navbar">
                            <a class="navbar-brand mr-auto" href="/ticket/search">
                                <img src="/resources/common/img/logo.png" alt="Site logo" >
								<span class="airline">KH AIRLINE</span>
                            </a>
                            <c:if test="${not empty sessionScope.searchInfo }">
                            <div style="margin-right:35em; font-size: 1.4em;" class="mr-auto">
                            	${sessionScope.searchInfo.departurePortCode }
                            	<img src="/resources/common/img/aeroplane.png" width="35" height="30">
                            	${sessionScope.searchInfo.arrivalPortCode }
                            	<span style="margin-left: 2em;"> ${sessionScope.searchInfo.departureDate }</span>
                            	<c:if test="${sessionScope.searchInfo.hasReturn eq 'Y' }">
                            	: ${sessionScope.searchInfo.returnDate }
                            	</c:if>
                            	<span style="margin-left: 2em;">${sessionScope.searchInfo.count }</span>
                            	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16" style="margin-bottom: 0.3em;">
								  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
								</svg>
                            </div>
                            </c:if>
                            <div>
                            	<button type="button" class="loginSpan" style="margin-right: 1em;" onclick="location.href='/ticket/searchMyTicketForm';">비회원</button> 
                            </div>
                            <div style="color: black; font-size: 1.4em;">
                            <c:choose>
                            	<c:when test="${not empty sessionScope.loginInfo }">
                            		<div class="dropdown">
			  							<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
									   <svg xmlns="http://www.w3.org/2000/svg" width="50" height="25" fill="currentColor" viewBox="0 0 16 16">
										  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
										</svg>
									  </button>
									  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
									    <li><a class="dropdown-item" href="/member/memberDetail?memId=${sessionScope.loginInfo.memId }">프로필</a></li>
									    <li><a class="dropdown-item" href="/member/chPasswordPage">비밀번호 변경</a></li>
									    <li><a class="dropdown-item" href="/member/myTicket">예매조회</a></li>
									    <li><a class="dropdown-item" href="/member/logout">Logout</a></li>
									    <c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }">
									    	<li>
									    		<a class="dropdown-item" href="/admin/sales">관리자 메뉴</a>
									    	</li>
									    </c:if>
									  </ul>
									</div>
                            	</c:when>
                            	<c:otherwise>
<!--                             		<button class="loginSpan" data-bs-target="#loginModal" data-bs-toggle="modal">로그인</button> --> 
                            		<button class="loginSpan" data-bs-target="#loginModal" data-bs-toggle="modal">로그인</button> 
                            	</c:otherwise>
                            </c:choose>
                            </div>                      
                        </nav>            
                    </div>
                </div>
            </div>
           </div>
           
	<!-- Login Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form action="/member/login" method="post" id="loginFrom">
						<div class="row">
							<div class="mb-3">
								<input class="form-control" type="text" placeholder="ID" name="memId" id="loginMemId" required>
							</div>
						</div>
						<div class="row">
							<div class="mb-3">
								<input class="form-control" type="password" placeholder="PASSWORD" name="memPw" id="loginMemPw" required>
							</div>
						</div>
						<div class="row">
							<div class="mb-3">
								<span class="findSpan" data-bs-target="#findIdModal" data-bs-toggle="modal" style="color: black;">아이디 찾기</span>
								<span class="findSpan" data-bs-target="#findPwModal" data-bs-toggle="modal" style="color: black;">비밀번호 찾기</span>
							</div>
						</div>
						<div class="row" style="margin-bottom: 0.7em;">
							<div class="col d-grid gap-2">
								<button type="button" class="btn btn-primary" onclick="confirmMember();">로그인</button>
							</div>
						</div>
					</form>	
					<div class="row">
						<hr>
					</div>
					<div class="row">
						<div class="col d-grid gap-2">
<!-- 								<button class="btn btn-primary" data-bs-target="#joinModal" data-bs-toggle="modal" onclick="selectCountry();">회원가입</button> -->
							<button class="btn btn-primary" data-bs-target="#joinModal" onclick="selectCountry();">회원가입</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- Join Modal -->
	<div class="modal fade" id="joinModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body" style="color: black;">
					<form class="row g-3" action="/member/join" method="post" id="joinForm">
						<div class="col-12">
							<span class="regMember">회원가입</span>
						</div>
						<div class="col-12">
							<span class="regMember-logInfo">로그인 정보</span>
						</div>
						<div class="col-3">
						    <label class="form-label logInfo">아이디</label>
						</div>
						<div class="col-6">
						    <input type="text" class="form-control tabInput" name="memId" id="memId" required>
						</div>
						<div class="col-3">
						    <input type="button" class="btn btn-warning" value="중복확인" onclick="idConfirm();" name="idConfirmBtn" style="font-size: 0.9em; height: 3.7em;">
						</div>
						<div id="idConfirmDiv" style="color: red; font-size: 12px; margin-left: 12.5em;"></div>
						<div class="col-3">
						    <label class="form-label logInfo">비밀번호</label>
						</div>
						<div class="col-9">
						    <input type="password" class="form-control" required name="memPw" id="memPw" placeholder="8~16자 영문, 숫자, 특수문자 조합">
						</div>
						<div class="col-3">
						    <label class="form-label logInfo">비밀번호 확인</label>
						</div>
						<div class="col-9">
						    <input type="password" class="form-control" required name="pwConfirm">
						</div>
						<div class="col-3">
						    <label class="form-label logInfo">이메일</label>
						</div>
						<div class="col-5">
						    <input type="text" class="form-control" required name="memEmail1" id="memEmail1" style="width: 14em;">
						</div>
						<div class="col-4">
						    <select class="form-select" aria-label="Default select example" name="memEmail2" id="memEmail2">
								<option selected>@gmail.com</option>
								<option>@naver.com</option>
							</select>
						</div>
						<div class="col-12">
							<span class="regMember-memInfo">회원 정보</span>
						</div>
						<div class="col-3">
						    <label class="form-label logInfo">이름</label>
						</div>
						<div class="col-9">
						    <input type="text" class="form-control" required name="memName">
						</div>
						<div class="col-3">
						   <label class="form-label logInfo">국적</label>
						</div>
						<div class="col-9">
							<select class="form-select" aria-label="Default select example" name="countryCode"  id="countryCode">
							</select>
						</div>
						<div class="col-5">
						    <label class="form-label logInfo">생년월일</label><br>
						    <input type="date" class="form-control" placeholder="YYYY/MM/DD" required name="birthDate">
						</div>
						<div class="col-7">
							<div class="row" style="padding-left: 5em;">
								<div class="col-12">
									<label class="form-label logInfo">성별</label>
								</div>
								<div class="col-12">
								<div class="form-check form-check-inline genderRadio">
									<input class="form-check-input" type="radio" name="gender" checked value="MALE">
									<label class="form-check-label">남</label>
								</div>
								<div class="form-check form-check-inline genderRadio">
									<input class="form-check-input" type="radio" name="gender" value="FEMALE">
									<label class="form-check-label">여</label>
								</div>
								</div>
							</div>
						</div>
						<div class="col-6">
							<input type="text" id="sample6_postcode" placeholder="우편번호" class="form-control" name="postCode" onclick="$('#postBtn').trigger('click')">
						</div>
						<div class="col-3">
							<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary" id="postBtn" style="margin-left: 2em; font-size: 0.9em;">
						</div>
						<div class="col-12">
							<input type="text" id="sample6_address" placeholder="주소" class="form-control" name="memAddr1" style="width: 37.8em;">
						</div>
						<div class="col-6">
							<input type="text" id="sample6_detailAddress" placeholder="상세주소" class="form-control" name="memAddr2" style="width: 18em;">
						</div>
						<div class="col-6">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목" class="form-control" name="memAddrs" style="width: 19em;">
						</div>
						<div class="col-9">
					    	<label for="inputState" class="form-label logInfo">전화번호</label>
						</div>
						<div class="col-4">
						    <select id="inputState" class="form-select" name="memPhones" style="width: 12em;">
						        <option selected value="010">010</option>
						        <option value="011">011</option>
						    </select>
						</div>
						<div class="col-4">
						    <input type="text" class="form-control" name="memPhone1" id="memPhone1" required maxlength="4" style="width: 12em;">
						</div>
						<div class="col-4">
						    <input type="text" class="form-control"  name="memPhone2" id="memPhone2" required maxlength="4" style="width: 12em;">
						</div>
						<div class="col-12">
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" id="flexCheckDefault" name="checkAgreement">
							  <label class="form-check-label" for="flexCheckDefault">
							   개인정보 제3자 제공 동의
							  </label>
							</div>
					  	</div>
						<div class="col-12 d-grid gap-2">
						    <button type="submit" class="btn btn-primary">가입하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- FindId Modal -->
	<div class="modal fade" id="findIdModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" id="findIdModal">
					<div class="row">
						<div class="mb-3" style="text-align: center;">
							<h2>아이디 찾기</h2>
						</div>
					</div>
					<div class="row">
						<div class="mb-3">
							<input class="form-control" type="text" placeholder="EMAIL" id="findIdEmail" required>
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<button type="button" class="btn btn-primary" style="margin-left: 100px;" onclick="findId();">전송</button>
						</div>
						<div class="col-6">
							<button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- FindPw Modal -->
	<div class="modal fade" id="findPwModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body" id="findPwModal">
					<div class="row">
						<div class="mb-3" style="text-align: center;">
							<h2>비밀번호 찾기</h2>
						</div>
					</div>
					<div class="row">
						<div class="mb-3">
							<input class="form-control" type="text" placeholder="EMAIL" id="findEmail" required>
						</div>
					</div>
					<div class="row">
						<div class="mb-3">
							<input class="form-control" type="text" placeholder="ID" id="findId" required>
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<button type="button" class="btn btn-primary" style="margin-left: 100px;" onclick="findPw();">전송</button>
						</div>
						<div class="col-6">
							 <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript" src="/resources/common/js/menu.js?ver=46"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>