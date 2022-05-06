<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
</head>
<body>
<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-light navbar-white" style="height: 6em; ">
  <div class="container">
    <a href="/ticket/search" class="navbar-brand">
      <img src="/resources/common/img/logo.png" class="brand-image img-circle elevation-3">
      <span class="brand-text">KH AirLine</span>
    </a>
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item d-none d-sm-inline-block">
      	 <c:forEach items="${mainMenuList }" var="mainMenu">
            <li class="nav-item">
              <a class="nav-link" href="/common/${mainMenu.menuUri }">${mainMenu.menuName }</a>
            </li>
          </c:forEach>
      </li>
    </ul>
    <!-- SEARCH FORM -->
    <form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-dark" type="submit">검색</button>
        </div>
      </div>
    </form>
     <div>
        <c:choose>
        	<c:when test="${not empty sessionScope.loginInfo }">
           		<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
					  <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" viewBox="0 0 16 16">
					  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
					  </svg>
					 </button>
					 <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
					   <li><a class="dropdown-item" href="/member/memberDetail?memId=${sessionScope.loginInfo.memId }">프로필</a></li>
					    <li><a class="dropdown-item" href="/member/chPasswordPage">비밀번호 변경</a></li>
					    <li><a class="dropdown-item" href="/member/logout">Logout</a></li>
					    <li><a class="dropdown-item" href="/admin/mainPage">관리자 메뉴</a></li>
					 </ul>
				</div>
           	</c:when>
				<c:otherwise>
                   		<span class="loginSpan" data-bs-target="#loginModal" data-bs-toggle="modal">Login</span>
						<span class="loginSpan" data-bs-target="#joinModal" data-bs-toggle="modal" onclick="selectCountry();">Join</span>
				</c:otherwise>
        </c:choose>
        </div>                      
   </div> 
</nav>
<!-- /.navbar -->
</body>
</html>