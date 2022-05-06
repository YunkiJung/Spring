 
function selectAirSche(){
	var infoModal = new bootstrap.Modal(document.getElementById('infoModal'));
	var airScheCode;
	
	if(arguments.length === 1){
		airScheCode = arguments[0];
	}
	else{
		airScheCode = '-';
	}
	
	
	$.ajax({
   url: '/admin/selectAirSche', //요청경로
    type: 'post',
    data:{'airScheCode':airScheCode}, //필요한 데이터 '데이터이름':값
    success: function(result) {
	
	if(result.spareSeat != undefined){
	$('#airScheCode').val(result.airScheCode);
	$('select[name=planeCode]').val(result.planeCode).prop('disabled',true).prop('selected', true);
	$('select[name=pathCode]').val(result.pathCode).prop('selected', true).prop('disabled', true);
	$('select[name=teamCode]').val(result.teamCode).prop('selected', true).prop('disabled', true);
	$('input[name=gateNum]').val(result.gateNum).prop('disabled', true);
	$('#departureDate1').val(result.departureDate.substr(0, 10)).prop('disabled', true);
	$('#departureDate2').val(result.departureDate.substr(11, 16)).prop('disabled', true);
	$('input[name=basePrice]').val(result.basePrice);
	$('input[name=spareSeat]').val(result.spareSeat);
		
		
	}
	
	else{
	$('#airScheCode').val(result.airScheCode);
	$('select[name=planeCode]').val(result.planeCode).prop('selected',true);
	$('select[name=pathCode]').val(result.pathCode).prop('selected', true);
	$('select[name=teamCode]').val(result.teamCode).prop('selected', true);
	$('input[name=gateNum]').val(result.gateNum);
	$('#departureDate1').val('');
	$('#departureDate2').val('');
	$('input[name=basePrice]').val(result.basePrice);
	$('input[name=spareSeat]').val(result.spareSeat);
		
	}
	
	
	if(result.airScheCode != undefined){
	var modalFooter = document.getElementById('modalFooter');
	modalFooter.innerHTML = '';
	var str = '';
	
	str += '<button type="button" class="btn btn-danger" onclick="deleteAirSche();">삭제</button>';
	str += '<button type="button" class="btn btn-primary" onclick="updateAirSche();">수정</button>';
	str += '<button type="button" class="btn btn-primary" onclick="selectSeatInfo();">좌석 조회</button>';
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

function deleteAirSche(){
	var formId = document.getElementById('formId');
	if(confirm('정말 삭제하시겠습니까?')){
	formId.action = "/admin/deleteAirSche";
	formId.submit();
	}
	else{
		return;
	}
	
}

function updateAirSche(){
	var formId = document.getElementById('formId');
	if(confirm('정말 수정하시겠습니까?')){
	formId.action = "/admin/updateAirSche";
	document.getElementById('departureDate').value = document.getElementById('departureDate1').value + ' ' + document.getElementById('departureDate2').value;
	formId.submit();
	}
	else{
		return;
	}
	
	
}

function selectSeatInfo(){
	var formId = document.getElementById('formId');
	formId.action = "/admin/selectSeatInfo";
	formId.submit();
	
}


function insertAirSche(){
	
	selectAirSche();
	
	var modalFooter = document.getElementById('modalFooter');
	modalFooter.innerHTML = '';
	var str = '';
	
	str += '<button type="button" class="btn btn-primary" onclick="insertAirScheInfo();">추가</button>';
	str += '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
	
	modalFooter.innerHTML += str;
	
	//SPARE_SEAT의 데이터가 넘어가지 않도록 disabled 속성 추가
	
}

function insertAirScheInfo(){
	document.getElementById('departureDate').value = document.getElementById('departureDate1').value + ' ' + document.getElementById('departureDate2').value;
	var formId = document.getElementById('formId');
	formId.action = "/admin/insertAirSche";
	formId.submit();
}

	


