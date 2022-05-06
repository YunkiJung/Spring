<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div id="searchContainer" class="col-8">
		<form action="/admin/memberManage" method="get">
			<table class="table table-light">
				<tr>
					<td>
						회원 아이디 <input type="text" class="form-control" name="memId">
					</td>
					<td>
						<input type="submit" class="btn btn-primary" value="검색">
					</td>
				</tr>
				
			</table>
		</form>
		</div>
		
		<div id="listContainer" class="col-8">
			<table class="table table-light">
			<thead>
				<tr >
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
		
		<div class="row">
		
		<!-- <div class="col-1">
			<input type="button" class="btn btn-primary" value="회원 추가" onclick="insertMember();">
		</div> -->
		
			<div class="col" style="text-align: center;" >
			<nav aria-label="...">
			  <ul class="pagination">
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
		
		
		<div>
			
			<div id="modalDiv">
				<div class="modal fade" id="infoModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">회원 정보</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body" id='modalBody'>
				        ...
				        
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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript"
		src="/resources/admin/js/member_manage.js"></script>
</body>
</html>