<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
ul li {
	list-style: none;
}

a {
	text-decoration: none;
	color: #333;
}

#menu {
	width: 90%;
	height: 3.5rem;
	background: white;
	color: black;
	line-height: 3.25em;
	margin: 0 auto;
	text-align: center;
}

#menu>ul>li {
	float: right;
	width: 5em;
	position: relative;
}

#menu>ul>li>ul {
	width: 12em;
	display: none;
	position: absolute;
	font-size: 14px;
	background: white;
	border: 1px solid #eeeeee;
}
#menu>ul>li>ul>li{
	text-align: center;
	border: 1px solid #eeeeee;
	border-collapse: collapse;
}

#menu>ul>li:hover>ul {
	display: block;
}

#menu>ul>li>ul>li:hover {
	background: grey;
	transition: ease 1s;
}
.forward {
 z-index: 100;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
	<div class="row">
		<div class="col-10 forward" id="menu">
				<ul>
					<li>
						<a href="#">
						<i class="bi bi-person-circle"></i> 
						${loginInfo.memName }</a>
						<ul>
							<li><i class="bi bi-person"></i><a href="/member/memberDetail"> profile </a></li>
							<li><i class="bi bi-wrench"></i><a href="/member/chPasswordPage"> setting </a></li>
							<li><i class="bi bi-power"></i><a href="/admin/adminLogout"> log out </a></li>
						</ul>
					</li>
					<li>
						<i class="bi bi-bell"></i> 
						<!-- <i class="bi bi-bell-fill"></i> -->
					</li>
					
					<li>
						<i class="bi bi-envelope"></i> 
						<!-- <i class="bi bi-envelope-exclamation"></i> -->
					</li>
				</ul>
		</div>
	</div>
</body>
</html>