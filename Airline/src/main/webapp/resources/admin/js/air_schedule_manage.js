


/*new tempusDominus.TempusDominus(document.getElementById('datetimepicker1'), {
    display: { 
        components: {
            seconds: false,
            useTwentyfourHour: true,
        },
        icons: {
            type: 'icons',
            time: 'fa fa-solid fa-clock',
            date: 'fa fa-solid fa-calendar',
            up: 'fa fa-solid fa-arrow-up',
            down: 'fa fa-solid fa-arrow-down',
            previous: 'fa fa-solid fa-chevron-left',
            next: 'fa fa-solid fa-chevron-right',
            today: 'fa fa-solid fa-calendar-check',
            clear: 'fa fa-solid fa-trash',
            close: 'fas fa-solid fa-xmark'
        },
    },
    
});*/

/* $(function() {
  
 });*/
/*$('#datetimepicker1').tempusDominus();*/
/* $('#datetimepicker1').datetimepicker({
     format: "DD/MM/YYYY HH:mm",
     minDate: moment()
   });*/
/*$(function () {
            $('#datetimepicker1').datetimepicker({
                minDate: new Date(),
                // minDate: '03/06/2019',
                format: 'MM/DD/YYYY H:s A'
            });
        });*/
        
//$('#listContainer').children('tbody').children('tr').click(function(){
$('#listContainer').find('tr').click(function(){
	//alert('11');
	//alert($(this).find('td:eq(1)').html().substr(0, 3));
	//alert($(this).find('td:eq(1)').html().substr(10, 3));
	var airScheCode = $(this).find('td:eq(0)').html();
	var departurePortCode = $(this).find('td:eq(1)').html().substr(0, 3);
	var arrivalPortCode = $(this).find('td:eq(1)').html().substr(10, 3);
	var planeCode = $('input[name=planeCode]').val();
	
	selectAirSche(airScheCode, departurePortCode, arrivalPortCode, planeCode);
})
 
function selectAirSche(airScheCode, departurePortCode, arrivalPortCode, planeCode){
	
	
	var infoModal = new bootstrap.Modal(document.getElementById('infoModal'));
	
	/*$('#datepicker').datepicker({
		dateFormat: 'YYYY-MM-DD',
		minDate: 0
	});*/
			
	/*$('#timepicker').timepicker({
		timeFormat: 'HH:mm:ss',
		minTime: '0'
	});*/
	
	
	/*if(arguments.length === 3){
		airScheCode = arguments[0];
		planeCode = arguments[1];
		arrivalPortCode = arguments[2]; 
	}
	else{
		airScheCode = '-';
		planeCode = arguments[0]; 
	}*/
	
	
	$.ajax({
   url: '/admin/selectAirSche', //요청경로
    type: 'post',
    data:{'airScheCode':airScheCode}, //필요한 데이터 '데이터이름':값
    success: function(result) {
	
	
	//if(result.spareSeat != undefined){
	$('#airScheCode').val(airScheCode);
	
	$('select[name=planeCode]').val(planeCode).prop('selected',true).attr('readonly', true);
	
	/*$('select[name=pathCode]').val(result.pathCode).prop('selected', true).prop('disabled', true);*/
	$('input[name=departurePortCode]').val(departurePortCode).prop('readonly', true);
	$('select[name=arrivalPortCode]').val();
	var str = $('<option>' + arrivalPortCode + '</option>');
	$('select[name=arrivalPortCode]').append(str);
	$('select[name=teamCode]').val(result.teamCode).prop('readonly', true).prop('readonly', true);
	$('input[name=gateNum]').val(result.gateNum).prop('readonly', true);
	$('input[name=departureDate1]').val(result.departureDate.substr(0, 10)).prop('readonly', true);
	$('input[name=departureDate2]').val(result.departureDate.substr(11, 16)).prop('readonly', true);
	$('input[name=basePrice]').val(result.basePrice);
	$('input[name=spareSeat]').val(result.spareSeat);
		
		
	//}
	
	/*else{
	$('#airScheCode').val(result.airScheCode);
	$('select[name=planeCode]').val(planeCode).prop('selected',true).attr("disabled", true);
	$('select[name=departurePortCode]').val(arrivalPortCode).prop('selected', true).prop('disabled', true);
	$('select[name=arrivalPortCode]').prop('disabled', false);
	$('select[name=teamCode]').val(result.teamCode).prop('selected', true).attr("disabled", false);
	$('input[name=gateNum]').val(result.gateNum).attr("disabled", false);
	
	$('input[name=departureDate1]').val('').attr("disabled", false);
	$('input[name=departureDate2]').val('').attr("disabled", false);
	$('input[name=basePrice]').val(result.basePrice).attr("disabled", false);
	$('input[name=spareSeat]').val(result.spareSeat);
	}*/
	
	
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


/*function insertAirSche(planeCode){
	
	selectAirSche(planeCode);
	$('select[name=planeCode]').val(planeCode).prop('selected', true);
	var modalFooter = document.getElementById('modalFooter');
	modalFooter.innerHTML = '';
	var str = '';
	
	str += '<button type="button" class="btn btn-primary" onclick="insertAirScheInfo();">추가</button>';
	str += '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
	
	modalFooter.innerHTML += str;
	
	//SPARE_SEAT의 데이터가 넘어가지 않도록 disabled 속성 추가
	
}*/
function insertAirSche(planeCode){
	var infoModal = new bootstrap.Modal(document.getElementById('infoModal'));
	
	$.ajax({
   url: '/admin/insertAirScheSet', //요청경로
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
		$('input[name=departurePortCode]').val(result.final.finalArrivalPortCode).attr('readonly', true);
		$('select[name=arrivalPortCode]').val('');
		
		for(var i = 0; i < result.arrivalPortList.length; i++){
			var str = $('<option>' + result.arrivalPortList[i] + '</option>');
			$('select[name=arrivalPortCode]').append(str);
		}
		
		
		$('input[name=gateNum]').val('');
		
		
		$('input[name=departureDate1]').val('').attr('readonly', false);
		$('input[name=departureDate2]').val('').attr('readonly', false);
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
	//document.getElementById('departureDate').value = document.getElementById('datetimepicker1').value;
	
	var departurePortCode = $('input[name=departurePortCode]').val();
	var arrivalPortCode = $('select[name=arrivalPortCode]').val();
	
	
	$.ajax({
   url: '/admin/selectPathCode', //요청경로
    type: 'post',
    data:{'departurePortCode':departurePortCode, 'arrivalPortCode':arrivalPortCode}, //필요한 데이터 '데이터이름':값
    success: function(result) {
	$('input[name=pathCode]').val(result);
	var formId = document.getElementById('formId');
	formId.action = "/admin/insertAirSche";
	formId.submit();
    },
    error: function(){
      //ajax 실행 실패 시 실행되는 구간
       alert('실패');
    }
	});
	
}

	

