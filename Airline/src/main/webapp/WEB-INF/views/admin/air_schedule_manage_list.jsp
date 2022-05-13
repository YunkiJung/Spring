<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    
    <!-- <link  href="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment-with-locales.min.js" rel="noopener">
	<link  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" title="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" rel="noopener">
    <link  href="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" title="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" rel="noopener">
    <link  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" title="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" rel="noopener">
    <link  href="https://rawgit.com/tempusdominus/bootstrap-4/master/build/js/tempusdominus-bootstrap-4.js" title="https://rawgit.com/tempusdominus/bootstrap-4/master/build/js/tempusdominus-bootstrap-4.js" rel="noopener">
    <link  href="https://rawgit.com/tempusdominus/bootstrap-4/master/build/css/tempusdominus-bootstrap-4.css" title="https://rawgit.com/tempusdominus/bootstrap-4/master/build/css/tempusdominus-bootstrap-4.css" rel="noopener">
    <link  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" title="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="noopener"> -->
    
    <!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
    rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/gh/Eonasdan/tempus-dominus@master/dist/css/tempus-dominus.css"
          rel="stylesheet" crossorigin="anonymous"> -->
              <!-- Popperjs -->
<!-- Popperjs -->
<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script> -->
<!-- Tempus Dominus JavaScript -->
<!-- <script src="https://cdn.jsdelivr.net/gh/Eonasdan/tempus-dominus@v6-alpha1.0.4/dist/js/tempus-dominus.js" crossorigin="anonymous"></script> -->

<!-- Tempus Dominus Styles -->
<!-- <link href="https://cdn.jsdelivr.net/gh/Eonasdan/tempus-dominus@v6-alpha1.0.4/dist/css/tempus-dominus.css" rel="stylesheet" crossorigin="anonymous"> -->
</head>
<body>

	<div class="row">
		<div class="col-8" id="searchContainer" style="text-align: center;">
			<form action="/admin/airScheList" method="get">
				<h2>
				현재 항공기 코드 : ${searchVO.planeCode }
				</h2>
				<input type="hidden" name="planeCode" value="${searchVO.planeCode }">
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
					
						<td>운항 경로</td>

						<td>출발일</td>
						
						<td>도착일</td>

						<td>남은 좌석</td>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${airScheduleList }" var="list">
					<%-- <tr onclick="selectAirSche('${list.airScheCode}','${list.planeCode}', '${list.arrivalPortCode }');"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop"> --%>
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

			<div class="row d-flex align-self-center">
				<div class="col-1">
					<input type="button" class="btn btn-primary" value="추가"
						onclick="insertAirSche('${searchVO.planeCode}');">
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
												
												<!-- <div class="container">
												  <div class="row">
												    <div class="col-sm-6">
												      <div class="form-group">
												        <div class="input-group date">
												          <input id="datetimepicker1" type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" data-toggle="datetimepicker"/>
												        </div>
												      </div>
												    </div>
												  </div>
												</div> -->
												
												<!-- <div
												     class='input-group'
												     id='datetimepicker1'
												     data-td-target-input='nearest'
												     data-td-target-toggle='nearest'
												 >
												   <input
												     id='datetimepicker1Input'
												     type='text'
												     class='form-control'
												     data-td-target='#datetimepicker1'
												   />
												   <span
												     class='input-group-text'
												     data-td-target='#datetimepicker1'
												     data-td-toggle='datetimepicker'
												   >
												     <span class='fas fa-calendar'></span>
												   </span>
												 </div> -->
												
												
												<!-- <div
												     class='input-group'
												     id='datetimepicker1'
												     data-td-target-input='nearest'
												     data-td-target-toggle='nearest'
												 >
												   <input
												     id='datetimepicker1Input'
												     type='text'
												     class='form-control'
												     data-td-target='#datetimepicker1'
												   />
												   <span
												     class='input-group-text'
												     data-td-target='#datetimepicker1'
												     data-td-toggle='datetimepicker'
												   >
												     <span class='fa-solid fa-calendar'></span>
												   </span>
												 </div> -->
												
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
											 <!-- <select name="pathCode"> -->
											<%-- <c:forEach items="${pathList }" var="path">
											<option value="${path.pathCode }">${path.departurePortName }->${path.arrivalPortName }</option>
											</c:forEach>
											</select> --%>
											출발
											<input type="text" value="" name="departurePortCode" readonly>
											<%-- <c:forEach items="${pathList }" var="port">
											<option value="${port.departurePortCode}"></option>
											</c:forEach> --%>
											
											도착
											<select name="arrivalPortCode">
											<%-- <c:forEach items="${pathList }" var="port">
											<option value="${port.arrivalPortCode}"></option>
											</c:forEach> --%>
											</select>
											</td>
												<%-- <td>
												<select name="pathCode" id="pathCode">
												<c:forEach items="${portList }" var="port">
												<option value="${port.portCode }" onchange="selectPath();">
													${port.portName }
													</option>
												</c:forEach>
												</select>
												</td> --%>
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
    
    
    

    
<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.2/dist/umd/popper.min.js"
          crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/gh/Eonasdan/tempus-dominus@master/dist/js/tempus-dominus.js"
          crossorigin="anonymous"></script> -->
          <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script> -->
	<script type="text/javascript" src="/resources/admin/js/air_schedule_manage.js?ver=18"></script>
</body>
</html>