
function changeEmp(isUpdate){
	//수정
	if(isUpdate == 3){
		Swal.fire({
		title: '수정 하시겠습니까?',
		text: "",
		icon: 'question', showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '승인',
		cancelButtonText: '취소' }).then((result) => {
			if (result.isConfirmed) {
				formId.action = "/admin/updateEmp";
				var empPhone = document.getElementById('empPhone');
				empPhone.value = document.getElementById('empPhone1').value + '-' + document.getElementById('empPhone2').value + '-' + document.getElementById('empPhone3').value;
				formId.submit();
			}
		});
	}
	//추가
	else{
		Swal.fire({
		title: '수정 하시겠습니까?',
		text: "",
		icon: 'question', showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '승인',
		cancelButtonText: '취소' }).then((result) => {
			if (result.isConfirmed) {
				formId.action = "/admin/insertEmp";
				var empPhone = document.getElementById('empPhone');
				empPhone.value = document.getElementById('empPhone1').value + '-' + document.getElementById('empPhone2').value + '-' + document.getElementById('empPhone3').value;
				formId.submit();
			}
		});
	}
}

$(document).on("click", "#deleteEmp", (function () {
		 Swal.fire({
			 title: '삭제 하시겠습니까?',
			  text: "",
			   icon: 'warning', showCancelButton: true,
			    confirmButtonColor: '#3085d6',
			     cancelButtonColor: '#d33',
			      confirmButtonText: '승인',
			       cancelButtonText: '취소' }).then((result) => {
				 if (result.isConfirmed) {
						var formId = document.getElementById('formId');
						formId.action = "/admin/deleteEmp";
						formId.submit();
					}
			 });
			 })
);

//모달창 닫힐 떄 이벤트
const infoModal = document.getElementById('infoModal');
infoModal.addEventListener('hidden.bs.modal', event => {
	//벨리데이션 에러 메시지 삭제
	$('#infoModal div.error').remove();
	
	document.getElementById('formId').reset();
	
});


$('#formId').validate({
		   debug: false,
		   
		   rules: {
			  empId: {
				 required: true
				},
			  empPw: {
				 required: true
				},
			  empName: {
				 required: true
				},
			  empPhone1: {
				 required: true
				},
			  empPhone2: {
				 required: true
				},
			  empPhone3: {
				 required: true
				},
			  empAddr: {
				 required: true
				},
			  birthDate: {
				 required: true
				},
			  hireDate: {
				 required: true
				},
			  deptCode: {
				 required: true
				},
			  teamCode: {
				 required: true
				},
			  managerCode: {
				 required: true
				},
			  jobCode: {
				 required: true
				},
			  empEmail: {
				 required: true
				},
			  nationality: {
				 required: true
				},
			  isDomestic: {
				 required: true
				},
			  isInternational: {
				 required: true
				},
			  isAdmin: {
				 required: true
				}
		   },
		   messages: {
			  empId: {
				 required: "ID를 입력해주세요"
				},
			  empPw: {
				 required: "패스워드를 입력해주세요"
				},
			  empName: {
				 required: "이름을 입력해주세요"
				},
			  empPhone1: {
				 required: "ex)010"
				},
			  empPhone2: {
				 required: 'ex)0000'
				},
			  empPhone3: {
				 required: 'ex)0000'
				},
			  empAddr: {
				 required: '주소를 입력해주세요'
				},
			  birthDate: {
				 required: '생년월일을 입력해주세요'
				},
			  hireDate: {
				 required: '고용일을 입력해주세요'
				},
			  deptCode: {
				 required: '부서코드를 선택해주세요'
				},
			  jobCode: {
				 required: '코드를 선택해주세요'
				},
			  empEmail: {
				 required: '이메일을 입력해주세요'
				},
			  nationality: {
				 required: '국가를 선택해주세요'
				},
			  isDomestic: {
				 required: 'Y/N'
				},
			  isInternational: {
				 required: 'Y/N'
				}
		   },
		   errorElement:'div',
		   errorPlacement: function (error, element){
		     	error.insertAfter(element);
		     	
		     	error.css('color', 'red');
		     	error.css('font-size', '12px');
		     	//event.preventDefault();
		     	/*event.stopImmediatePropagation();*/
		   },      
		   
		   submitHandler: function(form) {
				//$('#updateEmp').trigger('click');
				//alert($('#modalFooter').children().length);
				changeEmp($('#modalFooter').children().length);
				
				
			// var formId = document.getElementById('formId');
    		//formId.action = "/admin/updateEmp";
			//var empPhone = document.getElementById('empPhone');
			//empPhone.value = document.getElementById('empPhone1').value + '-' + document.getElementById('empPhone2').value + '-' + document.getElementById('empPhone3').value; 
		      //form.submit();
		   }
	});

function selectEmp(){
	var infoModal = new bootstrap.Modal(document.getElementById('infoModal'))
	var empCode;
	
	if(arguments.length === 1){
		empCode = arguments[0];
	}
	else{
		empCode = '-';
	}
	
	
	$.ajax({
   url: '/admin/selectEmp',
    type: 'post',
    data:{'empCode':empCode},
    success: function(result) {
	
	$('#empCode').val(result.empCode);
	$('#empId').val(result.empId);
	$('input[name=empPw]').val(result.empPw);
	$('#empName').val(result.empName);
	if(result.gender === "MALE"){
			$('#male').prop('checked', true);
		}
		else{
			$('#female').prop('checked', true);
		}
	if(result.empPhone != undefined){
	$('#empPhone1').val(result.empPhone.substr(0, 3));
	$('#empPhone2').val(result.empPhone.substr(4, 4));
	$('#empPhone3').val(result.empPhone.substr(9, 4));
	}
	else{
	$('#empPhone1').val('');
	$('#empPhone2').val('');
	$('#empPhone3').val('');
	}
	$('input[name=empAddr]').val(result.empAddr);
	$('input[name=birthDate]').val(result.birthDate);
	$('input[name=hireDate]').val(result.hireDate);
	$('select[name=deptCode]').val(result.deptCode).prop('selected', true);
	$('select[name=teamCode]').val(result.teamCode).prop('selected', true);
	$('select[name=managerCode]').val(result.managerCode).prop('selected', true);
	$('select[name=jobCode]').val(result.jobCode).prop('selected', true);
	$('input[name=empEmail]').val(result.empEmail);
	$('select[name=nationality]').val(result.nationality).prop('selected', true);
	$('select[name=isDomestic]').val(result.isDomestic).prop('selected', true);
	$('select[name=isInternational]').val(result.isInternational).prop('selected', true);
	
	if(result.empCode != undefined){
	var modalFooter = document.getElementById('modalFooter');
	modalFooter.innerHTML = '';
	var str = '';
	
	str += '<button type="button" class="btn btn-danger" id="deleteEmp">삭제</button>';
	str += '<button type="submit" class="btn btn-primary" id="updateEmp">수정</button>';
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



function insertEmp(){
	var modalFooter = document.getElementById('modalFooter');
	modalFooter.innerHTML = '';
	var str = '';
	
	str += '<button type="submit" class="btn btn-primary" id="insertEmpInfo">추가</button>';
	str += '<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>';
	
	modalFooter.innerHTML += str;

	var infoModal = new bootstrap.Modal(document.getElementById('infoModal'));
	infoModal.show();
	
}



//});


	



