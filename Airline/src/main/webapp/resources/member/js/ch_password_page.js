//form태그를 선택후 밸리데이션 사용

$('#chPassword').validate({
      debug: false, //유효성 검사 성공시에도 submit이 되지 않음 //true - 성공해도 submit이 되지 않음
      focusCleanup: true, //true이면 잘못된 필드에 포커스가 가면 에러를 지움
      focusInvalid:false, //유효성 검사후 포커스를 무효필드에 둠 꺼놓음
      onclick: false, //클릭시 발생됨 꺼놓음
      onfocusout:false, //포커스가 아웃되면 발생됨 꺼놓음
      //onfocusout: function(element) { 
      //   $(element).valid(); 
      //},
      onkeyup:false, //키보드 키가 올라가면 발생됨 꺼놓음
	  // 유효성 검사 대상 설정
      rules: {
         currentPw: { //input 태그의 name 속성으로 검사 대상을 지정
            required: true, 
            equalTo: '#inputPw'
         },
         newPw: { 
			required: true,
			minlength:8, 
            maxlength:16, 
            regx:/^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@@#$%^&+=]).*$/
		},
         newPwConfirm: {
			required: true,
			equalTo: '#newPw'
		},
      },
      //유효성 검사 실패시 결과
      messages: {
           currentPw: { 
            required: '비밀번호를 입력해주세요',
            equalTo: '비밀번호를 다시 입력하여주세요'
         },
         newPw: {
			required: '비밀번호를 입력해주세요',
			minlength:'최소 8자 이상', 
            maxlength:'최대 16자 이하', 
            regx: '비밀번호 형식이 잘못되었습니다'
		},
         newPwConfirm: {
			required: '비밀번호를 입력해주세요',
			equalTo: '새 비밀번호하고 일지 하지 않습니다'
		},
      },
      //유효성 실패 시 추가할 태그 (default 값 : label)
      errorElement:'div',
      //유효성 검사 실패시 출력 방식 지정
      errorPlacement: function (error, element){
		//element : 유효성 검사 실패한 태그 값
		//error : 검사 실패 시 자동 추가 되는 태그
         error.insertAfter(element);
         error.css('color', 'red');
         error.css('font-size','12px');
      },      
      //유효성 검사 성공시 결과
      submitHandler: function(form) {
		alert('비밀번호 변경성공');
         form.submit();   //유효성 검사를 통과시 전송
      }
 });
