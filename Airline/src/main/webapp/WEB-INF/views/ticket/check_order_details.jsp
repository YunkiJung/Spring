<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/ticket/css/check_order_details.css?ver=4">
<style>
input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
}

.list-group-item {
	font-size: 18px;
}

.card-text {
	font-size: 22px;
	color: black;
}

.card {
	border-top: none;
	margin-bottom: 20px;
}

.card-body {
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}

.list-group, .list-group-flush {
	border-right: 0.5px solid grey;
	border-left: 0.5px solid grey;
	border-bottom: 0.5px solid grey;
	border-bottom-left-radius: 1px;
	border-bottom-right-radius: 1px;
}

#points {
	color: red;
}

.check-card-body {
	background: linear-gradient(to right, #dc3545, #0d6efd);
}

.check-card-title {
	color: white;
}

.btn-primary {
	height: 0.5em;
	width: 0.5em;
	padding-bottom: 2.5em;
	padding-right: 4em;
}
</style>
</head>
<body>


<div class="row justify-content-center" style="margin-top: 6em;">
	<div class="col-4" style="border: none;">
		<c:forEach items="${sessionScope.passengerScheduleList }" var="passengerInfo" varStatus="status">
			<c:if test="${status.index < sessionScope.searchInfo.count }">
				<div class="card" style="width: 29rem; border: none; box-shadow: 0px 15px 50px 10px rgb(0 0 0 / 20%); ">
				  <div class="card-body check-card-body" style="border: none;">
				    <h4 class="card-title check-card-title">NO.${status.count } PASSENGER</h4>
				    <p class="card-text check-card-title">${passengerInfo.passName }</p>
				  </div>
				  <div style="display: flex; margin-left: 0; width: 29rem; border: none;" class="row">
				  <div class="col-6" style="width: 50%; border: none;">
				  <ul class="list-group list-group-flush" style=" border: none;">
				    <li class="list-group-item">GENDER :</li>
				    <li class="list-group-item">BOD :</li>
				    <li class="list-group-item">NATIONALITY :</li>
				    <li class="list-group-item">PASSPORT.NO :</li>
				    <li class="list-group-item">EMAIL :</li>
				    <li class="list-group-item">PHONE :</li>
				    <li class="list-group-item">ADDRESS :</li>
				  </ul>
				  </div>
				  <div class="col-6" style="width: 50%; border: none; ">
				  <ul class="list-group" style="border: none;">
				    <li class="list-group-item" style="border: none;">${passengerInfo.gender }</li>
				    <li class="list-group-item" style="border: none;">${passengerInfo.birthDate }</li>
				    <li class="list-group-item" style="border: none;">${passengerInfo.countryCode }</li>
				    <li class="list-group-item" style="border: none;">${passengerInfo.passportNum }</li>
				    <li class="list-group-item" style="border: none;">${passengerInfo.passEmail }</li>
				    <li class="list-group-item" style="border: none;">${passengerInfo.passPhone }</li>
				    <li class="list-group-item" style="border: none;">${passengerInfo.passAddr }</li>
				  </ul>
				  </div>
				  </div>
				</div>
			</c:if>	
		</c:forEach>
	</div>
	<div class="col-4">
		<div class='container'>
		  <div class='window'>
		    <div class='order-info'>
		      <div class='order-info-content'>
		        <h2>Order Summary</h2>
		                <div class='line'></div>
			        <table class='order-table'>
			          <tbody>
			            <tr>
			              <!-- <td><img src='https://dl.dropboxusercontent.com/s/sim84r2xfedj99n/%24_32.JPG' class='full-width'></img>
			              </td> -->
			              <td>
			                <span class='thin'>${sessionScope.passengerScheduleList[0].airScheCode }</span>
			                <br> <br> <span class='thin small'>X ${sessionScope.searchInfo.count }<br><br></span>
			              </td>
						
			            </tr>
			            <tr>
			              <td>
			                <div class='price'>$${sessionScope.passengerScheduleList[0].ticketPrice  * sessionScope.searchInfo.count}</div>
			              </td>
			            </tr>
			          </tbody>
			        </table>
			        
			        <div class='line'></div>
			        
			        <c:if test="${sessionScope.searchInfo.hasReturn eq 'Y' }">
			        	<table class='order-table'>
				          <tbody>
				            <tr>
				              <!-- <td><img src='https://dl.dropboxusercontent.com/s/sim84r2xfedj99n/%24_32.JPG' class='full-width'></img>
				              </td> -->
				              <td>
				                <span class='thin'>${sessionScope.passengerScheduleList[sessionScope.searchInfo.count].airScheCode }</span>
				                <br> <br> <span class='thin small'>X ${sessionScope.searchInfo.count }<br><br></span>
				              </td>
							
				            </tr>
				            <tr>
				              <td>
				                <div class='price'>$${sessionScope.passengerScheduleList[sessionScope.searchInfo.count].ticketPrice * sessionScope.searchInfo.count}</div>
				              </td>
				            </tr>
				          </tbody>
				        </table>
				        <div class='line'></div>
			        </c:if>
			        
			        
			        <c:if test="${not empty sessionScope.loginInfo }">
			        	<table class='order-table'>
				          <tbody>
				            <tr>
				              <!-- <td><img src='https://dl.dropboxusercontent.com/s/sim84r2xfedj99n/%24_32.JPG' class='full-width'></img>
				              </td> -->
				              <td>
				                <br> <span class='thin'>My Points</span>
				                <br> <br> 
				              </td>
							
				            </tr>
				            <tr>
				              <td>
				                <div>
				                	<span id="points" class="price"></span>
				                	<input type="hidden" id="origin-points">
				                </div>
				              </td>
				            </tr>
				            
				          </tbody>
				        </table>
				        <div class='line'></div>
			        </c:if>
			        
			        <c:if test="${not empty sessionScope.loginInfo }">
			        	<table class='order-table'>
				          <tbody>
				            <tr>
				              <td>
				                <div>
				                	<input type="number" id="use-points" value="0" style="border-radius: 1em; text-align: right; ">
				                </div>
				              </td>
				            </tr>
				            
				            <tr>
				              <td>
				                <div>
				                	<input type="button" class="btn btn-primary" id="pointsBtn" value="use" >
				                	<input type="button" class="btn btn-primary" id="resetPointsBtn" value="reset" style="padding-right: 5em;">
				                </div>
				              </td>
				            </tr>
				            
				          </tbody>
				        </table>
				        <div class='line'></div>
			        </c:if>
			        
		        <div class='total'>
		          <span style='float:left;'>
		            <div class='thin dense'>VAT 19%</div>
		            TOTAL
		          </span>
		          <span style='float:right; text-align:right;'>
		            <div class='thin dense'>$<span id="tax">0</span></div>
		            <c:choose>
		            	<c:when test="${sessionScope.searchInfo.hasReturn eq 'Y' }">
		            		$<span id="totalPrice">
		            			${sessionScope.passengerScheduleList[0].ticketPrice * sessionScope.searchInfo.count + sessionScope.passengerScheduleList[sessionScope.searchInfo.count].ticketPrice * sessionScope.searchInfo.count}
		            		</span>	
	            			<input type="hidden" id="origin-totalPrice" value="${sessionScope.passengerScheduleList[0].ticketPrice * sessionScope.searchInfo.count + sessionScope.passengerScheduleList[sessionScope.searchInfo.count].ticketPrice * sessionScope.searchInfo.count}">
		            	</c:when>
		            	<c:otherwise>
		            		$<span id="totalPrice">
		            			${sessionScope.passengerScheduleList[0].ticketPrice * sessionScope.searchInfo.count }
	            			</span>
            				<input type="hidden" id="origin-totalPrice" value="${sessionScope.passengerScheduleList[0].ticketPrice * sessionScope.searchInfo.count }">
		            	</c:otherwise>
		            </c:choose>
		          </span>
		        </div>
		</div>
		</div>
		        <div class='credit-info'>
		          <div class='credit-info-content'>
		            <table class='half-input-table'>
		              <tr><td>Please select your card: </td><td><div class='dropdown' id='card-dropdown'><div class='dropdown-btn' id='current-card'>Visa</div>
		                <div class='dropdown-select'>
		                <ul>
		                  <li>Master Card</li>
		                  <li>American Express</li>
		                  </ul></div>
		                </div>
		               </td></tr>
		            </table>
		            <img src='https://dl.dropboxusercontent.com/s/ubamyu6mzov5c80/visa_logo%20%281%29.png' height='80' class='credit-card-image' id='credit-card-image'></img>
		            Card Number
		            <input class='input-field'></input>
		            Card Holder
		            <input class='input-field'></input>
		            <table class='half-input-table'>
		              <tr>
		                <td> Expires
		                  <input class='input-field'></input>
		                </td>
		                <td>CVC
		                  <input class='input-field'></input>
		                </td>
		              </tr>
		            </table>
		            <button class='pay-btn' id="checkout-btn">Checkout</button>
		
		          </div>
		
		        </div>
		      </div>
		    </div>
	</div>
</div>


<script src="/resources/ticket/js/check_order_details.js?ver=1"></script>
</body>
</html>