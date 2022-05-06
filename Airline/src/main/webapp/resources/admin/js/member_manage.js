/**
 * 
 */
 
 
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
	
	

	if(result.memId != undefined){
	var modalFooter = document.getElementById('modalFooter');
	modalFooter.innerHTML = '';
	var str = '';
	
	str += '<button type="button" class="btn btn-danger" onclick="deleteMember();">삭제</button>';
	str += '<button type="button" class="btn btn-primary" onclick="updateMember();">수정</button>';
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

function deleteMember(){
	var formId = document.getElementById('formId')
	if(confirm('정말 삭제하시겠습니까?')){
	formId.action = "/admin/deleteMember";
	formId.submit();
	}
	else{
		return;
	}
	
}

function updateMember(){
	if(confirm('수정 하시겠습니까?')){
	
	var memPhone = document.getElementById("memPhone");
	memPhone.value = document.getElementById("memPhone1").value + '-' + document.getElementById("memPhone2").value + '-' + document.getElementById("memPhone3").value;  
	var formId = document.getElementById('formId')
	formId.action = "/admin/updateMember";
	formId.submit();
	}
	else{
		return;
	}
	
}

/*function insertMember(){
	
	selectMember();	
	
	var formId = document.getElementById('formId');
	formId.action = "/admin/insertMember";
	
	var modalFooter = document.getElementById('modalFooter');
	modalFooter.innerHTML = '';
	var str = '';
	
	str += '<input type="submit" class="btn btn-primary" value="추가"></button>';
	str += '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
	
	modalFooter.innerHTML += str;
}
	*/




