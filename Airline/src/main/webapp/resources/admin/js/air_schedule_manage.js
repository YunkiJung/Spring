

$('#listContainer').find('tr').click(function(){
	var airScheCode = $(this).find('td:eq(0)').html();
	var departurePortCode = $(this).find('td:eq(1)').html().substr(0, 3);
	var arrivalPortCode = $(this).find('td:eq(1)').html().substr(10, 3);
	var planeCode = $('input[name=planeCode]').val();
	
	selectAirSche(airScheCode, departurePortCode, arrivalPortCode, planeCode);
})
 
function selectAirSche(airScheCode, departurePortCode, arrivalPortCode, planeCode){
	
	
	var infoModal = new bootstrap.Modal(document.getElementById('infoModal'));
	
	$.ajax({
   url: '/admin/selectAirSche', //요청경로
    type: 'post',
    data:{'airScheCode':airScheCode}, //필요한 데이터 '데이터이름':값
    success: function(result) {
	
	
	$('#airScheCode').val(airScheCode);
	
	$('select[name=planeCode]').val(planeCode).prop('selected',true).attr('readonly', true);
	
	$('input[name=departurePortCode]').val(departurePortCode).prop('readonly', true);
	$('select[name=arrivalPortCode]').empty();
	var str = $('<option>' + arrivalPortCode + '</option>');
	$('select[name=arrivalPortCode]').append(str);
	$('select[name=teamCode]').val(result.teamCode).prop('readonly', true).prop('readonly', true);
	$('input[name=gateNum]').val(result.gateNum).prop('readonly', true);
	$('input[name=departureDate1]').val(result.departureDate.substr(0, 10)).prop('readonly', true);
	$('input[name=departureDate2]').val(result.departureDate.substr(11, 16)).prop('readonly', true);
	$('input[name=basePrice]').val(result.basePrice);
	$('input[name=spareSeat]').val(result.spareSeat);
		
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

function insertAirSche(planeCode){
	var infoModal = new bootstrap.Modal(document.getElementById('infoModal'));
	
	$.ajax({
   url: '/admin/setInsertAirSche',
    type: 'post',
    data:{'planeCode':planeCode}, 
    success: function(result) {
      let basePriceTag = document.getElementById('basePrice');
      let gateNumTag = document.getElementById('gateNum');
      
      basePriceTag.value = null;
      basePriceTag.readOnly = false;
      gateNumTag.readOnly = false;
      gateNumTag.value = null;
      
		$('#airScheCode').val();
		$('select[name=planeCode]').val(planeCode).prop('selected',true).attr('readonly', true);
		if(result.final.finalArrivalPortCode != null){
		$('input[name=departurePortCode]').val(result.final.finalArrivalPortCode).attr('readonly', true);
		}
		else{
		$('input[name=departurePortCode]').val('ICN').attr('readonly', true);
		}
		$('select[name=arrivalPortCode]').val('');
		$('select[name=arrivalPortCode]').empty();
		
		for(var i = 0; i < result.arrivalPortList.length; i++){
			var str = $('<option>' + result.arrivalPortList[i] + '</option>');
			$('select[name=arrivalPortCode]').append(str);
		}
		
		
		$('input[name=gateNum]').val('');
		
		var date1 = result.final.finalArrivalDate.substr(0, 10);
		var date2 = result.final.finalArrivalDate.substr(11, 8);
		$('input[name=departureDate1]').val(date1).attr('readonly', false);
		$('input[name=departureDate2]').val(date2).attr('readonly', false);
		$('input[name=basePrice]').val('');
		$('input[name=spareSeat]').val('');
		
		var modalFooter = document.getElementById('modalFooter');
		modalFooter.innerHTML = '';
		var str = '';
		
		str += '<button type="button" class="btn btn-primary" onclick="insertAirScheInfo();">추가</button>';
		str += '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
		
		modalFooter.innerHTML += str;
		
		
		infoModal.show();
      
      
    },
    error: function(){
       alert('실패');
    }
	});
	
}

function insertAirScheInfo(){
	document.getElementById('departureDate').value = document.getElementById('datepicker').value + ' ' + document.getElementById('timepicker').value;
	
	var departurePortCode = $('input[name=departurePortCode]').val();
	var arrivalPortCode = $('select[name=arrivalPortCode]').val();
	
	
	$.ajax({
	   url: '/admin/selectPathCode',
	    type: 'post',
	    data:{'departurePortCode':departurePortCode, 'arrivalPortCode':arrivalPortCode}, //필요한 데이터 '데이터이름':값
	    success: function(result) {
		$('input[name=pathCode]').val(result);
		var formId = document.getElementById('formId');
		formId.action = "/admin/insertAirSche";
		formId.submit();
	    },
	    error: function(){
	       alert('실패');
	    }
	});
	
}

	

