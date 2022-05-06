<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/ticket/css/select_seat.css?ver=5">
<style>
	.card{
		position: fixed;
		top: 200px;
	}
	.gradationSeat{
	background: linear-gradient(to right, #dc3545, #0d6efd);
	color: white;
	}
	p {
	color: white;
	}
	
	.btnSelect{
		background-color: black;
	}
	
	.btnSelect:hover {
	background-color: white;
  	color: black;
	}
</style>
</head>


<div class="row justify-content-center selectContainer">
	<div class="col-4">
		<div class="plane">
		  <div class="cockpit">
		  <c:if test="${sessionScope.searchInfo.hasReturn eq 'Y' }">
			  <c:if test="${sessionScope.seatCountDown > sessionScope.searchInfo.count }">
			     <h1 class="card-title">${sessionScope.searchInfo.departurePortCode } 
			     <img src="/resources/ticket/img/image.png" width="70" height="50" style="margin-bottom: 2em;">
			      ${sessionScope.searchInfo.arrivalPortCode } </h1>
			  </c:if>
			  <c:if test="${sessionScope.seatCountDown <= sessionScope.searchInfo.count }">
			      <h1 class="card-title">${sessionScope.searchInfo.arrivalPortCode }
			     <img src="/resources/ticket/img/image.png" width="70" height="50" style="margin-bottom: 2em;">
			     ${sessionScope.searchInfo.departurePortCode }  </h1>
			  </c:if>
		  </c:if>
		  <c:if test="${sessionScope.searchInfo.hasReturn eq 'N' }">
		  	  <h1 class="card-title">${sessionScope.searchInfo.departurePortCode } 
		      <img src="/resources/ticket/img/image.png" width="70" height="50" style="margin-bottom: 2em;">
		      ${sessionScope.searchInfo.arrivalPortCode } </h1>
		  </c:if>
		  </div>
		  <!-- <div class="exit exit--front fuselage">
		    
		  </div> -->
		  <ol class="cabin fuselage" id="cabin">
		  	<div class="exit exit--front fuselage">
		    
		    </div>
		    <c:forEach var="rowNum" begin="1" end="${seatScreenInfo.maxRowNum }" step="1">
		    	<li class="row row--${rowNum }">
			      <ol class="seats" type="A">
			    	<c:forEach items="${seatScreenInfo.colCodeList }" var="colCode">
				        <li class="seat">
				          <input type="checkbox" value="${rowNum }${colCode}" id="${rowNum }${colCode}" class="seatInput"/>
				          <label for="${rowNum }${colCode}">${rowNum }${colCode }</label>
				        </li>
				    </c:forEach>
			      </ol>
			    </li>
			    <c:if test="${rowNum % 10 eq 0 }">
				    <div class="exit exit--back fuselage">
		    
		  			</div>
			    </c:if>
		    </c:forEach>
		  </ol>
		  <!-- <div class="exit exit--back fuselage">
		    
		  </div> -->
		</div>
		
	</div>
	<div class="col-1">
	</div>
	<div class="col-2">
		<div class="card gradationSeat" style="width: 18rem; color: white;">
		  <img src="/resources/ticket/img/airplane_logo.jpeg" class="card-img-top" alt="...">
		  <div class="card-body">
			  <c:if test="${sessionScope.searchInfo.hasReturn eq 'Y' }">
				  <c:choose>
				      <c:when test="${sessionScope.seatCountDown > sessionScope.searchInfo.count }">
					    <h5 class="card-title">${sessionScope.searchInfo.departurePortCode } - ${sessionScope.searchInfo.arrivalPortCode } </h5>
					     <p class="card-text" id="airScheCode">${sessionScope.departureAirScheCode }</p> 
				      </c:when>
				      <c:when test="${sessionScope.seatCountDown <= sessionScope.searchInfo.count }">
					    <h5 class="card-title">${sessionScope.searchInfo.arrivalPortCode } - ${sessionScope.searchInfo.departurePortCode } </h5>
					    <p class="card-text" id="airScheCode" >${sessionScope.returnAirScheCode }</p> 
				      </c:when>		
				  </c:choose>
			  </c:if>
			  <c:if test="${sessionScope.searchInfo.hasReturn eq 'N' }">
			  	<h5 class="card-title">${sessionScope.searchInfo.departurePortCode } - ${sessionScope.searchInfo.arrivalPortCode } </h5>
			    <p class="card-text" id="airScheCode">${sessionScope.departureAirScheCode }</p> 
			  </c:if>
			  </div>
		  <ul class="list-group list-group-flush">
		    <li class="list-group-item gradationSeat">SEAT : <span id="seatNumScreen"></span></li>
		  </ul>
		  <div class="card-body">
		    <button type="button" class="btn btn-danger btnSelect" id="confirmSeatBtn">Select</button>
		  </div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/resources/ticket/js/select_seat.js?ver=5"></script>
</body>
</html>