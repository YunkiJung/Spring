window.addEventListener('load', function(){
	let totalPriceTag = document.getElementById('totalPrice');
	let taxTag = document.getElementById('tax');
	
	let tax;
	
	tax = parseInt(totalPriceTag.innerHTML) * 0.19;
	
	taxTag.innerHTML = tax;
	
	totalPriceTag.innerHTML = tax + parseInt(totalPriceTag.innerHTML);
	
	
	getPoints();
	
	
	let pointsBtnTag = document.getElementById('pointsBtn');
	if(pointsBtnTag != null){
		pointsBtnTag.addEventListener('click', calculatePoints);
	}
	
	let resetPointsBtnTag = document.getElementById('resetPointsBtn');
	if(resetPointsBtnTag != null){
		resetPointsBtnTag.addEventListener('click', resetPoints);
	}
	
	
	let checkoutBtn = document.getElementById('checkout-btn');
	checkoutBtn.addEventListener('click', checkout);
	
	
});






var cardDrop = document.getElementById('card-dropdown');
var activeDropdown;
cardDrop.addEventListener('click',function(){
  var node;
  for (var i = 0; i < this.childNodes.length-1; i++)
    node = this.childNodes[i];
    if (node.className === 'dropdown-select') {
      node.classList.add('visible');
       activeDropdown = node; 
    };
})

window.onclick = function(e) {
  console.log(e.target.tagName)
  console.log('dropdown');
  console.log(activeDropdown)
  if (e.target.tagName === 'LI' && activeDropdown){
    if (e.target.innerHTML === 'Master Card') {
      document.getElementById('credit-card-image').src = 'https://dl.dropboxusercontent.com/s/2vbqk5lcpi7hjoc/MasterCard_Logo.svg.png';
          activeDropdown.classList.remove('visible');
      activeDropdown = null;
      e.target.innerHTML = document.getElementById('current-card').innerHTML;
      document.getElementById('current-card').innerHTML = 'Master Card';
    }
    else if (e.target.innerHTML === 'American Express') {
         document.getElementById('credit-card-image').src = 'https://dl.dropboxusercontent.com/s/f5hyn6u05ktql8d/amex-icon-6902.png';
          activeDropdown.classList.remove('visible');
      activeDropdown = null;
      e.target.innerHTML = document.getElementById('current-card').innerHTML;
      document.getElementById('current-card').innerHTML = 'American Express';      
    }
    else if (e.target.innerHTML === 'Visa') {
         document.getElementById('credit-card-image').src = 'https://dl.dropboxusercontent.com/s/ubamyu6mzov5c80/visa_logo%20%281%29.png';
          activeDropdown.classList.remove('visible');
      activeDropdown = null;
      e.target.innerHTML = document.getElementById('current-card').innerHTML;
      document.getElementById('current-card').innerHTML = 'Visa';
    }
  }
  else if (e.target.className !== 'dropdown-btn' && activeDropdown) {
    activeDropdown.classList.remove('visible');
    activeDropdown = null;
  }
}




function getPoints(){
	
	let pointsBtn = document.getElementById('pointsBtn');
	
	if(pointsBtn == null){
		return;
	}
	else{
		$.ajax({
			url: '/ticket/getPoints', //요청경로
			type: 'post',
			data: {}, //필요한 데이터 '데이터이름':값
			success: function(result) {
				//ajax 실행 성공 후 실행할 코드 작성
				//alert(result);
				
				let pointTag = document.getElementById('points');
				let originPointsTag = document.getElementById('origin-points')
				
				pointTag.innerHTML = result;
				originPointsTag.value = result;
				
			},
			error: function() {
				//ajax 실행 실패 시 실행되는 구간
				alert('실패');
			}
		});
	}
	
}

function calculatePoints(){
	let totalPriceTag = document.getElementById('totalPrice');
	let pointsTag = document.getElementById('points');
	let usePointsTag = document.getElementById('use-points');
	let pointsBtnTag = document.getElementById('pointsBtn');
	
	let newTotalPrice = parseInt(totalPriceTag.innerHTML) - usePointsTag.value;
	let newPoints = parseInt(pointsTag.innerHTML) - usePointsTag.value;
	
	if(newPoints < 0){
		alert('invalid');
		usePointsTag.value = 0;
		return;
	}
	else if(newTotalPrice < 0){
		alert('invalid');
		usePointsTag.value = 0;
		return;
	}
	else if(usePointsTag.value < 0){
		alert('invalid');
		usePointsTag.value = 0;
		return;
	}
	else{
		totalPriceTag.innerHTML = newTotalPrice;
		pointsTag.innerHTML = newPoints;
		pointsBtnTag.disabled = true;
		usePointsTag.readOnly = true;
		
	}
	
}



function resetPoints(){
	let originPointsTag = document.getElementById('origin-points');
	let originTotalPriceTag = document.getElementById('origin-totalPrice');
	let pointsTag = document.getElementById('points');
	let totalPriceTag = document.getElementById('totalPrice');
	let usePointsTag = document.getElementById('use-points');
	let pointsBtnTag = document.getElementById('pointsBtn');
	let taxTag = document.getElementById('tax');
	
	pointsTag.innerHTML = originPointsTag.value;
	
	usePointsTag.value = 0;
	
	pointsBtnTag.disabled = false;
	
	usePointsTag.readOnly = false;
	
	totalPriceTag.innerHTML = parseInt(originTotalPriceTag.value) + parseInt(taxTag.innerHTML);
	
}


function checkout(){
	
	let usePointsTag = document.getElementById('use-points');
	let points;
	let url;
	if(usePointsTag == null){
		url = '/ticket/confirmOrder';
	}
	else{
		if(usePointsTag.readOnly == false){
			points = 0;
			url = '/ticket/confirmOrder?points=' + points;
		}
		else{
			points = usePointsTag.value;
			url = '/ticket/confirmOrder?points=' + points;
		}
	}
	
	
	location.href = url;
	
	
	
}


