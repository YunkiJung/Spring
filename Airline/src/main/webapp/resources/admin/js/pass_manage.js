/**
 * 
 */

function updatePass() {
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
				formId.action = "/admin/updatePass";
				var empPhone = document.getElementById('passPhone');
				empPhone.value = document.getElementById('passPhone1').value + '-' + document.getElementById('passPhone2').value + '-' + document.getElementById('passPhone3').value;
				formId.submit();
		}
		});
}

$(function(){
	$('#formId').validate({
	   
		   debug: false,
		   
		   rules: {
			  passName: {
				 required: true
				},
			  birthDate: {
				 required: true
				},
			  countryCode: {
				 required: true
				},
			  passEmail: {
				 required: true
				},
			  passPhone1: {
				 required: true
				},
			  passPhone2: {
				 required: true
				},
			  passPhone3: {
				 required: true
				},
			  passAddr: {
				 required: true
				},
			  ticketPrice: {
				 required: true
				},
			  orderDate: {
				 required: true
				}
		   },
		   messages: {
			  passName: {
				 required: '이름을 입력해주세요'
				},
			  birthDate: {
				 required: '생년월일을 입력해주세요'
				},
			  countryCode: {
				 required: '국가를 선택해주세요'
				},
			  passEmail: {
				 required: '메일을 입력해주세요'
				},
			  passPhone1: {
				 required: 'ex)010'
				},
			  passPhone2: {
				 required: 'ex)0000'
				},
			  passPhone3: {
				 required: 'ex)0000'
				},
			  passAddr: {
				 required: '주소를 입력해주세요'
				},
			  ticketPrice: {
				 required: '가격을 설정해주세요'
				},
			  orderDate: {
				 required: '일정을 입력해주세요'
				}
		   },
		   errorElement:'div',
		   errorPlacement: function (error, element){
		     	error.insertAfter(element);
		     	
		     	error.css('color', 'red');
		     	error.css('font-size', '12px');
		   },      
		   
		   submitHandler: function(form) {
		      updatePass();
		   }
	});
});
 
function selectPass(){
	var infoModal = new bootstrap.Modal(document.getElementById('infoModal'));
	var passScheCode;
	
	if(arguments.length === 1){
		passScheCode = arguments[0];
	}
	else{
		passScheCode = '-';
	}
	
	
	$.ajax({
   url: '/admin/selectPass', //요청경로
    type: 'post',
    data:{'passScheCode':passScheCode}, //필요한 데이터 '데이터이름':값
    success: function(result) {
	
	//if(result.passName != undefined){
		$('#passScheCode').val(result.passScheCode);
		$('#passScheCode').attr('readonly', true);
		$('#passName').val(result.passName);
		$('#memId').val(result.memId);
		$('#memId').attr('readonly', true);
		
		//if(result.gender === "MALE"){
			$('#female').prop('checked', true);
		//}
		//else{
		//	$('#male').prop('checked', true);
		//}
			
		$('input[name=birthDate]').val(result.birthDate);
		$('select[name=countryCode]').val(result.countryCode).prop('selected', true);
		$('input[name=passEmail]').val(result.passEmail);
		
		//if(result.passPhone != undefined){
			$('#passPhone1').val(result.passPhone.substr(0, 3));
			$('#passPhone2').val(result.passPhone.substr(4, 4));
			$('#passPhone3').val(result.passPhone.substr(9, 4));
		//}
		//else{
		//	$('#passPhone1').val('');
		//	$('#passPhone2').val('');
		//	$('#passPhone3').val('');
		//}
		$('input[name=passAddr]').val(result.passAddr);
		$('input[name=airScheCode]').val(result.airScheCode);
		$('input[name=airScheCode]').attr('readonly', true);
		$('input[name=seatCode]').val(result.seatCode);
		$('input[name=seatCode]').attr('readonly', true);
		$('input[name=ticketPrice]').val(result.ticketPrice);
		$('input[name=ticketPrice]').attr('readonly', true);
		$('input[name=orderCode]').val(result.orderCode);
		$('input[name=orderCode]').attr('readonly', true);
		$('input[name=orderDate]').val(result.orderDate);
		$('input[name=orderDate]').attr('readonly', true);
	//}
	
	//else{
	//	$('#passScheCode').val(result.passScheCode);
	//	$('#passName').val(result.passName);
	//	$('#memId').val(result.memId);
	//	
	//	//if(result.gender === "MALE"){
	//		$('#female').prop('checked', true);
	//	//}
	//	//else{
	//	//	$('#male').prop('checked', true);
	//	//}
	//		
	//	$('input[name=birthDate]').val(result.birthDate);
	//	$('select[name=countryCode]').val(result.countryCode).prop('selected', true);
	//	$('input[name=passEmail]').val(result.passEmail);
	//	
	//	//if(result.passPhone != undefined){
	//		$('#passPhone1').val(result.passPhone.substr(0, 3));
	//		$('#passPhone2').val(result.passPhone.substr(4, 4));
	//		$('#passPhone3').val(result.passPhone.substr(9, 4));
	//	//}
	//	
	//	else{
	//		$('#passPhone1').val('');
	//		$('#passPhone2').val('');
	//		$('#passPhone3').val('');
	//	}
	//	
	//	$('input[name=passAddr]').val(result.passAddr);
	//	$('input[name=airScheCode]').val(result.airScheCode);
	//	$('input[name=seatCode]').val(result.seatCode);
	//	$('input[name=ticketPrice]').val(result.ticketPrice);
	//	$('input[name=orderCode]').val(result.orderCode);
	//	$('input[name=orderDate]').val(result.orderDate);
	//}
	
	
    infoModal.show();
    
    var formId = document.getElementById('formId');
    
    $("#deletePass").click(function () {
			 Swal.fire({
				 title: '삭제 하시겠습니까?',
				  text: "",
				   icon: 'warning', showCancelButton: true,
				    confirmButtonColor: '#3085d6',
				     cancelButtonColor: '#d33',
				      confirmButtonText: '승인',
				       cancelButtonText: '취소' }).then((result) => {
					 if (result.isConfirmed) {
							 formId.action = "/admin/deletePass";
							formId.submit();
						}
					 })
				 });
      
	
    },
    error: function(){
       alert('실패');
    }
});
	
}



	



