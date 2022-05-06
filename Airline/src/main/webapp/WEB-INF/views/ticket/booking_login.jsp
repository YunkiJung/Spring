<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input{
	margin-bottom: 1.5em;
}
</style>
</head>
<body>
<div class="row justify-content-md-center" style="font-size: 1.5em; margin-top: 10em; ">
	<div class="col-4">
		<form action="/ticket/passengerInfoFormLogin" method="post">
		<input type="hidden" name="airScheCode" value="${airScheCode }">
		  <div class="row mb-3">
		    <label for="memId" class="col-sm-2 col-form-label" style="font-weight: bold;">ID</label>
		    <div class="col-sm-10">
		      <input type="email" class="form-control" id="memIds" style="width: 80%; float: right;">
		    </div>
		  </div>
		  <div class="row mb-3">
		    <label for="memPw" class="col-sm-2 col-form-label" style="font-weight: bold;">PASSWORD</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="memPws" style="width: 80%; float: right;">
		    </div>
		  </div>
		  <div class="row mb-3">
		  	<div class="col-6">
			  <button type="button" class="btn btn-primary" id="loginBtn" style="font-size: 0.7em; width: 95%;">Sign In</button>
		  	</div>
		  	<div class="col-6">
			  <button type="button" class="btn btn-primary" style="font-size: 0.7em; width: 95%; float: right;" onclick="location.href='/ticket/passengerInfoForm?airScheCode=${airScheCode}';">Book Without Sign In</button>
		  	</div>
		  </div>
		</form>
	</div>
</div>
<script src="/resources/ticket/js/booking_login.js?ver=1"></script>
</body>
</html>