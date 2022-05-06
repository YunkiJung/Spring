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

<div class="row justify-content-md-center">
	<div class="col-4">
		<h4>Order Number : ${orderCode }</h4>
		  <div class="row mb-3">
			  <div class="col-6">
				  <button type="button" class="btn btn-primary" onclick="location.href='/ticket/searchMyTicketForm';">Search My Ticket</button>
			  </div>
		  	  <div class="col-6">
				  <button type="button" class="btn btn-primary" onclick="location.href='/ticket/search';">Go to Main Page</button>
			  </div>
		  </div>
	</div>
</div>

<script src="/resources/ticket/js/confirm_order.js?ver=1"></script>
</body>
</html>