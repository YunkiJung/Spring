 $.validator.addMethod("regx", function(value, element, regexpr) {          
    return regexpr.test(value);
});
 
 //우편번호
 function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    };
function login(){
	var memId = document.getElementById('loginMemId').value;
	var memPw = document.getElementById('loginMemPw').value;
	$.ajax({
   url: '/member/login', //요청경로
    type: 'post',
    data:{}, //필요한 데이터 '데이터이름':값
    success: function(result) {
   
    },
    error: function(){
      //ajax 실행 실패 시 실행되는 구간
       alert('아이디 또는 비밀번호를 잘못 입력하셨습니다.');
    }
});
}
    
//회원가입 발리데이션
$('#joinForm').validate({
      debug: false,
      focusCleanup: true, //true이면 잘못된 필드에 포커스가 가면 에러를 지움
      focusInvalid:false, //유효성 검사후 포커스를 무효필드에 둠 꺼놓음
      onclick: false, //클릭시 발생됨 꺼놓음
      onfocusout:false, //포커스가 아웃되면 발생됨 꺼놓음
      //onfocusout: function(element) { 
      //   $(element).valid(); 
      //},
      onkeyup:false, //키보드 키가 올라가면 발생됨 꺼놓음

      rules: {
         memId: { 
            required: true, 
            minlength: 3,
            maxlength: 10
         },
         memPw: {
			required: true,
			minlength:8, 
            maxlength:16, 
            regx:/^(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@@#$%^&+=]).*$/

		},
         pwConfirm: {
			required: true,
			equalTo: '#memPw'
		},
         memEmail1: {
			required: true,
		},
         memName: {
			required: true
		},
         birthDate: {
			required: true,
			date: true
		},
         memAddr1: {
			required: true
		},
         memAddr2: {
			required: true
		},
         memPhone1: {
			required: true,
			minlength: 4
		},
         memPhone2: {
			required: true,
			minlength: 4
		},
		checkAgreement: {
			required: true,
		},
      },
      messages: {
         memId: {
            required: '아이디를 입력해주세요.',
            minlength: '아이디는 3자 이상 입력해주세요',
            maxlength: '아이디는 10자 미만 입력해주세요'            
         },
         memPw: {
			required: '비밀번호를 입력해주세요',
			minlength:'최소 8자 이상', 
            maxlength:'최대 16자 이하', 
            regx: '비밀번호 형식이 잘못되었습니다'
		},
         pwConfirm: {
			required: '비밀번호 확인을 입력해주세요',
			equalTo: '비밀번호가 일치하지 않습니다'
		},
         memEmail1: {
			required: '이메일을 입력해주세요',
		},
         memName: {
			required: '이름을 입력해주세요'
		},
         birthDate: {
			required: '생년월일을 입력해주세요',
			date: true
		},
         memAddr1: {
			required: '주소를 입력해주세요'
		},
         memAddr2: {
			required: '상세주소를 입력해주세요'
		},
		 memPhone1: {
			required: '연락서를 입력해주세요',
			minlength: '휴대폰 번호를 정확하게 입력하세요'
		},
         memPhone2: {
			required: '연락서를 입력해주세요',
			minlength: '휴대폰 번호를 정확하게 입력하세요'
		},
		checkAgreement: {
			required: '개인정보 제3자 제공 동의를 체크해주세요'
		}
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
			$('#memPhone1').attr('name', 'memPhones');
			$('#memPhone2').attr('name', 'memPhones');
			$('#memEmail1').attr('name', 'memEmails');
			$('#memEmail2').attr('name', 'memEmails');
			$('#sample6_address').attr('name', 'memAddrs');
			$('#sample6_detailAddress').attr('name', 'memAddrs');
			alert('회원가입 성공');
         	form.submit();   //유효성 검사를 통과시 전송
      },
});
//아이디 확인
function idConfirm(){
	var memId = document.getElementById('memId').value;
	var idConfirmDiv = document.getElementById('idConfirmDiv');
	$.ajax({
   url: '/member/idConfirm', //요청경로
    type: 'post',
    data:{'memId':memId}, //필요한 데이터 '데이터이름':값
    success: function(result) {
		var str = '';
		
		if(result.memId != null) {
		 str +='<div>';
		 str +='이미 있는 아이디 입니다.' ;
		 str +='</div>' ;
		} 
		else{
			str +='<div>' ;
			str +='사용 가능한 아이디 입니다.'     ;
		 	str +='</div>' ;
		}
		/* str.css('color', 'red');
         str.css('font-size','12px');*/
         
     idConfirmDiv.innerHTML = str;
    },
    error: function(){
	alert('실패');
    }
});
}
//회원가입 페이지 나라 슬랙트박스 표시
function selectCountry(){
	$.ajax({
   url: '/member/selectCountry', //요청경로
    type: 'post',
    data:{}, //필요한 데이터 '데이터이름':값
    success: function(result) {
     var countryCode = document.getElementById('countryCode');
      var str = "";
      
      for(var i =0 ; i < result.length ; i++){
      str +='<option value="' + result[i].countryCode + '">' + result[i].countryName + '</option>';
	}
      
      countryCode.innerHTML = str;
      
      $('#loginModal').css('display','none');
      $('#joinModal').modal('show');
      
    },
    error: function(){
	alert('실패');
      //ajax 실행 실패 시 실행되는 구간
    }
});
}

//회원가입 모달 창 닫힐 때 이벤트
$('#joinModal').on('hidden.bs.modal', function (event) {
	$('#loginModal').modal('hide');
	$('#loginModal').css('display','block');
})

//아이디 찾기
function findId(){
	var memEmail = document.getElementById('findIdEmail').value;
$.ajax({
   url: '/member/findId', //요청경로
    type: 'post',
    data:{'memEmail' : memEmail}, //필요한 데이터 '데이터이름':값
    success: function(result) {
      //ajax 실행 성공 후 실행할 코드 작성
      alert('아이디를 메일로 발송했습니다');
    },
    error: function(){
      //ajax 실행 실패 시 실행되는 구간
       alert('이메일이 존재하지 않습니다.');
    }
});
}
//비밀번호 찾기
function findPw(){
	var memId = document.getElementById('findId').value;
	var memEmail = document.getElementById('findEmail').value;
$.ajax({
   url: '/member/findPw', //요청경로
    type: 'post',
    data:{'memId' : memId, 'memEmail' : memEmail}, //필요한 데이터 '데이터이름':값
    success: function(result) {
      //ajax 실행 성공 후 실행할 코드 작성
      alert('임시비밀번호를 메일로 발송했습니다');
    },
    error: function(){
      //ajax 실행 실패 시 실행되는 구간
       alert('이메일 또는 아이디를 다시 확인해 주시기 바랍니다');
    }
});
}
function confirmMember(){
	
	var memId = document.getElementById('loginMemId').value;
	var memPw = document.getElementById('loginMemPw').value;
	$.ajax({
    url: '/member/confirmMember', //요청경로
    type: 'post',
    data:{'memId' : memId, 'memPw' : memPw}, //필요한 데이터 '데이터이름':값
    success: function(result) {
		if(result != "") {
			document.getElementById('loginFrom').submit();
		}
		else{
			alert('아이디 또는 비밀번호가 일치하지 않습니다');
		}
    },
    error: function(){
	alert('실패');
      //ajax 실행 실패 시 실행되는 구간
    }
});
}
