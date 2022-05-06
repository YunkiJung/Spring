
window.addEventListener('load', function(){
	
	let fromCity = document.getElementById('fromCity');
	//fromCity.addEventListener('click', searchFromPorts);
	fromCity.addEventListener('keyup', searchFromPorts);
	
	
	let toCity = document.getElementById('toCity');
	//toCity.addEventListener('click', searchToPorts, false);
	toCity.addEventListener('keyup', searchToPorts, false);
	
	let oneway = document.getElementById('oneway');
	oneway.addEventListener('click', toOneway);
	
	let returnTag = document.getElementById('return');
	returnTag.addEventListener('click', toReturn);
	
	let searchBtn = document.getElementById('searchBtn');
	searchBtn.addEventListener('click', searchAirSchedule);
	
});

function searchAirSchedule(){
	
	let searchFormTag = document.getElementById('searchForm');
	
	searchFormTag.submit();
	
}


function toReturn(){
	let returnDate = document.getElementById('returnDate');
	returnDate.value = '';
	returnDate.readOnly = false;
}

function toOneway(){
	let returnDate = document.getElementById('returnDate');
	returnDate.value = null;
	returnDate.readOnly = true;
}


function searchFromPorts(){
	
	let fromCity = document.getElementById('fromCity').value;
	
	$.ajax({
		url: '/ticket/searchPortsInfo', //요청경로
		type: 'post',
		data: {'searchCity':fromCity}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			//alert(result[0].portCode);
			let datalist = document.getElementById('fromPortList');
			
			let str = '';
			for(let i = 0; i < result.length; i++){
				str += '<option value="' + result[i].portCode + '">' + result[i].portName + '(' + result[i].cityName + ')' + '</option>';
			}
			
			datalist.innerHTML = str;
			console.log(result);
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}

function searchToPorts(){
	
	let toCity = document.getElementById('toCity').value;
	
	$.ajax({
		url: '/ticket/searchPortsInfo', //요청경로
		type: 'post',
		data: {'searchCity':toCity}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			//alert('성공');
			let datalist = document.getElementById('toPortList');
			
			let str = '';
			for(let i = 0; i < result.length; i++){
				str += '<option value="' + result[i].portCode + '">' + result[i].portName + '(' + result[i].cityName + ')' + '</option>';
			}
			
			datalist.innerHTML = str;
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}