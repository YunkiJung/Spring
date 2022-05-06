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
		<div class="col-8" id="searchContainer">
			<form action="/admin/passengerManage" method="get">
				<table class="table table-light">
					<tr>
						<td>예매 코드 <input type="text" class="form-control"
							name="passScheCode">
						</td>
						<td>비회원 코드 <input type="text" class="form-control"
							name="passName">
						</td>
						<td>회원 아이디 <input type="text" class="form-control"
							name="memId">
						</td>
						<td><input type="submit" class="btn btn-primary" value="검색">
						</td>
					</tr>

				</table>
			</form>
		</div>

		<div class="col-8" id="listContainer">
			<table class="table table-light">
				<thead>
					<tr>
						<td>PassCode</td>

						<td>PassName</td>

						<td>MemId</td>

					</tr>
				</thead>
				<c:forEach items="${passList }" var="list">
					<tr onclick="selectPass('${list.passScheCode}');" id="infoTr">
						<td>${list.passScheCode }</td>

						<td>${list.passName }</td>

						<td><c:choose>
								<c:when test="${not empty list.memId }">
							${list.memId }
						</c:when>
								<c:otherwise>
							비회원 입니다.
						</c:otherwise>
							</c:choose></td>

					</tr>
				</c:forEach>
			</table>
		</div>

		<div>
			<div class="row">
				<!-- <div class="col-3">
					<input type="button" class="btn btn-primary"
						onclick="insertPass();" value="예매 내역 추가">
				</div> -->
				<div class="col-5">
					<nav aria-label="...">
						<ul class="pagination">
							<li
								class="page-item <c:if test="${!searchVO.prev }">disabled</c:if>">
								<a class="page-link"
								href="admin/passengerManage?nowPage=${searchVO.beginPage - 1 }">Previous</a>
							</li>
							<c:forEach begin="${searchVO.beginPage }"
								end="${searchVO.endPage }" var="pageIndex">
								<li
									class="page-item <c:if test="${searchVO.nowPage eq pageIndex }">active</c:if>"><a
									class="page-link"
									href="/admin/passengerManage?nowPage=${pageIndex }">${pageIndex}</a></li>
							</c:forEach>
							<li
								class="page-item <c:if test="${!searchVO.next }">disabled</c:if>">
								<a class="page-link"
								href="/admin/passengerManage?=${searchVO.endPage + 1 }">Next</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>

			<div>

				<div id="modalDiv">
					<div class="modal fade" id="infoModal" data-bs-backdrop="static"
						data-bs-keyboard="false" tabindex="-1"
						aria-labelledby="staticBackdropLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel">예매 정보</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body" id='modalBody'>
									...

									<div>
										<form action="" method="get" id="formId">
											<table class="table table-bordered border-secondary">
												<tr>
													<td>PASS_SCHEDULE_CODE <input type="text"
														name="passScheCode" id="passScheCode" class="form-control"
														value="">
													</td>
													<td>PASS_NAME <input type="text" name="passName"
														id="passName" class="form-control" value="">
													</td>
													<td>MEM_ID <input type="text" name="memId" id="memId"
														class="form-control" value="">
													</td>
													<td>GENDER <br> <input type="radio" name="gender"
														id="male" value="MALE"> 남 <input type="radio"
														name="gender" id="female" value="FEMALE"> 여
													</td>
													<td>BIRTH_DATE <input type="date" name="birthDate"
														class="form-control" value="">
													</td>
												</tr>
												<tr>
													<td>COUNTRY <select class="form-select"
														name="countryCode">
															<c:forEach items="${countryList }" var="country">
																<option value="${country.countryCode }">${country.countryName }</option>
															</c:forEach>
													</select>
													</td>
													<td>EMAIL <input type="email" name="passEmail"
														class="form-control" value="">
													</td>
													<td>PHONE <input type="text" id="passPhone1" value=""
														class="form-control" maxlength="3"> <input
														type="text" id="passPhone2" value="" class="form-control"
														maxlength="4"> <input type="text" id="passPhone3"
														value="" class="form-control" maxlength="4"> <input
														type="hidden" name="passPhone" id="passPhone">
													</td>
													<td>ADDR <input type="text" name="passAddr"
														class="form-control" value="">
													</td>
													<td>AIR_SCHEDULE_CODE <input type="text"
														name="airScheCode" class="form-control" value="">
													</td>
												</tr>
												<tr>
													<td>SEAT_CODE <input type="text" name="seatCode"
														class="form-control" value="">
													</td>
													<td>TICKET_PRICE <input type="text" name="ticketPrice"
														class="form-control" value="">
													</td>
													<td>ORDER_CODE <input type="text" name="orderCode"
														class="form-control" value="">
													</td>
													<td>ORDER_DATE <input type="date" name="orderDate"
														class="form-control" value="">
													</td>
												</tr>
											</table>
										</form>
									</div>

								</div>
								<div class="modal-footer" id="modalFooter">
									<button type="button" class="btn btn-danger"
										onclick="deletePass();">삭제</button>
									<button type="button" class="btn btn-primary"
										onclick="updatePass();">수정</button>
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="/resources/admin/js/pass_manage.js"></script>
</body>
</html>