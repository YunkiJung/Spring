/**
 * 
 */
 
 function changePass(){
 Swal.fire({
		title: '수정 하시겠습니까?',
		text: "",
		icon: 'question', showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '승인',
		cancelButtonText: '취소' }).then((result) => {
			if (result.isConfirmed) {
				let formId = document.getElementById('formId');
				formId.action = "/admin/updatePassSeat";
				document.getElementById('passPhone').value = $('#passPhone1').val() + '-' + $('#passPhone2').val() + '-' + $('#passPhone3').val();
				formId.submit();
			}
		});
	}

$('#formId').validate({
   
   debug: false,
   
   rules: {
	  passScheCode: {
		 required: true
		},
	  memId: {
		 required: true
		},
	  passName: {
		 required: true
		},
	  birthDate: {
		 required: true
		},
	  passportNum: {
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
	  seatCode: {
		 required: true
		}
   },
   messages: {
      passScheCode: {
		 required: "값을 입력해주세요"
		},
	  memId: {
		 required: "값을 입력해주세요"
		},
	  passName: {
		 required: "값을 입력해주세요"
		},
	  birthDate: {
		 required: "값을 입력해주세요"
		},
	  passportNum: {
		 required: "값을 입력해주세요"
		},
	  passEmail: {
		 required: "값을 입력해주세요"
		},
	  passPhone1: {
		 required: "값을 입력해주세요"
		},
	  passPhone2: {
		 required: "값을 입력해주세요"
		},
	  passPhone3: {
		 required: "값을 입력해주세요"
		},
	  passAddr: {
		 required: "값을 입력해주세요"
		},
	  seatCode: {
		 required: "값을 입력해주세요"
		}
   },
   errorElement:'div',
   errorPlacement: function (error, element){
		$(element).addClass("error");
   },      
   
   submitHandler: function(form) {
	changePass();
   }
});

window.onload = function() {
	//nullCheck();
	
	var airScheCode = document.getElementById('airScheCode').value;
	
	$.ajax({
	   url: '/admin/nullCheck', 
	    type: 'post',
	    data:{'airScheCode':airScheCode}, 
	    success: function(result) {
	      //console.log(result);
	      
	    
		
		
		//alert(seatTags[0].tagName);
		
		for(let j = 0; j < result.length; j++){
			$('#label'+ result[j]).css('backgroundColor', '#79d41e');
			$('#'+result[j]).attr("disabled",false); 
		}
	    },
	    error: function(){
	    }
	});
	
}


window.addEventListener('load', function(){
	let olContainerTag = document.getElementById('cabin');
	olContainerTag.addEventListener('click', selectSeatInfo);
});

function selectSeatInfo(event){
	
	
	if(event.target.tagName != 'INPUT'){
		return;
	}
	else if(event.target.disabled == true){
		return;
	}
	else{
		var airScheCode = document.getElementById('airScheCode').value;
		$('#passPhone').val($('#passPhone1').val() + '-' + $('#passPhone2').val() + '-' + $('#passPhone3').val());
		$.ajax({
			   url: '/admin/checkPassScheForSeat', 
			    type: 'post',
			    data:{'seatCode': event.target.value, 'airScheCode': airScheCode}, //필요한 데이터 '데이터이름':값
			    success: function(result) {
			      
			     	$('#passScheCode').val(result.passScheCode);
					$('#memId').val(result.memId);
					$('#passName').val(result.passName);
					if(result.gender === "MALE"){
							$('#female').prop('checked', true);
						}
						else{
							$('#male').prop('checked', true);
						}
					$('input[name=birthDate]').val(result.birthDate);
					$('select[name=countryCode]').val(result.countryCode).prop('selected', true);
					$('input[name=passportNum]').val(result.passportNum);
					$('input[name=passEmail]').val(result.passEmail);
					//if(result.passPhone != undefined){
					$('#passPhone1').val(result.passPhone.substr(0, 3));
					$('#passPhone2').val(result.passPhone.substr(4, 4));
					$('#passPhone3').val(result.passPhone.substr(9, 4));
					/*}
					else{
					$('#passPhone1').val('');
					$('#passPhone2').val('');
					$('#passPhone3').val('');
					}*/
					$('input[name=passAddr]').val(result.passAddr);
					$('input[name=seatCode]').val(result.seatCode);
					$('input[name=ticketPrice]').val(result.ticketPrice);
					$('input[name=orderCode]').val(result.orderCode);
					$('input[name=orderDate]').val(result.orderDate);
			    
					/*$('input[name=checkbox]:not(:checked)').each(function(){
						$(this).val().prop('disabled', true);
					});*/
					
			    },
			    error: function(){
			       alert('실패');
			    }
			});
	}
	
	
	
}



