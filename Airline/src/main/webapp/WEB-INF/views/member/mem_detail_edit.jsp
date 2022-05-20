<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/member/css/mem_detail_edit.css">
</head>
<body>
<div class="container detailContainer">
    <div class="main-body elevation-2" style="background-color: #5B7DB1; padding: 1.5em; border-radius: 1em; margin-top: 10px;">
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                  <div class="lb-wrap">
                   	<a href="javascript:void(0);" onclick="$('#imgUpload').trigger('click')" class="imgUploadBtn">
                   		<c:choose>
                   			<c:when test="${empty selectMemImg}">
                    			<img src="/resources/member/img/profileImg.jpg" id="imgChange" class="rounded-circle memImg" width="150" height="150">
                    		</c:when>
                    		<c:otherwise>
                    			<img src="/resources/member/img/${selectMemImg}" id="imgChange" class="rounded-circle memImg" width="150" height="150">
                  		</c:otherwise>
                    	</c:choose>
					</a>
					<form action="/member/regMemImg" method="post" enctype="multipart/form-data" id="imgForm">
						<input type="file" id="imgUpload" style="display:none" name="memImg" onchange="regMemImg();" >
					</form>
                  </div>
                    <div class="mt-3">
                      <h4>${memDetail.memName }</h4>
                      <p class="text-muted font-size-sm">${memDetail.countryCode }</p>
                    </div>
                  </div>
                </div>
              </div>
            <div class="card mt-3" style="height: 10em;">
                <ul class="list-group list-group-flush">
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <h2 class="point">포인트</h2>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                    <h4 class="pointH4">KH POINT : <span class="spanPointH3">${memDetail.points }</span> point</h4>
                  </li>
                </ul>
              </div>
            </div>
            
            <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body" style="height: 27.5em;">
              <form action="/member/memDetailEdit" method="post">
                  <div class="row">
                    <div class="col-3">
                      <h6 class="mb-0">이름 :</h6>
                    </div>
                    <div class="col-9">
                      <input type="text" value="${memDetail.memName }" name="memName" class="inputInfo">
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-3">
                      <h6 class="mb-0">생년월일 :</h6>
                    </div>
                    <div class="col-9">
                      <input type="date" value="${memDetail.birthDate }" name="birthDate" class="inputInfo">
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-3">
                      <h6 class="mb-0">이메일 : </h6>
                    </div>
                    <div class="col-9 text-secondary">
                    	<div class="row">
                    	<div class="col-5">
                     		<input type="text" value="${memDetail.memEmail }" name="memEmail" class="inputInfo">
                    	</div>
                    	</div>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-3">
                      <h6 class="mb-0">연락처 :</h6>
                    </div>
                    <div class="col-9 text-secondary">
                      <input type="text" value="${memDetail.memPhone }" name="memPhone" class="inputInfo">
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-3">
                      <h6 class="mb-0">주소 :</h6>
                    </div>
                    <div class="col-9 text-secondary">
                     <input type="text" value="${memDetail.memAddr }" name="memAddr" class="inputInfo">
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-3">
                      <h6 class="mb-0">성별 :</h6>
                    </div>
                    <div class="col-9">
                      <select id="inputState" class="form-select" name="gender" style="width: 13em; height: 2.5em;">
				        <option <c:if test="${memDetail.gender eq 'MALE' }">selected</c:if> value="MALE">남자</option>
				        <option <c:if test="${memDetail.gender eq 'FEMALE' }">selected</c:if> value="FEMALE">여자</option>
				      </select>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-12" style="margin-left: 16em;">
                    	<div class="col-sm-6">
                    	<button type="submit" class="btn btn-primary" style="width: 10em;">저장</button>
                    	<button type="button" class="btn btn-primary" onclick="location.href='/member/memberDetail';" style="width: 10em;">취소</button>
 	                   </div>
                  </div>
                </div>
                </form>
              </div>
             </div>
           </div>
         </div>
       </div>
      </div>
   <script type="text/javascript" src="/resources/member/js/mem_detail_edit.js?ver=15"></script>
</body>
</html>