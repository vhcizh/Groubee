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
    <title>Admin 전사 연차 내역</title>   
   <link rel="canonical" href="https://www.wrappixel.com/templates/severny-admin-template/" />
    <!-- Custom CSS -->
    <link href="${path}/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <link href="${path}/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
        href="${path}/resources/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/extra-libs/date-paginator/date-paginator-custom.css">
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/extra-libs/prism/prism.css">   
    <!-- This Page CSS -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/extra-libs/css-chart/css-chart.css">
    <link href="${path}/resources/assets/libs/morris.js/morris.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
   
</script>

</head>

<body>
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
      <%@ include file="/WEB-INF/views/admin/adminMenu.jsp"%>
      <!-- 좌측고정 메뉴바 -->
      <!-- ============================================================== -->
      <!-- Page wrapper  -->
      <!-- ============================================================== -->
      <div class="page-wrapper">
         <!-- ============================================================== -->
         <!-- Bread crumb and right sidebar toggle -->
         <!-- ============================================================== -->
         <div class="page-breadcrumb">
            <div class="row">
               <div class="col-7 align-self-center">
                  <h4
                     class="page-title text-truncate text-dark font-weight-medium mb-1">Admin
                     Annual</h4>
                  <div class="d-flex align-items-center">
                     <nav aria-label="breadcrumb">
                        <ol class="breadcrumb m-0 p-0">
                           <li class="breadcrumb-item active">
                           <a href="${path}/adminMain.ad">Home</a></li>
                           <li class="breadcrumb-item active"aria-current="page">
                           <a href="${path}/adAttend2.ad">Company Annual</a></li>
                        </ol>
                     </nav>
                  </div>
               </div>
            </div>
         </div>
         <!-- ============================================================== -->
         <!-- Container fluid  -->
         <!-- ============================================================== -->
         <div class="container-fluid">
            <!-- *************************************************************** -->
            <!-- Start First Cards -->
            <!-- *************************************************************** -->
            <!-- Column -->
            <div class="col-lg-12">
               <div class="card">
                  <div class="card-body">
						<div class="row button-group">
						    <div class="col-lg-2 col-md-4">
						        <button type="button" class="btn btn-rounded btn-block btn-outline-info" onclick = "location.href='${path}/adAttend.ad'">전사근태내역</button>
						    </div>
						    <div class="col-lg-2 col-md-4">
						        <button type="button" class="btn btn-rounded btn-block btn-outline-info" onclick = "location.href='${path}/adAttend2.ad'">전사연차내역</button>
						    </div>
						    <div class="col-lg-2 col-md-4">
						        <button type="button" class="btn btn-rounded btn-block btn-outline-info" onclick = "location.href='${path}/adAttend3.ad'">사내근무내규</button>
						    </div>
						</div>
                  	<hr><br>
             	     <div class="row">
                  <form name="admingrbauualform" method="post">
                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">                                                      
                  <div class="card">
                     <div class="card-body">
                        <h4 class="card-title">
                           <strong>전사 월간 연차 내역</strong>
                           <br>${day}
                        <select class="selectmonth form-control custom-select" id="selectmonth" name="selectmonth" required>
                           <option id="0" value="0">전사 월간  연차 선택</option>
                           <option id="1" value="1">1월</option>
                           <option id="2" value="2">2월</option>
                           <option id="3" value="3">3월</option>
                           <option id="4" value="4">4월</option>
                           <option id="5" value="5">5월</option>
                           <option id="6" value="6">6월</option>
                           <option id="7" value="7">7월</option>
                           <option id="8" value="8">8월</option>
                           <option id="9" value="9">9월</option>
                           <option id="10" value="10">10월</option>
                           <option id="11" value="11">11월</option>
                           <option id="12" value="12">12월</option>                              
                        </select>   
                        </h4>
                        <div id="paginator2"></div>
                     </div>
                  </div>                      
                  <div class="card">
                     <div class="card-body">
                        <div class="col-md-4">
                        <select class="selectdepart form-control custom-select" tabindex="1">
                           <option id="0" value="0">부서 이번달 연차 선택</option>
                           <option id="1" value="전사">전사</option>
                           <option id="2" value="사업부">사업부</option>                           
                           <option id="3" value="인사부">인사부</option>
                           <option id="4" value="영업부">영업부</option>
                           <option id="5" value="개발부">개발부</option>
                           <option id="6" value="경영지원부">경영지원부</option>
                           <option id="7" value="총무부">총무부</option>
                        </select>
                     </div>
                     <hr>
                     <h4 class="card-title">${depart_name} 이번달 연차 내역</h4>
                            <div class="container" style="align: center">
                        <div class="row">                           
                           <div class="col bg-light border p-3">
                              <div>반차 사용</div>
                              <div>${half_cnt}</div>
                           </div>
                           
                           <div class="col bg-light border p-3">
                              <div>연차 사용</div>
                              <div>${full_cnt}</div>
                           </div>                                                      
                        </div>
                     </div><br><br>
                            <h4 class="card-title">부서별 연차 내역</h4>
                            <div class="container" style="align: center">
                        <div class="row">                        
                           <div class="col bg-light border p-3">
                              <div>사업부</div>
                              <div>${bus_cnt}</div>
                           </div>                           
                           <div class="col bg-light border p-3">
                              <div>영업부</div>
                              <div>${sale_cnt}</div>
                           </div>
                           <div class="col bg-light border p-3">
                              <div>개발부</div>
                              <div>${it_cnt}</div>
                           </div>
                           <div class="col bg-light border p-3">
                              <div>인사부</div>
                              <div>${human_cnt}</div>
                           </div>
                           <div class="col bg-light border p-3">
                              <div>경영지원부</div>
                              <div>${sup_cnt}</div>
                           </div>
                           <div class="col bg-light border p-3">
                              <div>총무부</div>
                              <div>${acc_cnt}</div>
                           </div>                                                      
                        </div>
                     </div>
                     <br><br>                                          
                     <!-- Table -->
                     <div class="card">
                        <div class="card-body">
                           <h4 class="card-title">${depart_name} 연차 내역
                              <a class="get-code" data-toggle="collapse" href="#pgr2" aria-expanded="true">                                 
                                 <i class="fa fa-code" title="이번달 연차 내역 확인" data-toggle="tooltip"></i><br><br>
                              </a>
                           </h4>
                           <h6 class="card-subtitle">연차 사용 현황</h6>
                           <div class="collapse mt-3 well" id="pgr2" aria-expanded="true">
                              <div class="table-responsive">
                              <table id="lang_comma_deci" class="table table-striped table-bordered display no-wrap" style="width: 100%">
                              <thead>                              
                                 <tr>
                                    <th>이름</th>
                                    <th>부서</th>
                                    <th>신청일</th>
                                    <th>시작일</th>
                                    <th>종료일</th>
                                    <th>발생 연차</th>
                                    <th>사용 연차</th>
                                    <th>잔여 연차</th>
                                    <th>상태</th><!-- 연차 종류 -->
                                 </tr>                                                            
                              </thead>
                              <tbody>
                              <c:forEach var="dto" items="${annual}">
                                 <c:if test="${dto.annual_id eq null}">
                                    <tr>
                                       <td colspan="9" align="center">연차 사용 이력이 없습니다.</td>
                                    </tr>
                                 </c:if>
                                 <c:if test="${dto.annual_id ne null}">
                                 <tr>
                                    <td>
                                       <img src="${dto.image}" alt="user" width="40" class="rounded-circle">
                                       ${dto.name}
                                    </td>
                                    <td>${dto.depart_name}</td>                                    
                                    <td>${dto.annual}</td>
                                    <td>${dto.annual_in}</td>
                                    <td>${dto.annual_out}</td>
                                    <td>${dto.annualtotal}</td>
                                    <td>${dto.annualuse}</td>
                                    <td>${dto.annualrest}</td>
                                    <td>${dto.state}</td>
                                 </tr>
                                 </c:if>
                              </c:forEach>                                                                  
                              </tbody>
                           </table>                           
                           </div>
                           </div>
                           <div class="list-group">
                           <a href="javascript:void(0)" class="list-group-item active">${depart_name} 연차 사용 내역</a>
                           </div>                           
                        </div>
                     </div>
                     <!-- Table -->
                     </div>
               </div>
               <hr><br>
               <!-- 부서 근태 통계 -->
               <div class="col-lg-12 col-xl-6">
                       <div class="card">
                           <div class="card-body">
                             <h4 class="card-title">전사 연차 통계</h4>
                                     <div>
                                       <canvas id="pie-chart"></canvas>
                                     </div>
                                 </div>
                             </div>
                       </div>
                          
               <div class="col-lg-12 col-xl-6">
                  <div class="card">
                     <div class="card-body analytics-info">
                        <h4 class="card-title">부서별 연차 통계</h4>
                        <div id="basic-doughnut" style="height: 400px;"></div>
                     </div>
                  </div>
               </div>
               <div class="card">
                  <div class="card-body">
                     <div class="col-md-4">
                        <select class="selectyear form-control custom-select" id="selectyear" tabindex="1">
                           <option id="0" value="0">연도 선택</option>                           
                           <option id="1" value="2022">2022</option>
                           <option id="2" value="2021">2021</option>
                           <option id="3" value="2020">2020</option>
                           <option id="4" value="2019">2019</option>
                           <option id="5" value="2018">2018</option>
                        </select>
                     </div>                     
                     <hr>                                          
                     <!-- 연간 부서원 연차 현황  -->                     
                     <h4 class="card-title"></h4>
                     <div class="container" style="align: center">                     
                     <c:forEach var="dto" items="${grbMember}">                        
                        <c:if test="${dto.id eq null}" >
                        <div class="row">                           
                           부서원 정보가 없습니다.                                                   
                        </div>         
                        </c:if>
                        <c:if test="${dto.id ne null}" >
                        <div class="row">
                           <div class="col bg-light border p-3">
                              <div>
                                 <img src="${dto.image}" alt="user" width="40" class="rounded-circle">
                                 ${dto.name}
                                        </div>                              
                           </div>
                           <div class="col bg-light border p-3">                              
                              <div>${dto.depart_name}</div>                           
                           </div>
                           <div class="col bg-light border p-3">
                              <div>입사일</div>
                              <div>${dto.hireday}</div>                           
                           </div>                           
                           <div class="col bg-light border p-3">
                              <div>발생 연차</div>
                              <div>${dto.annualtotal}</div>                           
                           </div>                           
                           <div class="col bg-light border p-3">
                              <div>사용 연차</div>
                              <div>${dto.annualuse}</div>
                           </div>
                           <div class="col bg-light border p-3">
                              <div>잔여 연차</div>
                              <div>${dto.annualrest}</div>
                           </div>                                                
                        </div>
                        </c:if>
                     </c:forEach>
                     </div>
                  </div>
               </div>                    
                   </form>
                     </div>                  
                  </div>
               </div>
            </div>
         </div>         
         <!-- *************************************************************** -->
         <!-- End Top Leader Table -->
         <!-- *************************************************************** -->
      </div>
      <!-- ============================================================== -->
      <!-- End Container fluid  -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- footer -->
      <!-- ============================================================== -->
      <footer class="footer text-center text-muted"> Copyright 2019. All Rights Reserved by Severny Admin </footer>
      <!-- ============================================================== -->
      <!-- End footer -->
      <!-- ============================================================== -->
   </div>
   <!-- ============================================================== -->
   <!-- End Page wrapper  -->
   <!-- ============================================================== -->

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
    <!--Menu sidebar -->
    <script src="${path}/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${path}/resources/dist/js/custom.min.js"></script>
    <!-- This Page JS -->     
    <script src="${path}/resources/assets/libs/moment/min/moment.min.js"></script>
    <script src="${path}/resources/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script src="${path}/resources/assets/extra-libs/date-paginator/bootstrap-datepaginator.min.js"></script>    
    <!-- Chart JS -->
    <script src="${path}/resources/dist/js/pages/chartjs/chartjs.init.js"></script>
    <script src="${path}/resources/assets/libs/chart.js/dist/Chart.min.js"></script>    
    <script src="${path}/resources/assets/libs/echarts/dist/echarts-en.min.js"></script>
    <script src="${path}/resources/dist/js/pages/echarts/pie-doughnut/pie-doghnut.js"></script>
   
    <script type="text/javascript">            
      //입력 timestamp > date 24시간 변환
      function getTimeStamp(timeStamp) {              
          var date = new Date(timeStamp); // 타임 스탬프 >> Date 로 변환
          // moment 라이브러리 사용해 24시간 형태 날짜 및 시간 확인
          var nowDate = moment(date).format("YYYY-MM-DD HH:mm:ss");
          
          console.log(nowDate);   
          return nowDate;
      }         
       // 날짜 표
       var datepaginator = function () {
           return {
               init: function () {
                   $("#paginator1").datepaginator(),
   
                       $("#paginator2").datepaginator({
                           size: "large"
                       }),
   
                       $("#paginator3").datepaginator({
                           size: "small"
                       }),
   
                       $("#paginator4").datepaginator({
                           onSelectedDateChanged: function (a, t) {
                               alert("Selected date: " + moment(t).format("Do, MMM YYYY"))
                           }
                       })
               }
           }
       }();
       
       $(document).ready(function(){
           datepaginator.init();
           
       });   
        
        $(function() {
           // 현재 날짜
          var selectmonth = '${selectmonth}';
          var currentDate = new Date();
          var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1) + "-" + currentDate.getDate();
          var month = (currentDate.getMonth() + 1) + "월";
          if (selectmonth.toString().length==1) selectmonth = "0" + selectmonth;
          var title = currentDate.getFullYear() + "-" + selectmonth;
                   
         // 연도 선택
          $(".selectyear").change(function(){
              var yearVal =  $(this).val();          
                console.log(yearVal);
                location.href = "${path}/adAttend2.ad?year=" + yearVal;            
            });
          // 월 선택
          $(".selectmonth").change(function(){
              var monthVal =  $(this).val();
              var depart_name = '${sessionScope.depart_name}';
                console.log(depart_name);
                console.log(monthVal);
                location.href = "${path}/adAttend2.ad?month=" + monthVal;            
            });  
          // 부서 선택
          $(".selectdepart").change(function(){
             var monthVal =  '${sessionScope.thismonth}';
             var depart_name = $(this).val();
               console.log(depart_name);
               console.log(monthVal);
               if(depart_name == "전사"){
                 location.href = "${path}/adAttend2.ad";
               } else{
                  location.href = "${path}/adAttend2.ad?depart_name=" + depart_name + "&month=" + monthVal;
               }
           });  
             
        });      
   </script>
      <script type="text/javascript">
      $(function () {    
         // 전사 월간 반차, 연차 사용 통계
         new Chart(document.getElementById("pie-chart"), {
            type: 'pie',
            data: {
              labels: ["반차", "연차", "데이터없음"],
              datasets: [{
               label: "depart attendance",
               backgroundColor: ["#02cccd", "#ff3ca6", "#005ccce"],
               data: ['${half_cnt}','${full_cnt}', '${none}']
              }]
            },
            options: {
              title: {
               display: true,
               text: 'depart annual ${day}'
              }
            }
         });
         
         	// 부서별 연차+반차 cnt 통계
           	var basicdoughnutChart = echarts.init(document.getElementById('basic-doughnut'));
           	var option = {
               // Add title
                   title: {
                       text: 'depart annual',
                       subtext: '${day}',
                       x: 'center'
                   },

                   // Add legend
                   legend: {
                       orient: 'vertical',
                       x: 'left',
                       data: ['사업부','영업부','개발부','인사부','경영지원부','총무부']
                   },

                   // Add custom colors
                   color: ['#ffab2e', '#3f50f6', '#dbabce', '#6610f2', "#02cccd", "#ff3ca6"],

                   // Display toolbox
                   toolbox: {
                       show: true,
                       orient: 'vertical',
                       feature: {
                           mark: {
                               show: true,
                               title: {
                                   mark: 'Markline switch',
                                   markUndo: 'Undo markline',
                                   markClear: 'Clear markline'
                               }
                           },
                           dataView: {
                               show: true,
                               readOnly: false,
                               title: 'View data',
                               lang: ['View chart data', 'Close', 'Update']
                           },
                           magicType: {
                               show: true,
                               title: {
                                   pie: 'Switch to pies',
                                   funnel: 'Switch to funnel',
                               },
                               type: ['pie', 'funnel'],
                               option: {
                                   funnel: {
                                       x: '25%',
                                       y: '20%',
                                       width: '50%',
                                       height: '70%',
                                       funnelAlign: 'left',
                                       max: 1548
                                   }
                               }
                           },
                           restore: {
                               show: true,
                               title: 'Restore'
                           },
                           saveAsImage: {
                               show: true,
                               title: 'Same as image',
                               lang: ['Save']
                           }
                       }
                   },

                   // Enable drag recalculate
                   calculable: true,

                   // Add series
                   series: [
                       {
                           name: 'Browsers',
                           type: 'pie',
                           radius: ['50%', '70%'],
                           center: ['50%', '57.5%'],
                           itemStyle: {
                               normal: {
                                   label: {
                                       show: true
                                   },
                                   labelLine: {
                                       show: true
                                   }
                               },
                               emphasis: {
                                   label: {
                                       show: true,
                                       formatter: '{b}' + '\n\n' + '{c} ({d}%)',
                                       position: 'center',
                                       textStyle: {
                                           fontSize: '17',
                                           fontWeight: '500'
                                       }
                                   }
                               }
                           },

                           data: [                              
                               {value: '${bus_cnt}', name: '사업부'},
                               {value: '${sale_cnt}', name: '영업부'},
                               {value: '${it_cnt}', name: '개발부'},
                               {value: '${human_cnt}', name: '인사부'},
                               {value: '${sup_cnt}', name: '경영지원부'},
                               {value: '${acc_cnt}', name: '총무부'}                              
                           ]
                       }
                   ]
           };
       
           basicdoughnutChart.setOption(option);
         
         // Resize chart on menu width change and window resize
            $(window).on('resize', resize);
            $(".sidebartoggler").on('click', resize);

            // Resize function
            function resize() {
                setTimeout(function() {

                    // Resize chart
                    basicpieChart.resize();
                    basicdoughnutChart.resize();
                    customizedChart.resize();
                    nestedChart.resize();
                    poleChart.resize();
                }, 200);
            }
         
      });
   </script>
</body>

</html>