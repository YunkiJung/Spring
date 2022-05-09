<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/admin/css/air_schedule_manage_list.css" rel="stylesheet">
<style>
	.on{
		border: 0.5px solid red;
		
	}
	.off{
		border: 0.5px solid blue;
		font-size : 30px;
	}
</style>
</head>
<body>
	<!-- <div class="row">
		<div class="col-8" id="searchContainer"> -->
		<div id="searchContainer">
		<div>
			<form action="/admin/airScheManage" method="get">
				<table class="table table-light">
					<tr>
						<td>
							항공기 코드 <input type="text" name="planeCode">
						</td>

						<td><input type="submit" class="btn btn-primary" value="검색">
						</td>
					</tr>

				</table>
			</form>
		</div>

		<!-- <div class="col-10" id="listContainer"> -->
		<div >
		<table>
			<!-- <table class="table table-light"> -->
			<colgroup>
				<col width="*">
				<col width="*">
				<col width="13%">
				<col width="*">
				<col width="13%">
				<col width="*">
				<col width="13%">
				<col width="*">
				<col width="13%">
			</colgroup>
				<thead>
					<tr>
						<td>항공기 코드</td>
						<td>출발 공항</td>
						<td>출발 일</td>
						<td>도착 공항</td>
						<td>도착 일</td>
						<td>종착지 출발 공항</td>
						<td>종착지 출발 일</td>	
						<td>종착지 도착 공항</td>
						<td>종착 일</td>
					</tr>
				</thead>
				
				
				
				<c:forEach items="${planeList }" var="list">
						
							<tr onclick="location.href='/admin/airScheList?planeCode=${list.planeCode}';"
								<c:choose>
<%-- 									<c:when	test="${currentDate > departureDate and currentDate < arrivalDate}"> --%>
									<c:when	test="${currentDate > list.departureDate and currentDate < list.arrivalDate}">
										class="on"
									</c:when>
									<c:otherwise>
										class="off"
									</c:otherwise>
								</c:choose>
							>
								<!-- data-bs-toggle="modal" data-bs-target="#staticBackdrop" -->
								
								
								<td>
								${list.planeCode }
								</td>
								<td>
									<c:if test="${empty list.departurePortCode }">
									<a style="color: grey;">미정</a>
									</c:if>
									${list.departurePortCode }
								</td>
								<td>
									<c:if test="${empty list.departureDate }">
									<a style="color: grey;">미정</a>
									</c:if>
									${list.departureDate }
								</td>
								<td>
									<c:if test="${empty list.arrivalPortCode }">
									<a style="color: grey;">미정</a>
									</c:if>
									${list.arrivalPortCode }</td>
								<td>
									<c:if test="${empty list.arrivalDate }">
									<a style="color: grey;">미정</a>
									</c:if>
									${list.arrivalDate }</td>
								<td>
									<c:if test="${empty list.finalDeparturePortCode }">
									<a style="color: grey;">미정</a>
									</c:if>
									${list.finalDeparturePortCode }</td>
								<td>
									<c:if test="${empty list.finalDepartureDate }">
									<a style="color: grey;">미정</a>
									</c:if>
									${list.finalDepartureDate }</td>
								<td>
									<c:if test="${empty list.finalArrivalPortCode }">
									<a style="color: grey;">미정</a>
									</c:if>
									${list.finalArrivalPortCode }</td>
								<td>
									<c:if test="${empty list.finalArrivalDate }">
									<a style="color: grey;">미정</a>
									</c:if>
									${list.finalArrivalDate }</td>
							</tr>
						
				</c:forEach>
			</table>


				<div class="col-10">
					<nav aria-label="...">
						<ul class="pagination">
							<li
								class="page-item <c:if test="${!searchVO.prev }">disabled</c:if>">
								<a class="page-link"
								href="admin/airScheList?nowPage=${searchVO.beginPage - 1 }">Previous</a>
							</li>
							<c:forEach begin="${searchVO.beginPage }"
								end="${searchVO.endPage }" var="pageIndex">
								<li
									class="page-item <c:if test="${searchVO.nowPage eq pageIndex }">active</c:if>"><a
									class="page-link"
									href="/admin/airScheList?nowPage=${pageIndex }">${pageIndex}</a></li>
							</c:forEach>
							<li
								class="page-item <c:if test="${!searchVO.next }">disabled</c:if>">
								<a class="page-link"
								href="/admin/airScheList?=${searchVO.endPage + 1 }">Next</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
	</div>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>