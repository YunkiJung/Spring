<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.wrap{
		width: 800px;
		margin: 0 auto;
	}
	table{
		width: 100%;
		margin-bottom: 30px;
	}
	
	.card{
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
</style>
</head>
<body>
<div class="wrap" style="box-shadow: 0px 5px 10px 5px rgb(0 0 0 / 20%);">
	<c:forEach items="${airScheduleList }" var="schedule">
		<div class="card text-center">
			<div class="card-header">
			  non-stop
			</div>
			<div class="card-body">
				<table>
					<colgroup>
						<col width="35%">
						<col width="15%">
						<col width="15%">
						<col width="35%">
					</colgroup>
					<tbody>
						<tr>
							<td style="font-size: 4em;">${schedule.departurePortCode }</td>
							<td colspan="2">
								<img src="/resources/ticket/img/line.jpeg" style="width: 250px; height: 30px;"><br>
								${schedule.hrs }
							</td>
							<td style="font-size: 4em;">${schedule.arrivalPortCode }</td>
						</tr>
						<tr>
							<td>${schedule.dportName }</td>
							<td></td>
							<td></td>
							<td>${schedule.aportName }</td>
						</tr>
						<tr>
							<td>${schedule.departureDate }</td>
							<td colspan="2"></td>
							<td>${schedule.arrivalDate }</td>
						</tr>
					</tbody>
				</table>
				<div style="font-size: 2.8em;">
				$${schedule.basePrice }
				</div>
			</div>
			<div class="card-footer text-muted">
			  <c:if test="${not empty sessionScope.loginInfo && sessionScope.searchInfo.hasReturn eq 'N' }">
					<a href="/ticket/passengerInfoForm?airScheCode=${schedule.airScheCode }" class="btn btn-primary">Select</a>
				</c:if>
				<c:if test="${empty sessionScope.loginInfo && sessionScope.searchInfo.hasReturn eq 'N'}">
					<a href="/ticket/bookingLogin?airScheCode=${schedule.airScheCode }" class="btn btn-primary">Select</a>
				</c:if>
				<c:if test="${empty sessionScope.loginInfo && sessionScope.searchInfo.hasReturn eq 'Y' && empty sessionScope.departureAirScheCode}">
					<a href="/ticket/searchReturnAirSchedule?airScheCode=${schedule.airScheCode }" class="btn btn-primary">Select</a>
				</c:if>
				<c:if test="${empty sessionScope.loginInfo && sessionScope.searchInfo.hasReturn eq 'Y' && not empty sessionScope.departureAirScheCode}">
					<a href="/ticket/bookingLogin?airScheCode=${schedule.airScheCode }" class="btn btn-primary">Select</a>
				</c:if>
				<c:if test="${not empty sessionScope.loginInfo && sessionScope.searchInfo.hasReturn eq 'Y' && empty sessionScope.departureAirScheCode}">
					<a href="/ticket/searchReturnAirSchedule?airScheCode=${schedule.airScheCode }" class="btn btn-primary">Select</a>
				</c:if>
				<c:if test="${not empty sessionScope.loginInfo && sessionScope.searchInfo.hasReturn eq 'Y' && not empty sessionScope.departureAirScheCode}">
					<a href="/ticket/passengerInfoForm?airScheCode=${schedule.airScheCode }" class="btn btn-primary">Select</a>
				</c:if>
			</div>
		</div>
	</c:forEach>	
</div>




</body>
</html>