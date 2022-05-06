<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/ticket/css/search_ticket_list.css?ver=5">
<style type="text/css">
</style>
</head>
<body>
<div class="container">
<c:forEach items="${ticketInfoList }" var="ticketInfo">
	  <div class="ticket">
		<div id="banner">
			<div id="topbanner"></div>
			<span id="mainbanner">
				<img src="https://lukw4l.de/utils/media/assets/flightticket/plane_logo.png">
				KH Airlines
			</span>
			<span id="tearoffbanner">
				<img src="https://lukw4l.de/utils/media/assets/flightticket/plane_logo.png">
				KH Airlines
			</span>
		</div>
		<div id="barcode">
			XYZASDASDXYZ
		</div>
		<div id="data">
			<div id="maindata">
				<div class="box">
					<span class="header">
						Passenger Name
					</span>
					<span class="body">
						${ticketInfo.passName }
					</span>
				</div>
				<div class="box">
					<span class="header">
						Flight Number
					</span>
					<span class="body">
						${ticketInfo.passScheCode }
					</span>
				</div>
				<div class="box">
					<span class="header">
						From
					</span>
					<span class="body">
						${ticketInfo.airScheduleVO.departurePortCode } (${ticketInfo.airScheduleVO.dcountryName })
					</span>
				</div>
				<div class="box">
					<span class="header">
						Date
					</span>
					<span class="body">
						${ticketInfo.airScheduleVO.departureDate }
					</span>
				</div>
				<div class="box">
					<span class="header">
						To
					</span>
					<span class="body">
						${ticketInfo.airScheduleVO.arrivalPortCode } (${ticketInfo.airScheduleVO.acountryName })
					</span>
				</div>
				<div class="box">
				</div>
				<div class="box">
					<span class="header">
						Gate
					</span>
					<span class="body">
						${ticketInfo.airScheduleVO.gateNum }
					</span>
				</div>
				<div class="box boarding">
					<span class="header">
						Boarding Time
					</span>
					<span class="body">
						${ticketInfo.airScheduleVO.boardingDate }
					</span>
				</div>
	
				<div id="tearoffdata">
					<div class="box">
						<span class="header">
							Passenger Name
						</span>
						<span class="body">
							${ticketInfo.passName }
						</span>
					</div>
					<div class="box">
						<span class="header">
							Flight Number
						</span>
						<span class="body">
							${ticketInfo.passScheCode }
						</span>
					</div>
					<div class="box">
						<span class="header">
							Date
						</span>
						<span class="body">
							${ticketInfo.airScheduleVO.departureDate }
						</span>
					</div>
					<div class="box">
						<span class="header">
							Gate
						</span>
						<span class="body">
							${ticketInfo.airScheduleVO.gateNum }
						</span>
					</div>
					<div class="box seat">
						<span class="header">
							Seat
						</span>
						<span class="body">
							<b>${ticketInfo.seatCode }</b>
						</span>
					</div>
				</div>
			</div>
	
			<div id="holes">
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
			</div>
		</div>
	
		<!--
		<p>BWI</p>
		<p>SAN</p>
		<p>Gate: B3</p>
		<p>Flight: 2005</p>
		<p>Boards: 10:25 a.m.</p>
		<p>Arrives: 1:05 p.m.</p>
		<p>Seat: 11E</p>
		<p>Group: 3</p>-->
	</div>	
</c:forEach>
</div>
</body>
</html>