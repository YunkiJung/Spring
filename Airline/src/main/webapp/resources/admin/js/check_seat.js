/**
 * 
 */

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
function nullCheck(){
	
	
	
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
		var airScheCode = $('input[name=adminAirScheCode]').val();
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
			    
					$('input[name=checkbox]:not(:checked)').each(function(){
						$(this).val().prop('disabled', true);
					});
					
			    },
			    error: function(){
			       alert('실패');
			    }
			});
	}
	
	
	
}