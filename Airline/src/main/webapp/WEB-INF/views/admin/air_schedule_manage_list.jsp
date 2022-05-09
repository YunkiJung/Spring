<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-8" id="searchContainer" style="text-align: center;">
			<form action="/admin/airScheList" method="get">
				<h2>
				현재 항공기 코드 : ${adminAirScheduleVO.planeCode }
				</h2>
				<input type="hidden" name="planeCode" value="${adminAirScheduleVO.planeCode }">
				<table class="table table-light">
					<tr>
						<td>
							운항 코드 <input type="text" name="airScheCode">
						</td>
						<td>
							경로 코드 <input type="text" name="pathCode">
						</td>
						<td>
							출발일 <input type="date" name="departureDate">
						</td>

						<td>
						<input type="submit" class="btn btn-primary" value="검색">
						</td>
					</tr>

				</table>
			</form>
		</div>

		<div class="col-8" id="listContainer">
			<table class="table table-light">
				<thead>
					<tr>
						<td>운항 코드</td>

						<td>경로 코드</td>

						<td>출발일</td>

						<td>남은 좌석</td>
					</tr>
				</thead>
				<c:forEach items="${airScheduleList }" var="list">
					<tr onclick="selectAirSche('${list.airScheCode}','${list.planeCode}');"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						<td>${list.airScheCode }</td>

						<td>${list.pathCode }</td>

						<td>${list.departureDate }</td>
						
						<td>${list.spareSeat }</td>

					</tr>
				</c:forEach>
			</table>

			<div class="row d-flex align-self-center">
				<div class="col-1">
					<input type="button" class="btn btn-primary" value="추가"
						onclick="insertAirSche('${adminAirScheduleVO.planeCode}');">
				</div>

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

		<div id="modalDiv">
			<div class="modal fade" id="infoModal" data-bs-backdrop="static"
				data-bs-keyboard="false" tabindex="-1"
				aria-labelledby="staticBackdropLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="staticBackdropLabel">운항 정보</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
								<form action="" method="post" id="formId">
						<div class="modal-body" id='modalBody'>
							<div>
									<table class="table table-bordered border-secondary">
										<tr>
											<td>AIR_SCHE_CODE <input type="text" name="airScheCode" id="airScheCode"
												class="form-control" value="" readonly>
											</td>
											<td>PLANE_CODE <select name="planeCode" >
												<c:forEach items="${planeList}" var="plane">
													<option value="${plane.planeCode }">${plane.modelName }</option>
												</c:forEach>
											</select>
											</td>
											<td>GATE_NUM <input type="text" name="gateNum"
												class="form-control" value="">
											</td>
											<td>SPARE_SEAT <input type="text" name="spareSeat"
												class="form-control" value="" disabled>
												<!-- class="form-control" value="" readonly disabled> -->
											</td>
										</tr>
										<tr>
											<td>
											<input type="date" id="datepicker">
											<input type="date" name="departureDate1"
												id="departureDate1" class="form-control"
												value=""> <input type="time"
												name="departureDate2" id="departureDate2"
												class="form-control" value="">
												<input type="hidden" name="departureDate" id="departureDate"
												class="form-control" value=""></td>
											<td>TEAM_CODE 
											<br><select name="teamCode">
													<c:forEach items="${teamList }" var="team">
														<option value="${team }">${team }</option>
													</c:forEach>
											</select>
											</td>
											<td>BASE_PRICE <input type="text" name="basePrice"
												class="form-control" value="">
											</td>
												<!-- <td>SEAT_CLASS
													<br>
													<select name="seatClass">
														<option value="economy">economy</option>
														<option value="business">business</option>
													</select>
												</td> -->
											</tr>
											<tr>
											<%-- <td colspan="4">PATH_CODE <select name="pathCode">
											<c:forEach items="${pathList }" var="path">
											<option value="${path.pathCode }">${path.departurePortName }->${path.arrivalPortName }</option>
											</c:forEach>
											</select>
											</td> --%>
												<td>
												<select name="pathCode">
												<c:forEach items="${portList }" var="port">
												<option value="${portCode }" onclick="selectPath(${portCode});">
													${port.portName }
													</option>
												</c:forEach>
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
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript"
		src="/resources/admin/js/air_schedule_manage.js?ver=3"></script>
</body>
</html>