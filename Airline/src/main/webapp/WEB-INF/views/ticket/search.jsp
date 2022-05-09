<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/ticket/css/search.css">
<style>
.btn-group>.btn:not(:first-child):not(:last-child):not(.dropdown-toggle){
	border-bottom-left-radius: 0.5em;
	border-top-left-radius: 0.5em;
}

.gps-container{
	width: 400px;
	margin: 0 auto;
}
</style>
</head>
<body>
 <div class="tm-section tm-bg-img" id="tm-section-1">
     <div class="tm-bg-white ie-container-width-fix-2">
         <div class="container ie-h-align-center-fix">
             <div class="row">
                 <div class="col-xs-12 ml-auto mr-auto ie-container-width-fix">
                     <form action="/ticket/searchAirSchedule" method="post" class="tm-search-form tm-section-pad-2" id="searchForm">
                         <div class="form-row tm-search-form-row">
                             <div class="form-group tm-form-element tm-form-element-100">
                                 <i class="fa fa-map-marker fa-2x tm-form-element-icon"></i>
                                 <input type="text" class="form-control" id="fromCity" placeholder="출발지" list="fromPortList" name="departurePortCode" autocomplete="none">
								 <datalist id="fromPortList">
								 </datalist>
                             </div>
                             <div class="form-group tm-form-element tm-form-element-100">
                                 <i class="fa fa-map-marker fa-2x tm-form-element-icon"></i>
                                 <input type="text" class="form-control" id="toCity" placeholder="도착지" list="toPortList" name="arrivalPortCode"  autocomplete="none">
                                 <datalist id="toPortList">
    
								 </datalist>
                             </div>
                             <div class="tm-form-element tm-form-element-2">
                      <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                            <input type="radio" class="btn-check" name="hasReturn" id="oneway" autocomplete="off" value="N"> 
                         <label class="btn btn-outline-secondary trvRadio" for="oneway" style="width: 8em; font-size: 0.8em; padding-top: 1em;"><span style="font-size: 1.4em;">편도</span></label >
                    <input type="radio" class="btn-check" name="hasReturn" id="return"autocomplete="off" value="Y" checked>
                 <label class="btn btn-outline-secondary trvRadio" for="return" style="width: 8em; font-size: 0.8em; padding-top: 1em;"><span style="font-size: 1.4em;">왕복</span></label>
              </div>
           </div>
                 </div>
                 <div class="form-row tm-search-form-row">
                      <div class="form-group tm-form-element tm-form-element-50">
                         <i class="fa fa-calendar fa-2x tm-form-element-icon"></i>
                         <input type="date" class="form-control" value="${firstDefaultDate }" placeholder="mm/yy" name="departureDate">
                     </div>
                     <div class="form-group tm-form-element tm-form-element-50">
                         <i class="fa fa-calendar fa-2x tm-form-element-icon"></i>
                         <input type="date" class="form-control" value="${secondDefaultDate }" placeholder="도착" id="returnDate" name="returnDate">
                     </div>
                     <div class="form-group tm-form-element tm-form-element-2">                                            
                         <select name="count" class="form-control tm-select" id="count">
                             <option value="">Adult</option>
                             <option value="1">1</option>
                             <option value="2">2</option>
                             <option value="3">3</option>
                             <option value="4">4</option>
                             <option value="5">5</option>
                             <option value="6">6</option>
                             <option value="7">7</option>
                             <option value="8">8</option>
                             <option value="9">9</option>
                         </select>
                         <i class="fa fa-2x fa-user tm-form-element-icon"></i>
                     </div>
                     <div class="form-group tm-form-element tm-form-element-2">
                         <button type="button" class="btn btn-primary tm-btn-search" style="margin-left: 30em; " id="searchBtn">Search</button>
                            </div>
                          </div>
                          <div class="form-row clearfix pl-2 pr-2 tm-fx-col-xs">
                              <a href="#" class="ie-10-ml-auto ml-auto mt-1 tm-font-semibold tm-color-primary">Need Help?</a>
                          </div>
                    </form>
                </div>                        
            </div>      
        </div>
    </div>                  
</div>

<div class="gps-container">
	<div id="map">
	</div>
	<div id="cityName">
		
	</div>
	<div id="weather">
		
	</div>
</div>
            
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyACnhJTi9hf41lTeAMr97iz8i3QtRpycvQ&callback=initMap&v=weekly" async></script>
<script type="text/javascript" src="/resources/ticket/js/search.js?ver=5"></script>
</body>
</html>