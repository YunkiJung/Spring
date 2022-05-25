<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#mainContainer>div {
	padding: 1rem;
	background-color: white;
}
#mainContainer{
	margin-top: 25px;
}
.btn{
	width: 20%;
	line-height: 1;
}
.selectorDiv{
	margin: 0 auto;
	vertical-align: middle;
	margin-top: 20px;

}
#total, #totalH{
	font-weight: bold;
}
.yearTag {
	font-weight: bold; 
	font-size: 2em;
	 padding-bottom: 0;
}
.aaa {
	margin-top: 10px;
}
table{
	border: 1px solid black;
	border-collapse: collapse;
	width: 50%;
}
table thead tr{
	background-color: #dc3545;
	border: 1px solid black;
	padding: 0.5rem;
}
table tbody td{
	background-color: #f9fafb;
	color: #666666;
	padding: 0.5rem;
}
tr, td{
	border: 1px solid #c9cacb;
}
.saleList{
	width: 100%;
	height: 102%;
	margin: 0 auto;
}
</style>
</head>
<body>
<input type="hidden" value="${year }" id="current-year">
	<div class="row justify-content-md-center selectorDiv">
		<div class="col-4 aaa">
			<span id="year" class="yearTag">
				${year }
			</span>
			<span class="yearTag">
				YEAR
			</span>
		</div>
		<div class="col-3" style="text-align: center; margin-top: 10px;">
			<h2 id="totalH">$<span id="total"></span></h2>
		</div>
		<div class="col-4" style="text-align: center; padding-top: 1.5em;">
			<input type="button" class="btn btn-danger" value="이전" id="prev">
			<input type="button" class="btn btn-danger" value="다음" id="next" disabled>	
		</div>
	</div>
	<div class="row justify-content-md-center" id="mainContainer">
		<div class="col-9" style="background-color: #f9fafb;">
			<canvas id="myChart"></canvas>
		
	</div>
		<div class="col-2">
		<table class="list saleList">
			<colgroup>
				<col width="50%">
				<col width="*">
			</colgroup>
			<thead>
				<tr>
					<th>월</th>
					<th>매출</th>
				</tr>
			</thead>
			<tbody id="list">
				<tr>
					<td>1</td>
					<td class="monthly">0</td>
				</tr>
				<tr>
					<td>2</td>
					<td class="monthly">0</td>
				</tr>
				<tr>
					<td>3</td>
					<td class="monthly">0</td>
				</tr>
				<tr>
					<td>4</td>
					<td class="monthly">0</td>
				</tr>
				<tr>
					<td>5</td>
					<td class="monthly">0</td>
				</tr>
				<tr>
					<td>6</td>
					<td class="monthly">0</td>
				</tr>
				<tr>
					<td>7</td>
					<td class="monthly">0</td>
				</tr>
				<tr>
					<td>8</td>
					<td class="monthly">0</td>
				</tr>
				<tr>
					<td>9</td>
					<td class="monthly">0</td>
				</tr>
				<tr>
					<td>10</td>
					<td class="monthly">0</td>
				</tr>
				<tr>
					<td>11</td>
					<td class="monthly">0</td>
				</tr>
				<tr>
					<td>12</td>
					<td class="monthly">0</td>
				</tr>
			</tbody>
		</table>
		</div>
		</div>
<script type="text/javascript" src="/resources/admin/js/sales.js?ver=21"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>			
</body>
</html>
