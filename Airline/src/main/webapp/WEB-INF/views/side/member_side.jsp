<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
element.style {
	font-size: 1.4em;
}
@font-face {
    font-family: 'GimpoGothicBold00';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2202-2@1.0/GimpoGothicBold00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.main-sidebar {
	font-family: 'GimpoGothicBold00';
}
</style>
</head>
<body>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary" style="height: 45em; width: 18em; margin-left: 5em; background-color: #251D3A; border-radius: 1em; box-shadow: 5px 5px 5px 5px gray; position: fixed; top:160px;">
  <!-- Brand Logo -->
  <div style="background-color: #5B7DB1; padding: 0.6em; border-top-left-radius: 1em; border-top-right-radius: 1em;">
  <a href="/ticket/search" class="brand-link">
    <img src="/resources/common/img/logo.png" class="brand-image img-circle elevation-3">
  </a>
  <a href="/ticket/search" style="font-size: 1.8em; color: black; margin-left: 0.4em; margin-top:0.9em; display: inline-block; font-weight: bold;">
    <span>KH AIRLINE</span>
  </a>
  </div>
  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav flex-column" data-widget="treeview" role="menu" style="text-align: center;">
        <!-- Add icons to the links using the .nav-icon class
             with font-awesome or any other icon font library -->
        <li>
            <c:forEach items="${memSideMenuList }" var="memSideMenu">
          		<a href="/member/${memSideMenu.sideMenuUri }?sideMenuCode=${memSideMenu.sideMenuCode}" style="font-size: 1.2em; color: white;" class="nav-link  <c:if test="${memSideMenu.sideMenuCode eq selectedSideMenu }">active</c:if>">
			  		 ${memSideMenu.sideMenuName }
         		 </a>
			 </c:forEach>
        </li>
      </ul>
    </nav>
  </div>
</aside>
</body>
</html>