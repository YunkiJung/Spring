<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#menuTd {
	color: black;
	font-size: 0.85rem;
}
#icon{
	font-size: 1.25rem;
}
#sideMenu{
position: fixed;
text-align:left; 
margin: 0 auto;
width: 17.5%;
}
#sideMenu > tr{
	height: 2.5rem;
}
.container{
	
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
<div class="row container" style="background-color: #ee5057;">
	<div class="col" id="sideMenu">
		<table class="table table-bordered border-light">
			<tr onclick="location.href='/admin/mainPage';">
				<td>
					<a><i class="bi bi-house" id="icon"></i> MainPage</a>
				</td>
			</tr>
					<c:forEach items="${menuList }" var="list">
						<c:choose>
							<c:when test="${list.menuSrc eq 'memberManage'}">
							<tr onclick="location.href='/admin/${list.menuSrc }';" >
								<td>
								<i class="bi bi-person-fill" id="icon" style="color: #8596f3;">
								</i>
									<a id="menuTd">${list.menuName }</a>
								</td>
							</tr>
							</c:when>
							
							<c:when test="${list.menuSrc eq 'empManage'}">
							<tr onclick="location.href='/admin/${list.menuSrc }';" >
								<td>
								<i class="bi bi-person-badge-fill" id="icon" style="color: #2c3e50;">
								</i>
									<a id="menuTd">${list.menuName }</a>
								</td>
							</tr>
							</c:when>
							
							<c:when test="${list.menuSrc eq 'passengerManage'}">
							<tr onclick="location.href='/admin/${list.menuSrc }';" >
								<td>
								<i class="bi bi-ticket-detailed" id="icon" style="color: #ff5722;"></i>
									<a id="menuTd">${list.menuName }</a>
								</td>
							</tr>
							</c:when>
							
							<c:when test="${list.menuSrc eq 'airScheManage'}">
							<tr onclick="location.href='/admin/${list.menuSrc }';" >
								<td >
								<i class="bi bi-calendar-range-fill" id="icon" style="color: #a45548;"></i>
									<a id="menuTd">${list.menuName }</a>
								</td>
							</tr>
							</c:when>
							
							<c:when test="${list.menuSrc eq 'home'}">
							<tr onclick="location.href='/admin/${list.menuSrc }';" >
								<td>
								<i class="bi bi-door-open-fill" id="icon" style="color:#76828e;" ></i>
									<a id="menuTd">${list.menuName }</a>
								</td>
							</tr>
							</c:when>

							<c:otherwise>
							<tr onclick="location.href='/admin/${list.menuSrc }';" >
								<td><a id="menuTd">${list.menuName }</a></td>
							</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
		</table>
	</div>
</div>
</body>
</html>