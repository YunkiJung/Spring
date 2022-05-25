<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/admin/css/admin_check_seat.css">
<style>
.card{
	position: fixed;
	top: 100px;
}
.gradationSeat{
background: linear-gradient(to right, #dc3545, #0d6efd);
color: white;
}
p {
color: white;
}

.btn{
	background-color: black;
}

.btn:hover {
background-color: white;
 	color: black;
}

</style>
</head>
<body>
	<div class="row">
		<div class="col">
			<!-- 좌석 그림 -->
			<div class="row justify-content-center selectContainer">
				<div class="col-4">
					<div class="plane">
						<div class="cockpit">
							<h1 class="card-title">${sessionScope.searchInfo.departurePortCode }
								<img src="/resources/ticket/img/image.png" width="70"
									height="50" style="margin-bottom: 2em;">
								${sessionScope.searchInfo.arrivalPortCode }
							</h1>
						</div>
						<ol class="cabin fuselage" id="cabin">
							<div class="exit exit--front fuselage">
								<!-- ROW -->
								<c:forEach begin="1" end="${rowNum }" step="1" varStatus="status" var="rowNums">
									<!-- COL -->
									<li class="row row--${rowNums }">
										<ol class="seats" type="A">
											<c:forEach items="${colCode }" var="col">
												<li class="seat">
													<input type="checkbox" id="${rowNums }${col }" name="checkbox" value="${rowNums }${col }" style="color: red;" disabled>													
													<label style="background-color: #eeeeee;" id="label${rowNums }${col }" for="${rowNums }${col }">
														${rowNums }${col }
													</label>
												</li>
											</c:forEach>
										</ol>
									</li>
									<c:if test="${rowNums % 10 eq 0 }">
										<div class="exit exit--back fuselage"></div>
									</c:if>
								</c:forEach>
								</div>
						</ol>
					</div>
				</div>
				<div class="col-1"></div>
				<div class="col-2">
					<div class="card gradationSeat" style="width: 18rem; color: white;">
						
						<div class="card-body">
							
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item gradationSeat">${adminAirScheduleVO.airScheCode }<span
								id="seatNumScreen"></span>
								
						</li>
						</ul>
						<div class="card-body">
						<div class="col-8" id="infoDiv">
									<form action="" method="post" id="formId">
									<input type="hidden" id="airScheCode" name="airScheCode" value="${adminAirScheduleVO.airScheCode }">
										passScheCode<br> 
										<input type="text" name="passScheCode" id="passScheCode"><br> memId<br> 
										<input type="text" name="memId" id="memId"><br> passName<br>
										<input type="text" name="passName" id="passName"><br>
										gender<br> 
										<input type="radio" name="gender" value="MALE" id="male">male 
											<input type="radio" name="gender" value="FEMALE" id="female">female <br> birthDate<br>
										<input type="date" name="birthDate"><br> countryCode<br>
										<select name="countryCode">
											<c:forEach items="${countryList }" var="country">
												<option value="${country.countryCode }">${country.countryName }</option>
											</c:forEach>
										</select><br> passportNum<br> <input type="text"
											name="passportNum"><br> passEmail<br> <input
											type="text" name="passEmail"><br> passPhone<br>
										<input type="text" name="passPhone1" id="passPhone1" style=" 0.5rem;"  maxlength="3">
										<input type="text" name="passPhone2" id="passPhone2" style=" 0.5rem;"  maxlength="4">
										<input type="text" name="passPhone3" id="passPhone3" style=" 0.5rem;"  maxlength="4"> 
										  <input type="hidden" name="passPhone" id="passPhone"><br>
										passAddr<br> <input type="text" name="passAddr"><br>
										seatCode<br> <input type="text" name="seatCode"><br>
										<input type="hidden" name="ticketPrice">
										<input type="hidden" name="orderCode">
										<input type="hidden" name="orderDate">
										<!-- <input type="submit" class="btn btn-primary" value="정보 입력"> -->
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script type="text/javascript"
		src="/resources/admin/js/check_seat.js?ver=13"></script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</body>
</html>