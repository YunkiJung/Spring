<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container>div {
	padding: 1rem;
	background-color: white;
}
</style>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<div class="row" id="container">
		<div class="col" style="background-color: #f9fafb;">
			
			<div class="col-2">
				<i class="bi bi-graph-down"></i>
			</div>
				
			
			<div class="col-2">
				<i class="bi bi-graph-up"></i>
			</div>
				
			
			<div class="col-2">
			
			</div>
				
			
			<div class="col-2">
			
			</div>
				
			<div class="row">
				<div class="col-6">
				
			<canvas id="myChart"></canvas>
			<script>
			  const labels = [
			    'January',
			    'February',
			    'March',
			    'April',
			    'May',
			    'June',
			    'July',
			    'August',
			    'September',
			    'October',
			    'November',
			    'December'
			  ];
			  
			  
			  $.ajax({
				   url: '/admin/salesSumForYear', //요청경로
				    type: 'post',
				    data:{}, //필요한 데이터 '데이터이름':값
				    success: function(result) {
				      //ajax 실행 성공 후 실행할 코드 작성
				      alert('성공');
				      
				      
				    },
				    error: function(){
				      //ajax 실행 실패 시 실행되는 구간
				       alert('실패');
				    }
				});
		      const data = {
					    labels: labels,
					    datasets: [{
					      label: 'SALES FOR MONTH',
					      backgroundColor: 'rgb(255, 99, 132)',
					      borderColor: 'rgb(255, 99, 132)',
					      data: [0, 10, 5, 2, 20, 30, 45],
					    }]
					  };
			
			  const data = {
			    labels: labels,
			    datasets: [{
			      label: 'SALES FOR MONTH',
			      backgroundColor: 'rgb(255, 99, 132)',
			      borderColor: 'rgb(255, 99, 132)',
			      data: [0, 10, 5, 2, 20, 30, 45],
			    }]
			  };
			
			  const config = {
			    type: 'line',
			    data: data,
			    options: {}
			  };
			</script>
			<script>
			  const myChart = new Chart(
			    document.getElementById('myChart'),
			    config
			  );
			</script>
			
				</div>
			</div>
		</div>
	</div>
</body>
</html>
