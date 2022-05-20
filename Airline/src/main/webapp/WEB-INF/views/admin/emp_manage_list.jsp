<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/admin/css/adminCommon.css" rel="stylesheet">
</head>
<body>
	<div class="row" id="mainContainer">
		<div class="col-12" id="searchContainer">
			<form action="/admin/empManage" method="get">
				<div class="input-group">
					<span class="input-group-text">직원 아이디</span>
					<input type="text" class="form-control" name="empId">
					<span class="input-group-text">직원 이름</span>
					<input type="text" class="form-control" name="empName">
					<span class="input-group-text">부서 코드</span>
					<input type="text" class="form-control" name="deptCode">
					<div><input type="submit" value="검색" class="btn btn-outline-secondary btn-danger btnClass" style="color: white;">
					</div>
				</div>
			</form>
		</div>
		<div class="col-12" id="listContainer">
			<table class="styled">
			<thead>
				<tr>
					<td>No.</td>

					<td>직원 아이디</td>

					<td>직원 이름</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${empList }" var="list">
					<tr onclick="selectEmp('${list.empCode}');" id="infoTr">
						<td>${list.empCode }</td>

						<td>${list.empId }</td>

						<td>${list.empName }</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
		<div class="row" id="pagingContainer">
				<div style="position:absolute; width: 10rem;">
					<input type="button" class="btn btn-danger btnClass" onclick="insertEmp();" value="직원 추가">
				</div>
			<div class="col-12" >
				<nav aria-label="...">
				  <ul class="pagination justify-content-center admin">
				    <li class="page-item <c:if test="${!searchVO.prev }">disabled</c:if>">
				      <a class="page-link" href="admin/empManage?nowPage=${searchVO.beginPage - 1 }">Previous</a>
				    </li>
				    <c:forEach begin="${searchVO.beginPage }" end="${searchVO.endPage }" var="pageIndex">
					    <li class="page-item <c:if test="${searchVO.nowPage eq pageIndex }">active</c:if>"><a class="page-link" href="/admin/empManage?nowPage=${pageIndex }">${pageIndex}</a></li>
				    </c:forEach>
				    <li class="page-item <c:if test="${!searchVO.next }">disabled</c:if>">
				      <a class="page-link" href="/admin/empManage?=${searchVO.endPage + 1 }" >Next</a>
				    </li>
				  </ul>
				</nav>
			</div>
		</div>

		<div>

			<div id="modalDiv">
				<div class="modal fade" id="infoModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">직원 정보</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body" id='modalBody'>
				        ...
				        
				        <div>
							<form action="" method="post" id="formId">
								<table class="table table-bordered border-secondary">
									<tr>
										<td>
											EMP_ID
											<input type="text" name="empId" id="empId" class="form-control" value="">
											<input type="hidden" name="empCode" id="empCode" value="">
										</td>
										<td>
											EMP_PW
											<input type="text" name="empPw" class="form-control" value="">
										</td>
										<td>
											EMP_NAME
											<input type="text" name="empName" id="empName" class="form-control" value="">
										</td>
										<td>
											GENDER
											<input type="radio" name="gender" value="MALE" checked> 남
											<input type="radio" name="gender" value="FEMALE"> 여
										</td>
									</tr>
									<tr>
										<td>
											PHONE
											<input type="text" id="empPhone1" value="" class="form-control"  maxlength="3">
											<input type="text" id="empPhone2" value="" class="form-control"  maxlength="4">
											<input type="text" id="empPhone3" value="" class="form-control"  maxlength="4">
											<input type="hidden" name="empPhone" id="empPhone">
										</td>
										<td>
											ADDR
											<input type="text" name="empAddr" class="form-control" value="">
										</td>
										<td>
											BIRTH_DATE
											<input type="date" name="birthDate" class="form-control" value="">
										</td>
										<td>
											HIRE_DATE
											<input type="date" name="hireDate" class="form-control" class="form-control" value="">
										</td>
									</tr>
									<tr>
										<td>
											DEPT_CODE
											<br>
											<select class="form-select" name="deptCode">
												<c:forEach items="${deptList }" var="dept">
													<option value="${dept }">${dept }</option>
												</c:forEach>
											</select>
										</td>
										<td>
											TEAM_CODE
											<br>
											<select class="form-select" name="teamCode">
												<c:forEach items="${teamList }" var="team">
													<option value="${team }">${team }</option>
												</c:forEach>
											</select>
										</td>
										<td>
											MANAGER_CODE
											<br>
											<select class="form-select" name="managerCode">
												<c:forEach items="${managerList }" var="manager">
													<option value="${manager }">${manager }</option>
												</c:forEach>
											</select>
										</td>
										<td>
											JOB_CODE
											<br>
											<select class="form-select" name="jobCode">
												<c:forEach items="${jobList }" var="job">
													<option value="${job }">${job }</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td>
											EMAIL
											<br>
											<input type="email" name="empEmail" class="form-control" value="">
										</td>
										<td>
											NATIONALITY
											<br>
											<select class="form-select" name="nationality">
											<c:forEach items="${countryList }" var="country">
												<option value="${country.countryCode }">${country.countryName }</option>
											</c:forEach>
											</select>
										</td>
										<td>
											IS_DOMESTIC
											<br>
											<select class="form-select" name="isDomestic">
												<option value='Y'>Y</option>
												<option value='N'>N</option>
											</select>
										</td>
										<td>
											IS_INTERNATIONAL
											<br>
											<select class="form-select" name="isInternational">
												<option value='Y'>Y</option>
												<option value='N'>N</option>
											</select>
										</td>
									</tr>
								</table>
							</form>
							</div>
				        
				      </div>
				      <div class="modal-footer" id="modalFooter">
				        <button type="button" class="btn btn-danger" onclick="deleteEmp();">삭제</button>
				        <button type="button" class="btn btn-primary" onclick="updateEmp();">수정</button>
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="/resources/admin/js/emp_manage.js?ver=20"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</body>
</html>