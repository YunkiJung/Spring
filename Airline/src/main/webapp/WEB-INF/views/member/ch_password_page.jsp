<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.pwInput {
	width: 25em;
	box-shadow: 3px 3px 3px 3px gray;
}
</style>
</head>	
<body>
<form action="/member/chPassword" method="post" id="chPassword">
<input type="hidden" name="memId" value="${sessionScope.loginInfo.memId }">
	<div class="container" style="width: 800px; font-weight: bold; font-size: 1.3em; margin: 0 auto; margin-top: 100px; margin-left: 35%;">
	  <div class="mb-3 row">
	    <label class="col-sm-2 col-form-label">현재 비밀번호</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control pwInput" id="currentPw" name="currentPw" >
	    </div>
	  </div>
	  <div class="mb-3 row">
	    <label class="col-sm-2 col-form-label">새 비밀번호</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control pwInput" name="newPw" id="newPw">
	    </div>
	  </div>
	  <div class="mb-3 row">
	    <label class="col-sm-2 col-form-label">새 비밀번호 확인</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control pwInput" name="newPwConfirm">
	    </div>
	  </div>
	  <button type="button" id="submitBtn" class="btn btn-primary" style="margin-left: 21em; width: 14em;">변경하기</button>
	</div>
</form>
<script type="text/javascript" src="/resources/member/js/ch_password_page.js?ver=17"></script>
</body>
</html>