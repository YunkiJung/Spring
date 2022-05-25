window.addEventListener('load', function(){
	getData();
	let prevBtn = document.getElementById('prev');
	let nextBtn = document.getElementById('next');
	
	prevBtn.addEventListener('click', prev);
	nextBtn.addEventListener('click', next);
});

var myChart;

function getData(year){
	
	
	
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
  
  
  let selectedYear = $('#year').html();
  if(year != null && year != ''){
	selectedYear = year;
	
	}
  let data1 = [];
  let sum = 0;
  $.ajax({
	   url: '/admin/salesSumForMonth', //요청경로
	    type: 'post',
	    async: false,
	    data:{'selectedYear':selectedYear}, 
	    success: function(result) {
		
	     let tdList = document.getElementsByClassName('monthly');
	      for(var i = 0; i < result.length; i++){
	      data1[i] = result[i].totalIncome;
	      
	      sum += result[i].totalIncome;
	      tdList[i].innerHTML = result[i].totalIncome;
	      
	      }
	      
	      let totalTag = document.getElementById('total');
	      totalTag.innerHTML = sum;
	      
	    },
	    error: function(){
	       alert('실패');
	    }
	});
  
    const data = {
    labels: labels,
    datasets: [{
      label: 'SALES',
      backgroundColor: 'rgb(255, 99, 132)',
      borderColor: 'rgb(220, 53, 69)',
      data : data1
    }]
  }; 
  const config = {
    type: 'line',
    data: data,
    
  };
  
	if(myChart == null){
	  myChart = new Chart(
	    document.getElementById('myChart'),
	    config
	  );
	
	}
	else{
		
		myChart.destroy();
		myChart = new Chart(
	    document.getElementById('myChart'),
	    config
	  );
	}
		
	
}

 
function prev(){
	let yearTag = document.getElementById('year');
	let currentYear = document.getElementById('current-year').value;
	
	
	let result = parseInt(yearTag.innerHTML);
	
	if(parseInt(currentYear) < result){
		
	}
	else{
		result -= 1;
		let nextBtn = document.getElementById('next');
		nextBtn.disabled = false;
	}
	
	yearTag.innerHTML = result;
	
	getData(result);
	
	
	
}

function next(){
	let yearTag = document.getElementById('year');
	let currentYear = document.getElementById('current-year').value;
	
	
	
	let result = parseInt(yearTag.innerHTML);
	result += 1;
	
	if(parseInt(currentYear) <= result){
		let nextBtn = document.getElementById('next');
		nextBtn.disabled = true;
	}
	else{
		let nextBtn = document.getElementById('next');
		nextBtn.disabled = false;
	}
	
	yearTag.innerHTML = result;
	
	getData(result);
	
}
