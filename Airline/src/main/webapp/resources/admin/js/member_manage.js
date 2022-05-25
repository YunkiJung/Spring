
function updateMember() {
	Swal.fire({
		 title: '수정 하시겠습니까?',
		  text: "",
		   icon: 'question', showCancelButton: true,
		    confirmButtonColor: '#3085d6',
		     cancelButtonColor: '#d33',
		      confirmButtonText: '승인',
		       cancelButtonText: '취소' }).then((result) => {
			 if (result.isConfirmed) {
					var formId = document.getElementById('formId');
					formId.action = "/admin/updateMember";
					var memPhone = document.getElementById("memPhone");
					memPhone.value = document.getElementById("memPhone1").value + '-' + document.getElementById("memPhone2").value + '-' + document.getElementById("memPhone3").value;
					formId.submit();
				}
	});
}

$('#formId').validate({
	   debug: false,
	   
	   rules: {
		  memId: {
			 required: true
			},
		  memPw: {
			 required: true
			},
		  memName: {
			 required: true
			},
		  memPhone1: {
			 required: true
			},
		  memPhone2: {
			 required: true
			},
		  memPhone3: {
			 required: true
			},
		  memAddr: {
			 required: true
			},
		  memEmail: {
			 required: true
			},
		  birthDate: {
			 required: true
			},
		  isAdmin: {
			 required: true
			}
	   },
	   messages: {
		  memPw: {
			 required: '패스워드를 입력해주세요'
			},
		  memName: {
			 required: '이름을 입력해주세요'
			},
		  memPhone1: {
			 required: 'ex)010'
			},
		  memPhone2: {
			 required: 'ex)0000'
			},
		  memPhone3: {
			 required: 'ex)0000'
			},
		  memAddr: {
			 required: '주소를 입력해주세요'
			},
		  memEmail: {
			 required: '메일을 입력해주세요'
			},
		  birthDate: {
			 required: '생일을 입력해주세요'
			},
		  birthDate: {
			 required: 'Y/N'
			}
	   },
	   errorElement:'div',
	   errorPlacement: function (error, element){
	     	error.insertAfter(element);
	     	
	     	error.css('color', 'red');
	     	error.css('font-size', '12px');
	   },      
	   
	   submitHandler: function(form) {
	      updateMember();
	   }
});

 
function selectMember(){
	var infoModal = new bootstrap.Modal(document.getElementById('infoModal'));
	var memId;
	
	if(arguments.length === 1){
		memId = arguments[0];
	}
	else{
		memId = '-';
	}
	
	
	$.ajax({
   url: '/admin/selectMember', //요청경로
    type: 'post',
    data:{'memId':memId}, //필요한 데이터 '데이터이름':값
    success: function(result) {
		if(result.memId != undefined){
		$('#memId').val(result.memId).prop('readonly', true);
		}
		else{
		$('#memId').val(result.memId).prop('readonly', false);
		}
		$('input[name=memPw]').val(result.memPw);
		$('input[name=memName]').val(result.memName);
		
		if(result.gender === "FEMALE"){
			$('#female').prop('checked', true);
		}
		else{
			$('#male').prop('checked', true);
		}
		if(result.memPhone != undefined){
		$('#memPhone1').val(result.memPhone.substr(0, 3));
		$('#memPhone2').val(result.memPhone.substr(4, 4));
		$('#memPhone3').val(result.memPhone.substr(9, 4));
		}
		else{
		$('#memPhone1').val('');
		$('#memPhone2').val('');
		$('#memPhone3').val('');
		}
		$('input[name=memAddr]').val(result.memAddr);
		$('select[name=countryCode]').val(result.countryCode).prop('selected', true);
		$('input[name=memEmail]').val(result.memEmail);
		$('input[name=birthDate]').val(result.birthDate);
		$('input[name=points]').val(result.points);
		$('input[name=empCode]').val(result.empCode);
		$('input[name=isAdmin]').val(result.isAdmin);
	
    infoModal.show();
    
    /////////////////////////////////////////////////
    var formId = document.getElementById('formId');
	
		 $("#deleteMember").click(function () {
			 Swal.fire({
				 title: '정말 삭제 하시겠습니까?',
				  text: "다시 되돌릴 수 없습니다.",
				   icon: 'warning', showCancelButton: true,
				    confirmButtonColor: '#3085d6',
				     cancelButtonColor: '#d33',
				      confirmButtonText: '승인',
				       cancelButtonText: '취소' }).then((result) => {
					 if (result.isConfirmed) {
							 formId.action = "/admin/deleteMember";
							formId.submit();
						}
					 })
				 });
				 
	
    ///////////////////////////////////////////
	
    },
    error: function(){
       alert('실패');
    }
});
	
}






