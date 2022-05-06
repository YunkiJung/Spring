function getBookedSeatList(){
	
	let airScheCode = document.getElementById('airScheCode').innerHTML;
	
	$.ajax({
		url: '/ticket/getBookedSeatList', //요청경로
		type: 'post',
		data: {'airScheCode':airScheCode}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			//alert(result);
			
			console.log(result);
			
			let seatTags = document.getElementsByClassName('seat');
			
			console.log(seatTags);
			for(let i = 0; i < result.length; i++){
				for(let j = 0; j < seatTags.length; j++){
					if(result[i] == seatTags[j].firstElementChild.id){
						seatTags[j].firstElementChild.disabled = true;
					}
				}
			}
			
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}


function selectSeat(event){
	//alert(event.target.tagName);
	//alert(this.tagName);
	
	if(event.target.tagName == 'INPUT' && event.target.checked == true){
		let seatTags = document.getElementsByClassName('seat');
		for(let i = 0; i < seatTags.length; i++){
			if(event.target != seatTags[i].firstElementChild){
				seatTags[i].firstElementChild.disabled = true;
			}
			
		}
	}
	else if(event.target.tagName == 'INPUT' && event.target.checked == false){
		let seatTags = document.getElementsByClassName('seat');
		for(let i = 0; i < seatTags.length; i++){
			if(event.target != seatTags[i].firstElementChild){
				seatTags[i].firstElementChild.disabled = false;
			}
			else if(event.target == seatTags[i].firstElementChild){
				getBookedSeatList();
				getSeatNumInSession();
			}
			
		}
	}
	
}


function printSeatNum(event){
	
	let seatNumScreenTag = document.getElementById('seatNumScreen');
	
	if(event.target.checked){
		seatNumScreenTag.innerHTML = event.target.value;;
	}
	else{
		seatNumScreenTag.innerHTML = '';
	}
	
}


function confirmSeat(){
	
	let result = confirm("Do you want to select this seat?");
	
	if(result == false){
		return;
	}
	else{
		let seatNum = document.getElementById('seatNumScreen').innerHTML;
		
		if(seatNum == null || seatNum == ''){
			alert('Please select seat number');
		}
		else{
			location.href = '/ticket/confirmSeatNum?seatNum=' + seatNum;
		}
	}
}



function getSeatNumInSession(){
	$.ajax({
		url: '/ticket/getSeatNumInSession', //요청경로
		type: 'post',
		data: {}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			//alert(result);
			
			console.log(result);
			
			let seatTags = document.getElementsByClassName('seat');
			
			console.log(seatTags);
			for(let i = 0; i < result.length; i++){
				for(let j = 0; j < seatTags.length; j++){
					if(result[i] == seatTags[j].firstElementChild.id){
						seatTags[j].firstElementChild.disabled = true;
					}
				}
			}
			
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}


window.addEventListener('load', function(){
	getBookedSeatList();
	getSeatNumInSession();
	
	let planeSeats = document.getElementById('cabin');
	
	planeSeats.addEventListener('click', selectSeat);
	planeSeats.addEventListener('click', printSeatNum);
	
	
	let confirmSeatBtnTag = document.getElementById('confirmSeatBtn');
	
	confirmSeatBtnTag.addEventListener('click', confirmSeat);
	 
});
