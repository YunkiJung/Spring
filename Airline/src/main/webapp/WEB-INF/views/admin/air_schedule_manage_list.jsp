<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<link href="/resources/admin/css/adminCommon.css" rel="stylesheet">
</head>
<body>
	<div class="row">
		<div class="col-12" id="searchContainer">
			<form action="/admin/airScheList" method="get">
				<h2 style="font-weight: bold;">
				${searchVO.planeCode }
				</h2>
				<input type="hidden" name="planeCode" value="${searchVO.planeCode }">
				<div class="input-group" style="text-align: center; width:100%;">
						<span class="input-group-text">운항 코드</span>
						<input class="form-control"type="text" name="airScheCode">
						<span class="input-group-text">경로 코드</span>
						<input class="form-control"type="text" name="pathCode">
						<span class="input-group-text">출발일</span>
						<input class="form-control"type="date" name="departureDate">
						<input type="submit" class="btn btn-primary btnClass" value="검색" style="background-color: #dc3545; border: #dc3545;">
				</div>
				
			</form>
		</div>

		<div class="col-12" id="listContainer">
			<table class="styled">
				<thead>
					<tr>
						<td>운항 코드</td>
					
						<td>운항 경로</td>

						<td>출발일</td>
						
						<td>도착일</td>

						<td>남은 좌석</td>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${airScheduleList }" var="list">
					<tr>
						<td>${list.airScheCode }</td>

						<td>${list.departurePortCode } -> ${list.arrivalPortCode }</td>

						<td>${list.departureDate }</td>
						
						<td>${list.arrivalDate }</td>
						
						<td>${list.spareSeat }</td>

					</tr>
				</c:forEach>
				</tbody>
			</table>

			<div class="row" id="pagingContainer">
				<div style="position:absolute; width: 10rem;">
					<input type="button" class="btn btn-primary btnClass" value="추가"
						onclick="insertAirSche('${searchVO.planeCode}');" style="background-color: #dc3545; border: #dc3545;">
				</div>

				<div class="col-12" style="margin: 0 auto; text-align: center;">
					<nav aria-label="...">
						<ul class="pagination justify-content-center admin">
							<li
								class="page-item <c:if test="${!searchVO.prev }">disabled</c:if>">
								<a class="page-link"
								href="admin/airScheList?nowPage=${searchVO.beginPage - 1 }&planeCode=${searchVO.planeCode}">Previous</a>
							</li>
							<c:forEach begin="${searchVO.beginPage }"
								end="${searchVO.endPage }" var="pageIndex">
								<li
									class="page-item <c:if test="${searchVO.nowPage eq pageIndex }">active</c:if>"><a
									class="page-link"
									href="/admin/airScheList?nowPage=${pageIndex }&planeCode=${searchVO.planeCode}">${pageIndex}</a></li>
							</c:forEach>
							<li
								class="page-item <c:if test="${!searchVO.next }">disabled</c:if>">
								<a class="page-link"
								href="/admin/airScheList?nowPage=${searchVO.endPage + 1 }&planeCode=${searchVO.planeCode}">Next</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

		<div id="modalDiv">
			<div class="modal fade" id="infoModal" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<form action="" method="post" id="formId">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">
							<input type="hidden" name="airScheCode" id="airScheCode">
							</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body" id='modalBody'>
							<div>
									<table class="table table-bordered border-secondary" id="listTable">
										<tr>
											<td>PLANE_CODE <select name="planeCode" >
												<c:forEach items="${planeList}" var="plane">
													<option value="${plane.planeCode }">${plane.modelName }</option>
												</c:forEach>
											</select>
											</td>
											<td>TEAM_CODE 
											<br><select name="teamCode">
													<c:forEach items="${teamList }" var="team">
														<option value="${team }">${team }</option>
													</c:forEach>
											</select>
											</td>
											<td>GATE_NUM <input type="text" name="gateNum" id="gateNum"
												class="form-control" value="">
											</td>
										</tr>
										<tr>
											<td colspan="2">운항 시간<br>
												<input type="date" id="datepicker" name="departureDate1">
												<input type="time" id="timepicker" name="departureDate2">
												<input type="hidden" name="departureDate" id="departureDate">
											</td>											
											<td>BASE_PRICE <input type="text" name="basePrice" id="basePrice"
												class="form-control" value="">
											</td>
											</tr>
											<tr>
											<td colspan="4">PATH_CODE
											<input type="hidden" name="pathCode">
											출발
											<input type="text" value="" name="departurePortCode" readonly>
											도착
											<select name="arrivalPortCode">
											</select>
											</td>
											</tr>
									</table>
							</div>
						</div>
						<div class="modal-footer" id="modalFooter">
							<button type="button" class="btn btn-danger"
								onclick="deleteAirSche();">삭제</button>
							<button type="button" class="btn btn-primary"
								onclick="updateAirSche();">수정</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/resources/admin/js/air_schedule_manage.js?ver=18"></script>
</body>
</html>