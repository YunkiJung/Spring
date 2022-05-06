window.addEventListener('load', function(){
	let loginBtnTag = document.getElementById('loginBtn');
	
	loginBtnTag.addEventListener('click', login);
	
});


function login(){
	
	let memId = document.getElementById('memIds').value;
	let memPw = document.getElementById('memPws').value;
	
	$.ajax({
		url: '/ticket/login', //요청경로
		type: 'post',
		data: {'memId':memId, 'memPw':memPw}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			if(result == true){
				alert('로그인 성공');
				location.href = '/ticket/passengerInfoForm';
			}
			else{
				alert('로그인 실패');
			}
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}

