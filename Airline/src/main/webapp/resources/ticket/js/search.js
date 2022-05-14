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





function myWeather(){
	
    navigator.geolocation.getCurrentPosition(showLocation);

    var city = document.getElementById('cityName');
    var weatherTag = document.getElementById('weather');
    var tempTag = document.getElementById('temp');
    
    function showLocation(position){
        console.log('Longitude : ' + position.coords.longitude);
        console.log('Latitude : ' + position.coords.latitude);
        
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                var rtyu = JSON.parse(this.responseText);
                console.log(rtyu);
                console.log(rtyu.name);
                console.log(rtyu.weather[0].icon);
                console.log(rtyu.sys.country);
                console.log(document.getElementById('departureDate').value);
                city.innerHTML = rtyu.name; 
                weatherTag.innerHTML = '<img style="width:300px; height:300px; margin: 0 auto;" src="http://openweathermap.org/img/wn/' + rtyu.weather[0].icon + '@2x.png"></img>';
                tempTag.innerHTML = '<div style="text-align: center;font-size: 2em;">'+ tempCal(rtyu.main.temp) +'°C</div>';
                
                
                $.ajax({
					url: '/ticket/selectMyGpsAirScheduleList', //요청경로
					type: 'post',
					data: {'countryCode':rtyu.sys.country, 'departureDate':document.getElementById('departureDate').value}, //필요한 데이터 '데이터이름':값
					success: function(result) {
						//ajax 실행 성공 후 실행할 코드 작성
						//alert('성공');
						
						let gpsTag = document.getElementById('myGpsAirScheduleList');
						
						let str = '';
						
						for(let i = 0; i < result.length; i++){
							str += '<div class="row" id="tvShape" onclick="tripInfo(\'' + result[i].airScheCode   +'\')">' ;
							str += '	<div class="col" id="myGpsAirScheduleList">' ; 
							str += 			result[i].dcityName + '('+ result[i].departurePortCode + ')'      + '→'  ;
							str += 			result[i].acityName + '('+ result[i].arrivalPortCode + ')'     	  ; 
							str += '		<span style="margin-left: 1em;">'+ result[i].hrs  + result[i].departureDate        ;  
							str += '		<span style="font-size: 1.3em;color: blue;margin-left: 2.2em;">$' + result[i].basePrice ; 
							str += '	</div>'
							str += '</div>'
						}
						gpsTag.innerHTML = str;
						
						
						
					},
					error: function() {
						//ajax 실행 실패 시 실행되는 구간
						alert('실패');
					}
				});
                
            }
        };

        xhttp.open('GET', 'https://api.openweathermap.org/data/2.5/weather?lat=' + position.coords.latitude + '&lon=' + position.coords.longitude + '&appid=3fb46e9791606ca833bb06d811afe8ae', true);
        xhttp.send();
        
		   var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
			
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴     
	}
}

function tripInfo(airScheCode){
		$.ajax({
		url: '/ticket/tripInfo', //요청경로
		type: 'post',
		data: {'airScheCode':airScheCode}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//alert('성공');
			$('#ticketModal').modal('show');
			
			let departureInfoModal = document.getElementById('departureInfoModal');
			let arrivalInfoModal = document.getElementById('arrivalInfoModal');
			let departureDateModal = document.getElementById('departureDateModal');
			
			departureInfoModal.addEventListener('keyup', searchFromPortsModal);
			arrivalInfoModal.addEventListener('keyup', searchToPortsModal);
			
			
			departureInfoModal.value = result.departurePortCode;
			arrivalInfoModal.value = result.arrivalPortCode;
			departureDateModal.value= result.departureDate.substr(0, 10);
			
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
};

function searchFromPortsModal(){
	
	let departureInfoModal = document.getElementById('departureInfoModal').value;
	
	$.ajax({
		url: '/ticket/searchPortsInfo', //요청경로
		type: 'post',
		data: {'searchCity':departureInfoModal}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			//alert(result[0].portCode);
			let datalist = document.getElementById('fromPortListModal');
			
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

function searchToPortsModal(){
	
	let arrivalInfoModal = document.getElementById('arrivalInfoModal').value;
	
	$.ajax({
		url: '/ticket/searchPortsInfo', //요청경로
		type: 'post',
		data: {'searchCity':arrivalInfoModal}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			//alert(result[0].portCode);
			let datalist = document.getElementById('arrivalPortListModal');
			
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






myWeather();

function tempCal(kel){
	
	let tem = kel - 273.15;
	
	return tem.toFixed(1);
};