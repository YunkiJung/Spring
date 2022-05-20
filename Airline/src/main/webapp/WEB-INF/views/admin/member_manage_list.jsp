<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/admin/css/adminCommon.css" rel="stylesheet">
</head>
<body>
	<div class="row mainContainer" id="mainContainer">
		<div id="searchContainer" class="col-12">
			<form action="/admin/memberManage" method="get">
				<div class="input-group">
					<span class="input-group-text" id="basic-addon1">회원 아이디</span> 
					<input type="text" class="form-control" name="memId">
					<input type="submit" class="btn btn-danger btn-outline-secondary btnClass" value="검색">
				</div>
			</form>
		</div>
		<div id="listContainer" class="col-12">
			<table class="styled">
			<thead>
				<tr>
					<td>
						No.
					</td>
					<td>
						회원 아이디
					</td>
					<td>
						회원 이름
					</td>
				</tr>
				</thead>
					<c:forEach items="${memberList }" var="list">
						<tr onclick="selectMember('${list.memId}');" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
							<td>
							${list.rowNum }
							</td>
							
							<td>
								${list.memId }
							</td>
							
							<td>
								${list.memName }
							</td>
						</tr>
					</c:forEach>
			</table>
		</div>
		
		<div class="row" id="pagingContainer">
			<div class="col-12">
			<nav aria-label="...">
			  <ul class="pagination justify-content-center admin">
			    <li class="page-item <c:if test="${!searchVO.prev }">disabled</c:if>">
			      <a class="page-link" href="admin/memberManage?nowPage=${searchVO.beginPage - 1 }">Previous</a>
			    </li>
			    <c:forEach begin="${searchVO.beginPage }" end="${searchVO.endPage }" var="pageIndex">
				    <li class="page-item <c:if test="${searchVO.nowPage eq pageIndex }">active</c:if>"><a class="page-link" href="/admin/memberManage?nowPage=${pageIndex }">${pageIndex}</a></li>
			    </c:forEach>
			    <li class="page-item <c:if test="${!searchVO.next }">disabled</c:if>">
			      <a class="page-link" href="/admin/memberManage?=${searchVO.endPage + 1 }" >Next</a>
			    </li>
			  </ul>
			</nav>
			</div>
		</div>
		
		
		<div style="text-align: center;">
			
			<div id="modalDiv">
				<div class="modal fade" id="infoModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">회원 정보</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body" id='modalBody'>
				        <div>
							<form action="" method="post" id="formId">
							<table class="table table-bordered border-secondary">
							<tr>
							<td>
							MEM_ID
							<input type="text" name="memId" id="memId" class="form-control" value="" readonly>
							</td>
							<td>
							MEM_PW
							<input type="text" name="memPw" class="form-control" value="">
							</td>
							<td>
							MEM_NAME
							<input type="text" name="memName" class="form-control" value="">
							</td>
							<td>
							GENDER<br>
							<input type="radio" name="gender" id="male" value="MALE"> 남
							<input type="radio" name="gender" id="female" value="FEMALE"> 여
							</td>
							</tr>
							<tr>
							<td>
							<input type="text" id="memPhone1" value="" class="form-control"  maxlength="3">
							<input type="text" id="memPhone2" value="" class="form-control"  maxlength="4">
							<input type="text" id="memPhone3" value="" class="form-control"  maxlength="4">
							<input type="hidden" name="memPhone" id="memPhone">
							</td>
							<td>
							ADDR
							<input type="text" name="memAddr" class="form-control" value="">
							</td>
							<td>
							COUNTRY
							<select name="countryCode">
							<c:forEach items="${countryList }" var="country">
							<option value="${country.countryCode }">${country.countryName }</option>
							</c:forEach>
							</select>
							</td>
							<td>
							EMAIL
							<input type="email" name="memEmail" class="form-control" value="">
							</td>
							</tr>
							<tr>
							<td>
							BIRTH_DATE
							<input type="date" name="birthDate" class="form-control" value="">
							</td>
							<td>
							POINTS
							<input type="text" name="points" class="form-control" value="">
							</td>
							<td>
							EMP_CODE
							<input type="text" name="empCode" class="form-control" value="">
							</td>
							<td>
							IS_ADMIN
							<input type="text" name="isAdmin" class="form-control" value="">
							</td>
							</tr>
							</table>
							</form>
							</div>
				        
				      </div>
				      <div class="modal-footer" id="modalFooter">
				        <button type="button" class="btn btn-danger" onclick="deleteMember();">삭제</button>
				        <button type="button" class="btn btn-primary" onclick="updateMember();">수정</button>
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="/resources/admin/js/member_manage.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</body>
</html>