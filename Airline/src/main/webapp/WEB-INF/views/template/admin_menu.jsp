<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="/resources/admin/css/admin_menu.css" rel="stylesheet">
</head>
<body>
	<div class="row">
		<div class="col-10 forward" id="menu">
			<ul>
				<li><i class="bi bi-person-circle"></i>
						<a href="#"> ${loginInfo.memName }
				</a>
					<ul>
						<li><i class="bi bi-person"></i><a
							href="/member/memberDetail"> profile </a></li>
						<li><i class="bi bi-wrench"></i><a
							href="/member/chPasswordPage"> setting </a></li>
						<li><i class="bi bi-power"></i><a href="/admin/adminLogout">
								log out </a></li>
					</ul></li>
				<!-- <li><i class="bi bi-bell"></i></li>

				<li><i class="bi bi-envelope"></i></li> -->
			</ul>
		</div>
	</div>
</body>
</html>