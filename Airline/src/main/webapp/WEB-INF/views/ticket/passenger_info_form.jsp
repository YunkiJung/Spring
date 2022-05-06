<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.infoTitle{
		border-top: 10px solid black;
		padding-top: 10px;
	}
	.form-control {
		width: 95%;
	}
</style>
</head>
<body>
<div class="row justify-content-md-center">
	<div class="col-4">
		<form class="row g-3" action="/ticket/selectSeat" method="post">
			<c:forEach var="count" begin="1" end="${sessionScope.searchInfo.count }" step="1" varStatus="status">
				<div class="col-12 infoTitle">
					<h4>No.${count } PASSENGER INFO</h4>
				</div>
				<div class="col-6">
				    <label for="inputEmail4" class="form-label">NAME</label>
				    <input type="text" class="form-control" id="inputEmail4" name="passName">
				</div>
				<div class="col-6">
				    <label for="inputEmail4" class="form-label">GENDER</label>
				    <select class="form-control" id="inputEmail4" name="gender" style="">
				    	<option value="MALE">MALE</option>
				    	<option value="FEMALE">FEMALE</option>
				    </select>
				</div>
				<div class="col-6">
				    <label for="inputEmail4" class="form-label">BOD</label>
				    <input type="date" class="form-control" id="inputEmail4" name="birthDate" placeholder="YYYY/MM/DD">
				</div>
				<div class="col-6">
				    <label for="inputEmail4" class="form-label">NATIONALITY</label>
				    <select name="countryCode" class="form-control" id="inputEmail4">
					    <c:forEach items="${countryList }" var="country">
					    	<option value="${country.countryCode }">${country.countryName }</option>
					    </c:forEach>
				    </select>
				</div>
				<div class="col-6">
				    <label for="inputEmail4" class="form-label">PASSPORT NO.</label>
				    <input type="text" class="form-control" id="inputEmail4" name="passportNum">
				</div>
				<div class="col-12">
				    <label for="inputEmail4" class="form-label">EMAIL</label>
				    <input type="email" class="form-control" id="inputEmail4" name="passEmail">
				</div>
				<div class="col-6">
					<input type="text" id="sample6_postcodess${status.index }" placeholder="우편번호" class="form-control" name="passAddrs" onclick="$('#postBtns${status.index}').trigger('click')">
				</div>
				<div class="col-3">
					<input type="button" onclick="sample6_execDaumPostcodes(${status.index})" value="우편번호 찾기" class="btn btn-secondary" id="postBtns${status.index}" style="margin-left: 2em; font-size: 0.9em;">
				</div>
				<div class="col-12">
					<input type="text" id="sample6_addresss${status.index }" placeholder="주소" class="form-control" name="passAddrs" style="width: 39em;">
				</div>
				<div class="col-6">
					<input type="text" id="sample6_detailAddresss${status.index }" placeholder="상세주소" class="form-control" name="passAddrs" style="width: 19em;">
				</div>
				<div class="col-6">
					<input type="text" id="sample6_extraAddresss${status.index }" placeholder="참고항목" class="form-control" name="passAddrs" style="width: 19.5em;">
				</div>
				<div class="col-4">
				    <label for="inputState" class="form-label">TELL</label>
				    <select id="inputState" class="form-select" name="passPhones">
				        <option selected value="010">010</option>
				        <option value="011">011</option>
				    </select>
				</div>
				<div class="col-4">
				    <label for="inputCity" class="form-label">&nbsp;</label>
				    <input type="text" class="form-control" id="inputCity" name="passPhones">
				</div>
				<div class="col-4">
				    <label for="inputCity" class="form-label">&nbsp;</label>
				    <input type="text" class="form-control" id="inputCity" name="passPhones">
				</div>
			</c:forEach>
			<div class="col-12 d-grid gap-2">
			    <button type="submit" class="btn btn-primary">NEXT</button>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript" src="/resources/ticket/js/passenger_info_form.js?ver=3"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>