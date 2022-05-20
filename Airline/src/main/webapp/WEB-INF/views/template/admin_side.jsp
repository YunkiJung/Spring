<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="/resources/admin/css/admin_side_menu.css" rel="stylesheet">
</head>
<body>
<div class="sideMenuContainer">
	<ul id="sideMenu">
		<li onclick="location.href='/ticket/search';" style="background-color: #5b7db1; vertical-align: middle; margin: 0 auto !important; text-align: center;">
		<img alt="logo" src="/resources/common/img/logo.png"> <span id="mainSpan">KH AIRLINE</span>
			<!-- <i class="bi bi-house" id="icon"></i> <span id="MainSpan">MainPage</span> -->
		</li>
		<c:forEach items="${menuList }" var="list" varStatus="status">
		<li onclick="location.href='/admin/${list.menuSrc }?adminMenuCode=${list.menuCode }';" <c:if test="${list.menuCode eq sessionScope.adminMenuCode }">style="background-color:#ee5057;"</c:if>>
		<c:choose>
			<c:when test="${status.index eq 0 }">
			<i class="bi bi-currency-exchange" id="icon" style="color:#fae100;" ></i> <a>${list.menuName }</a>
			</c:when>
			<c:when test="${status.index eq 1 }">
			<i class="bi bi-person-fill" id="icon" style="color: #8596f3;"></i> <a>${list.menuName }</a>
			</c:when>
			<c:when test="${status.index eq 2 }">
			<i class="bi bi-person-badge-fill" id="icon" style="color: #2c3e50;"> </i><a>${list.menuName }</a>
			</c:when>
			<c:when test="${status.index eq 3 }">
			<i class="bi bi-ticket-detailed" id="icon" style="color: #ff5722;"></i> <a>${list.menuName }</a>
			</c:when>
			<c:when test="${status.index eq 4 }">
			<i class="bi bi-calendar-range-fill" id="icon" style="color: #a45548;"></i> <a>${list.menuName }</a>
			</c:when>
		</c:choose>
		</li>
		</c:forEach>
	</ul>
</div>
</body>
</html>