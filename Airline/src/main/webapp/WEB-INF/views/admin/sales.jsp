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
</style>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<div class="row justify-content-center" id="mainContainer">
		<div class="col-9" style="background-color: #f9fafb;">
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
				  
				  let data1 = [];
				  
				  $.ajax({
					   url: '/admin/salesSumForMonth', //요청경로
					    type: 'post',
					    async: false,
					    data:{}, 
					    success: function(result) {
					      for(var i = 0; i < result.length; i++){
					      data1[i] = result[i].totalIncome;
					      }
					    },
					    error: function(){
					       alert('실패');
					    }
					});
				  
				    const data = {
				    labels: labels,
				    datasets: [{
				      label: 'SALES FOR MONTH',
				      backgroundColor: 'rgb(255, 99, 132)',
				      borderColor: 'rgb(255, 99, 132)',
				      data : data1
				    }]
				  }; 
				  const config = {
				    type: 'line',
				    data: data,
				    options: {
				    	
				    }
				  };
				</script>
				<script>
				  const myChart = new Chart(
				    document.getElementById('myChart'),
				    config
				  );
				</script>
				</div>
				
				<div class="col-3">
					
				</div>
				
			</div>
</body>
</html>
