<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>   
 
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/assets/images/favicon.png">
    <title>Severny admin Template - The Ultimate Multipurpose admin template</title>   
   <link rel="canonical" href="https://www.wrappixel.com/templates/severny-admin-template/" />
    <!-- Custom CSS -->
    <link href="${path}/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${path}/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/extra-libs/prism/prism.css">
    <link href="${path}/resources/commonCSS/index.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
   function openWindowPop(url, name){
       var options = 'top=10, left=10, width=1000, height=800, status=no, menubar=no, toolbar=no, resizable=no';
       window.open(url, name, options);
   }
   
   $(function() {
		$('td > a').click(function() {
			$("a[href^='http']").attr('target','_blank');
		});
	});
</script>


</head>

<body onload="printClock()">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <div class="app-container"></div>
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- 좌측고정 메뉴바 -->
        <%@ include file="/WEB-INF/views/common/leftMenu.jsp" %>
        <!-- 좌측고정 메뉴바 -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- *************************************************************** -->
                <!-- Start First Cards -->
                <!-- *************************************************************** -->
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="card bg-light-info border-0">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <a href="javascript:openWindowPop('http://192.168.219.107/roundcube/', 'popup');" 
                                        class="btn btn-info rounded-circle btn-circle-lg text-white mb-2">
                                        <i data-feather="mail"></i>
                                    </a>
                                </div>
                                <div>
                                    <h2 class="mb-0 font-weight-medium">이메일</h2>
                                    <h6 class="text-muted font-weight-normal mb-0">Email</h6>
 
                                </div>
                            </div>
                      </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="card bg-light-danger border-0">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <a href="approvallist.ap"
                                        class="btn btn-danger rounded-circle btn-circle-lg text-white mb-2">
                                        <i data-feather="clipboard"></i>
                                    </a>
                                </div>
                                <div>
                                    <h2 class="mb-0 font-weight-medium">전자결재</h2>
                                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Electronic Document Management</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="card bg-light-warning border-0">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <a href="msgIndex.me"
                                        class="btn btn-warning rounded-circle btn-circle-lg text-white mb-2">
                                        <i data-feather="calendar"></i>
                                    </a>
                                </div>
                                <div>
                                    <h2 class="mb-0 font-weight-medium">쪽지</h2>
                                    <h6 class="text-muted font-weight-normal mb-0">Messenger</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="card bg-light-success border-0">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <a href="javascript:window.open('${path}/chat.ch', '그루비 채팅', 'width=20%');"
                                        class="btn btn-success rounded-circle btn-circle-lg text-white mb-2">
                                        <i data-feather="message-circle"></i>
                                    </a>
                                </div>
                                <div>
                                    <h2 class="mb-0 font-weight-medium">채팅</h2>
                                    <h6 class="text-muted font-weight-normal mb-0">chat</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End First Cards -->
                <!-- *************************************************************** -->
               <!-- *************************************************************** -->
                <!-- Start Earnings & Carousel Widget -->
                <!-- *************************************************************** -->
                <div class="row align-items-stretch">
                    <div class="col-xl-9 col-lg-8 col-md-12 d-flex align-items-stretch justify-content-strech">
                    <div class="card w-100">
                        <!-- skill bars -->
               
                       <div class="card-body">
               
                  <h4 class="card-title">이번달 근태 현황</h4>   
                  <h5 class="mt-4">
                     업무 <span class="pull-right">${attendinrate}%</span>
                  </h5>
                  <div class="progress ">
                     <div
                        class="progress-bar bg-info wow animated progress-animated"
                        style="width: ${attendinrate}%; height: 6px;" role="progressbar">
                        <span class="sr-only">60% Complete</span>
                     </div>
                  </div>
                  <h5 class="mt-4">
                     지각 <span class="pull-right">${laterate}%</span>
                  </h5>
                  <div class="progress ">
                     <div
                        class="progress-bar bg-warning wow animated progress-animated"
                        style="width: ${laterate}%; height: 6px;" role="progressbar">
                        <span class="sr-only">60% Complete</span>
                     </div>
                  </div>                                             
                  <h5 class="mt-4">
                     연장 <span class="pull-right">${overrate}%</span>
                  </h5>
                  <div class="progress">
                     <div
                        class="progress-bar bg-success wow animated progress-animated"
                        style="width: ${overrate}%; height: 6px;" role="progressbar">
                        <span class="sr-only">60% Complete</span>
                     </div>
                  </div>
                  <h5 class="mt-4">
                     기본 근무 <span class="pull-right">${workrate}%</span>
                  </h5>
                  <div class="progress ">
                     <div
                        class="progress-bar bg-facebook wow animated progress-animated"
                        style="width:${workrate}%; height: 6px;" role="progressbar">
                        <span class="sr-only">60% Complete</span>
                     </div>
                  </div>
                  <h5 class="mt-4">
                     누적 근무 <span class="pull-right">${monthrate}%</span>
                  </h5>
                  <div class="progress ">
                     <div
                        class="progress-bar bg-danger wow animated progress-animated"
                        style="width:${monthrate}%; height: 6px;" role="progressbar">
                        <span class="sr-only">60% Complete</span>
                     </div>
                  </div>                  
               </div>
            
                    </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 col-md-12 d-flex align-items-stretch justify-content-strech">
                        <div class="card w-100">
                            <div class="card-body position-relative">
                                <h4 class="attendenceDay card-title mb-4" id="today">일일 근태</h4>
                                <h4 class="attendenceTime card-title mb-4" id="clock"></h4>
                                <div id="carouselExampleFade" class="carousel slide status-carousel"
                                    data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">                                            
                                            <p class="text-muted">
                                    출근시간<span class="attendenceChk"> : 
                                    <c:if test="${list[0].attendin == null}" >
                                       <div id="attendin">미등록</div>
                                    </c:if>
                                    <c:if test="${list[0].attendin != null}" >
                                       <div id="attendin">${list[0].attendin}</div>
                                    </c:if>                           
                                    </span>
                                 </p>
                                 <p class="text-muted">
                                    퇴근시간<span class="attendenceChk"> : 
                                    <c:if test="${list[1].attendout == null}" >
                                       <div id="attendout">미등록</div>
                                    </c:if>
                                    <c:if test="${list[1].attendout != null}" >
                                       <div id="attendout">${list[1].attendout}</div>
                                    </c:if>
                                    </span>
                                 </p>
                                        </div>
                                    </div> 
                                    <!-- carousel-item active -->                                    
                                    <div class="btn_wrap">
                              <button type="button" class="attendin btn waves-effect waves-light btn-outline-info btnAttendence">업무시작</button>
                                  <button type="button" class="attendout btn waves-effect waves-light btn-outline-info btnAttendence">업무종료</button>
                                  <!-- <div class="col-xlg-6 col-lg-6 mb-4">
                                         <div class="card-body">
                                            <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                                               <div class="btn-group" role="group">
                                                     <button id="btnGroupVerticalDrop1" type="button"
                                                       class="btn dropdown-toggle btn-outline-info" data-toggle="dropdown"
                                                       aria-haspopup="true" aria-expanded="false">
                                                       상태변경
                                                   </button>
                                                       <div class="dropdown-menu" aria-labelledby="btnGroupVerticalDrop1">
                                                          <a class="attendin dropdown-item" href="javascript:void(0)">업무</a>
                                                       <a class="attendout dropdown-item" href="javascript:void(0)">업무종료</a>
                                                       <a class="dropdown-item" href="javascript:void(0)">외근</a>
                                                       <a class="dropdown-item" href="javascript:void(0)">출장</a>
                                                       </div>
                                                  </div>
                                         </div> btn-group-vertical
                                     </div> 
                                  </div> -->
                              </div> <!-- btn_wrap -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- *************************************************************** -->
                <!-- End Earnings & Carousel Widget -->
                <!-- *************************************************************** -->
                <!-- *************************************************************** -->
                <!-- Start Top Leader Table -->
                <!-- *************************************************************** -->
                
                <div class="row" id="news">
                	<div class="col-12">
                        <div class="card">
                            <div class="card-body">
                            	<h4 class="card-title mb-4">분야별 주요뉴스</h4>
                            	<table>
                            		<c:forEach var="el" items="${el}" begin="0" end="7">
                            		<tr>
                            			<td class="news_line">${el}</td>
                            		</tr>
                            		</c:forEach>
                            	</table>
                            	<table id="rigthTb" style="margin-right:8%;">
                            		<c:forEach var="el" items="${el}" begin="8">
                            		<tr>
                            			<td>${el}</td>
                            		</tr>
                            		</c:forEach>
                            	</table>
                            </div>
                        </div>
                    </div>
                </div>
                
               <div class="row" id="weather">
                	<div class="col-12">
                        <div class="card">
                            <div class="card-body">
                            	<h4 class="card-title mb-4">주간 날씨</h4>
                            	<%-- <p id="status">
	                            	<c:forEach var="weatherImg" items="${weatherImg}">
	                            		${weatherImg}
	                            	</c:forEach>
                            	</p> --%>
                            	
                            	
                            	<div id="w_contents">
	                            	<c:forEach var="el_weather" items="${el_weather}" begin="2" end="6">
	                            		${el_weather}
	                            	</c:forEach>
                            	</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- *************************************************************** -->
                <!-- End Top Leader Table -->
                <!-- *************************************************************** -->
                
                <!-- *************************************************************** -->
                <!-- Start Top Leader Table -->
                <!-- *************************************************************** -->
                <!-- *************************************************************** -->
                <!-- End Top Leader Table -->
                <!-- *************************************************************** -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- customizer Panel -->
    <!-- ============================================================== -->
    <aside class="customizer">
        <a href="javascript:void(0)" class="service-panel-toggle"><i class="fa fa-spin fa-cog"></i></a>
        <div class="customizer-body">
            <div class="p-3 border-bottom">
                <!-- Sidebar -->
                <h5 class="font-weight-medium mb-2 mt-2">Layout Settings</h5>
                <div class="custom-control custom-checkbox mt-2">
                    <input type="checkbox" class="custom-control-input sidebartoggler" name="collapssidebar"
                        id="collapssidebar">
                    <label class="custom-control-label" for="collapssidebar">Collapse Sidebar</label>
                </div>
                <div class="custom-control custom-checkbox mt-2">
                    <input type="checkbox" class="custom-control-input" name="sidebar-position" id="sidebar-position">
                    <label class="custom-control-label" for="sidebar-position">Fixed Sidebar</label>
                </div>
                <div class="custom-control custom-checkbox mt-2">
                    <input type="checkbox" class="custom-control-input" name="header-position" id="header-position">
                    <label class="custom-control-label" for="header-position">Fixed Header</label>
                </div>
                <div class="custom-control custom-checkbox mt-2">
                    <input type="checkbox" class="custom-control-input" name="boxed-layout" id="boxed-layout">
                    <label class="custom-control-label" for="boxed-layout">Boxed Layout</label>
                </div>
            </div>
            <div class="p-3 border-bottom">
                <!-- Header BG -->
                <h5 class="font-weight-medium mb-2 mt-2">Header Backgrounds</h5>
                <ul class="theme-color">
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-navbarbg="skin1"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-navbarbg="skin2"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-navbarbg="skin3"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-navbarbg="skin4"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-navbarbg="skin5"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-navbarbg="skin6"></a>
                    </li>
                </ul>
                <!-- Header BG -->
            </div>
            <div class="p-3 border-bottom">
                <!-- Logo BG -->
                <h5 class="font-weight-medium mb-2 mt-2">Sidebar Backgrounds</h5>
                <ul class="theme-color">
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-sidebarbg="skin1"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-sidebarbg="skin2"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-sidebarbg="skin3"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-sidebarbg="skin4"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-sidebarbg="skin5"></a>
                    </li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link" data-sidebarbg="skin6"></a>
                    </li>
                </ul>
                <!-- Logo BG -->
            </div>
        </div>
    </aside>
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="${path}/resources/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${path}/resources/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="${path}/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <script src="${path}/resources/dist/js/app.min.js"></script>
    <script src="${path}/resources/dist/js/app.init-menusidebar.js"></script>
    <script src="${path}/resources/dist/js/app-style-switcher.js"></script>
    <script src="${path}/resources/dist/js/feather.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="${path}/resources/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="${path}/resources/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <!-- themejs -->
    <!--Menu sidebar -->
    <script src="${path}/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${path}/resources/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="${path}/resources/assets/libs/moment/min/moment.min.js"></script>
    <!--chartis chart-->
    <script src="${path}/resources/assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="${path}/resources/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <!--c3 charts -->
    <script src="${path}/resources/assets/extra-libs/c3/d3.min.js"></script>
    <script src="${path}/resources/assets/extra-libs/c3/c3.min.js"></script>
    <!--chartjs -->
    <script src="${path}/resources/assets/libs/chart.js/dist/Chart.min.js"></script>
    <script src="${path}/resources/assets/libs/gaugeJS/dist/gauge.min.js"></script>
    <script src="${path}/resources/dist/js/pages/dashboards/dashboard1.js"></script>

<!-- 날짜/시간 계산 -->
<script type="text/javascript">
   //입력 timestamp > date 24시간 변환
   function getTimeStamp(timeStamp) {              
       var date = new Date(timeStamp); // 타임 스탬프 >> Date 로 변환
       // moment 라이브러리 사용해 24시간 형태 날짜 및 시간 확인
       var nowDate = moment(date).format("YYYY-MM-DD HH:mm:ss");
       
       console.log(nowDate);
       return nowDate;
     }
   
    // 시간 출력
    function printClock() {
        var clock = document.getElementById("clock");
        var today = document.getElementById("today");
        var currentDate = new Date(); 
        var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
       
        var currentHours = addZeros(currentDate.getHours(),2); 
        var currentMinute = addZeros(currentDate.getMinutes(),2);
        var currentSeconds =  addZeros(currentDate.getSeconds(),2);
        
       // 날짜 시계 출력
        clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds; // 시:분:초
        today.innerHTML = calendar; // 오늘 날짜
        
        setTimeout("printClock()",1000); // 1초마다 printClock() 함수 호출        
          
    }

    function addZeros(num, digit) { // 자릿수 맞춰주기
         var zero = '';
         num = num.toString();
         if (num.length < digit) {
           for (i = 0; i < digit - num.length; i++) {
             zero += '0';
           }
         }
         return zero + num;
    }
       var currentDate = new Date(); 
       var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
       var attend_in; // 출근 시간 Date
       var attend_out; // 퇴근 시간 Date
       var in_clock; // 출근 시간만 추출
       var out_clock; // 퇴근 시간만 추출
       var month = (currentDate.getMonth() + 1) + "월";
      var title = currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1);

      
      // 출퇴근 로그 순번에 따른 list 값 가져오기
       if(${list[2].attendin ne null}){
          attend_in = new Date('${list[2].attendin}'); 
          attend_out = new Date('${list[1].attendout}'); 
          in_clock = getTimeStamp(attend_in).split(" ");
          out_clock = getTimeStamp(attend_out).split(" ");
       }
       else if(${list[0].attendin eq null}){
          attend_in = new Date('${list[1].attendin}'); 
          attend_out = new Date('${list[0].attendout}'); 
          in_clock = getTimeStamp(attend_in).split(" ");
          out_clock = getTimeStamp(attend_out).split(" ");
       } else{
          attend_in = new Date('${list[0].attendin}'); // 출근 시간
          attend_out = new Date('${list[1].attendout}'); // 퇴근 시간
          in_clock = getTimeStamp(attend_in).split(" ");
          out_clock = getTimeStamp(attend_out).split(" ");
       }    
       console.log(in_clock);
       console.log(out_clock);
       
       // 출근 시간
       var attendin = document.getElementById("attendin");       
       if(in_clock[1] == "date"){
          attendin.innerHTML = "미등록";       
       } else{ 
          attendin.innerHTML = in_clock[1];          
       }
       
       // 퇴근 시간
       var attendout = document.getElementById("attendout");
       attendout.innerHTML = out_clock[1];
       if(out_clock[1] == "date"){
          attendout.innerHTML = "미등록";          
       } else{ 
          attendout.innerHTML = out_clock[1];          
       }
       
      // 초 단위 시간 > 시간 변환 (HH24:MI:SS)
      function timeConvert(time) {
         
          var h = Math.floor((time % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
          var m = Math.floor((time % (1000 * 60 * 60)) / (1000 * 60));
          var s = Math.floor((time % (1000 * 60)) / 1000);
          // 0 표기 만들어주기
          if (h.toString().length==1) h = "0" + h;
         if (m.toString().length==1) m = "0" + m;
         if (s.toString().length==1) s = "0" + s;
         var convert = h +":"+ m +":"+ s;          
          console.log(convert);
          
            return convert;
       }         
      
      $(function(){
         
         // 업무 시작
         $(".attendin").click(function(){
            if(${!empty list}){
               alert("이미 업무를 시작한 이력이 있습니다. \n업무 시작은 일일 1회 가능합니다.")
               return false;
            }               
             else{
               if(confirm("업무를 시작하시겠습니까? \n업무 시작은 일일 1회 가능합니다.")){
                  location.href  = "${path}/attendin.at";               
               }
            }
         });
         
         // 업무 종료
         $(".attendout").click(function(){           
            if(${list[0].attendout ne null}){
               alert("업무 종료 이력이 있습니다 \n업무 종료는 일일 1회 가능합니다.")
               location.href = '${path}/attendout.at?worktime='+ worktime;               
            }
            else if(${!empty list}){
               if(confirm("업무를 종료하시겠습니까? \n업무 시작은 일일 1회 가능합니다.")){                  
                  location.href = '${path}/attendout.at';                  
               }
            }            
            else{
               alert("업무 시작 이력이 없습니다. \n업무 종료는 일일 1회 가능합니다.")
               return false;
            }
         });               
         
         $(".title").html(title);
      $(".month").html(month);

      // 월  근태 현황
      $(".getmonth").click(function() {
         location.href = '${path}/attendanceMonth.at';
      });
         
    });       
</script> 
<style>
	table{display:inline-block; color:#3E5569;}
	#rigthTb{float:right;}
	td{line-height:1.7em; color:#000; font-size:1.1rem; color:#3E5569;}
	td > a{color:#3E5569;}
	td:hover > a{color:#3f50f6;}
	
	.title, .kma, .ly_help, .box_color, .offer_area, .cell_weather{
		display:none;
	}
	#weekly button{
		display:none;
	}
	.week_item{
		list-style:none;
	}
	.day_data{
		display:inline-block; float:left; margin-right:2%; padding:2%;
	}
	.day_data:last-child{
		margin-right:0;
	}
	.cell_date{
		margin-bottom:10%;
	}
	/* .day_data:nth-child(1), .day_data:nth-child(2), .day_data:nth-child(3) {
		display:none;
	} */
	#status{
		float:left; border:1px solid red;
	}
	#hide{
		display:inline-block; float:left;
		/* visibility:hidden; */
	}
	#w_contents{
		display:block; padding-left:10%;
	}
	.day{
		margin-right:5%;
	}
</style>
</body>

</html>