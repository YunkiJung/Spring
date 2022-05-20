function regMemImg () {
	//var formData = $("#imgForm").serialize();
	
	 var form = $('#imgForm')[0];  	    
    // Create an FormData object          
    var data = new FormData(form); 
	
	$.ajax({
		url: '/member/regMemImg', //요청경로
		enctype: 'multipart/form-data',  
    	type: 'post',
    	processData: false,    
        contentType: false,      
        cache: false,    
    	data:data, //필요한 데이터 '데이터이름':값
    	async: false,
    	success: function(result) {
      		$('#imgChange').attr('src','/resources/member/img/'+ result +'');
    	},
    	error: function(){
      		//ajax 실행 실패 시 실행되는 구간
       		alert('실패');
    	}
	});
}
