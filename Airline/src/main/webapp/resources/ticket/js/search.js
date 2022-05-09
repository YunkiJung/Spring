
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
	
	let map;

        
	
    navigator.geolocation.getCurrentPosition(showLocation);

    var city = document.getElementById('cityName');
    var weatherTag = document.getElementById('weather');
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
                city.innerHTML = rtyu.name; 
                weatherTag.innerHTML = '<img src="http://openweathermap.org/img/wn/' + rtyu.weather[0].icon + '@2x.png"></img>';
                
                map = new google.maps.Map(document.getElementById("map"), {
	                center: { lat: 43.648520, lng: -79.395880 },
	                zoom: 8,
            	});
                
            }
        };

        xhttp.open('GET', 'https://api.openweathermap.org/data/2.5/weather?lat=' + position.coords.latitude + '&lon=' + position.coords.longitude + '&appid=3fb46e9791606ca833bb06d811afe8ae', true);
        xhttp.send();
    }    

}
myWeather();







