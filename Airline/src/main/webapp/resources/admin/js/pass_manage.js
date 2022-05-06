/**
 * 
 */
 
 
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
	
	if(result.passName != undefined){
	$('#passScheCode').val(result.passScheCode).prop('disabled', true);
	$('#passName').val(result.passName);
	$('#memId').val(result.memId).prop('disabled', true);
	if(result.gender === "MALE"){
			$('#female').prop('checked', true);
		}
		else{
			$('#male').prop('checked', true);
		}
	$('input[name=birthDate]').val(result.birthDate);
	$('select[name=countryCode]').val(result.countryCode).prop('selected', true);
	$('input[name=passEmail]').val(result.passEmail);
	if(result.passPhone != undefined){
	$('#passPhone1').val(result.passPhone.substr(0, 3));
	$('#passPhone2').val(result.passPhone.substr(4, 4));
	$('#passPhone3').val(result.passPhone.substr(9, 4));
	}
	else{
	$('#passPhone1').val('');
	$('#passPhone2').val('');
	$('#passPhone3').val('');
	}
	$('input[name=passAddr]').val(result.passAddr);
	$('input[name=airScheCode]').val(result.airScheCode).prop('disabled', true);
	$('input[name=seatCode]').val(result.seatCode).prop('disabled', true);
	$('input[name=ticketPrice]').val(result.ticketPrice).prop('disabled', true);
	$('input[name=orderCode]').val(result.orderCode).prop('disabled', true);
	$('input[name=orderDate]').val(result.orderDate).prop('disabled', true);
		
	}
	
	else{
	$('#passScheCode').val(result.passScheCode);
	$('#passName').val(result.passName);
	$('#memId').val(result.memId);
	if(result.gender === "MALE"){
			$('#female').prop('checked', true);
		}
		else{
			$('#male').prop('checked', true);
		}
	$('input[name=birthDate]').val(result.birthDate);
	$('select[name=countryCode]').val(result.countryCode).prop('selected', true);
	$('input[name=passEmail]').val(result.passEmail);
	if(result.passPhone != undefined){
	$('#passPhone1').val(result.passPhone.substr(0, 3));
	$('#passPhone2').val(result.passPhone.substr(4, 4));
	$('#passPhone3').val(result.passPhone.substr(9, 4));
	}
	else{
	$('#passPhone1').val('');
	$('#passPhone2').val('');
	$('#passPhone3').val('');
	}
	$('input[name=passAddr]').val(result.passAddr);
	$('input[name=airScheCode]').val(result.airScheCode);
	$('input[name=seatCode]').val(result.seatCode);
	$('input[name=ticketPrice]').val(result.ticketPrice);
	$('input[name=orderCode]').val(result.orderCode);
	$('input[name=orderDate]').val(result.orderDate);
		
	}
	
	
 	
 	if(result.passName != undefined){
	
 	var modalFooter = document.getElementById('modalFooter');
	modalFooter.innerHTML = '';
	var str = '';
	
	str += '<button type="button" class="btn btn-danger" onclick="deletePass();">삭제</button>';
	str += '<button type="button" class="btn btn-primary" onclick="updatePass();">수정</button>';
	str += '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
	
	modalFooter.innerHTML += str;
	}
	
    infoModal.show();
      
	
    },
    error: function(){
       alert('실패');
    }
});
	
}

function deletePass(){
	var formId = document.getElementById('formId')
	if(confirm('정말 삭제하시겠습니까?')){
	formId.action = "/admin/deletePass";
	formId.submit();
	}
	else{
		return;
	}
	
}

function updatePass(){
	var formId = document.getElementById('formId');
	if(confirm('정말 수정하시겠습니까?')){
	document.getElementById('passPhone').value = document.getElementById('passPhone1').value + '-' + document.getElementById('passPhone2').value + '-' + document.getElementById('passPhone3').value;
	formId.action = "/admin/updatePass";
	formId.submit();
	}
	else{
		return;
	}
}

/*function insertPass(){
	
	selectPass();
	
	var formId = document.getElementById('formId');
	formId.action = "/admin/insertPass";
	
	var modalFooter = document.getElementById('modalFooter');
	modalFooter.innerHTML = '';
	var str = '';
	
	str += '<input type="submit" class="btn btn-primary" value="추가"></button>';
	str += '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
	
	modalFooter.innerHTML += str;
}*/


	



