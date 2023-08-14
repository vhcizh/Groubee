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
    <title>Groubee - 나의 연차 내역</title>	
	<link rel="canonical" href="https://www.wrappixel.com/templates/severny-admin-template/" />   
    <!-- Custom CSS -->
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">    
    <link rel="stylesheet" type="text/css"
        href="${path}/resources/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="${path}/resources/assets/extra-libs/date-paginator/date-paginator-custom.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

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
	<div id="main-wrapper" style="height:100%;">
		<div class="app-container"></div>
		<!-- 좌측고정 메뉴바 -->
        <%@ include file="/WEB-INF/views/common/leftMenu.jsp" %>
        <!-- 좌측고정 메뉴바 -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Start Page Content -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Email App Part -->
			<!-- ============================================================== -->
			<div class="email-app position-relative" style="height:100%;">
				<!-- ============================================================== -->
				<!-- Left Part -->
				<!-- ============================================================== -->
				<%@ include file="/WEB-INF/views/attendance/subMenu.jsp" %>
				<!-- ============================================================== -->
				<!-- Right Part -->
				<!-- ============================================================== -->
			
				<div class="right-part mail-list overflow-auto">
                    <div class="card">
                        <div class="card-body">
  							<h4 class="card-title"><strong>나의 연차 내역</strong></h4>                                                               
							<div id="paginator2"></div>                                
						</div>
					</div>				
                    <!-- Action part -->
                    <div class="card">
						<div class="card-body">
							<div class="col-md-4">
								<select class="year form-control custom-select" id="year" tabindex="1">
									<option id="0" value="0">연도 선택</option>									
									<option id="1" value="2022">2022</option>
									<option id="2" value="2021">2021</option>
									<option id="3" value="2020">2020</option>
									<option id="4" value="2019">2019</option>
									<option id="5" value="2018">2018</option>
								</select>
							</div>							
							<hr>														
							<!-- 연차 정보 div -->
							<h4 class="card-title"></h4>
							<div class="container" style="align: center">
								
								<c:if test="${year[0].annual_id eq null}" >
								<div class="row">									
									발생된 연차 내역이 없습니다.																	
								</div>			
								</c:if>
								<c:if test="${year[0].annual_id ne null}" >
								<div class="row">
									<div class="col bg-light border p-3">
										<div>
											<img src="${year[0].image}" alt="user" width="40" class="rounded-circle">
											${year[0].name}
                                        </div>										
									</div>
									<div class="col bg-light border p-3">
										<div>발생 연차</div>
										<div>${year[0].annualtotal}</div>									
									</div>									
									<div class="col bg-light border p-3">
										<div>사용 연차</div>
										<div>${year[0].annualuse}</div>
									</div>
									<div class="col bg-light border p-3">
										<div>잔여 연차</div>
										<div>${year[0].annualrest}</div>
									</div>																
								</div>
								</c:if>
							
							</div>							
							<hr>

							<!-- 연차 사용 내역 -->
							<div class="row">
								<div class="col-12">
									<div class="card">
										<div class="card-body">
											<h4 class="card-title">사용 내역</h4>											
											<table id="lang_comma_deci"
												class="table table-striped table-bordered display no-wrap"
												style="width: 100%">
												<thead>
													<tr>
														<th>이름</th>
														<th>부서</th>
														<th>종류</th>
														<th>시작일</th>
														<th>종료일</th>
														<th>사용 연차</th>
														<th>잔여 연차</th>
														<th>상태</th>
													</tr>
												</thead>
												<tbody>
												<!-- 사용 이력 없을 시 -->
												<c:forEach var="dto" items="${annual}">
													<c:if test="${dto.annual_id eq null}" >
													<tr>
														<th colspan="7" align="center">연차 사용 이력이 없습니다.</th>
													</tr>
													</c:if>
													<c:if test="${dto.annual_id ne null}" >
													<!-- 사용 이력 있을 시 -->
													<tr>
														<td>
															<img src="${dto.image}" alt="user" width="40" class="rounded-circle">
															${dto.name}
														</td>
														<td>${dto.depart_name}</td>
														<td>${dto.annual}</td>
														<td>${dto.annual_in}</td>
														<td>${dto.annual_out}</td>
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
								</div>
							</div>
							<!-- 연차 생성 내역 -->
							<div class="row">
								<div class="col-12">
									<div class="card">
										<div class="card-body">
											<h4 class="card-title">생성 내역</h4>											
											<table id="lang_comma_deci"
												class="table table-striped table-bordered display no-wrap"
												style="width: 100%">
												<thead>
													<tr>
														<th>등록일</th>														
														<th>사용 기간</th>
														<th>발생 일수</th>
														<th>내용</th>
													</tr>
												</thead>
												<tbody>
												<c:if test="${year[0].annual_id eq null}" >
												<!-- 생성 이력 없을 시 -->
													<tr>
														<th colspan="6" align="center">연차 생성 이력이 없습니다.</th>
													</tr>
												</c:if>
												<c:if test="${year[0].annual_id ne null}" >
													<!-- 생성 이력 있을 시 -->
													<tr>
														<td>${year[0].today}</td>
														<td>${year[0].year}-12-31</td>
														<td>${year[0].annualtotal}</td>														
														<td>${year[0].year}년 연차 생성</td>
													</tr>
												</c:if>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>				
				</div>
           	</div>	
			<!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                   All Rights Reserved by Severny admin. Designed and Developed by <a href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- End PAge Content -->
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
    <!--Menu sidebar -->
    <script src="${path}/resources/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="${path}/resources/dist/js/custom.min.js"></script>
    <!-- This Page JS -->
    <script src="${path}/resources/assets/libs/moment/min/moment.min.js"></script>
    <script src="${path}/resources/assets/libs/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script src="${path}/resources/assets/extra-libs/date-paginator/bootstrap-datepaginator.min.js"></script>
   	<script type="text/javascript">
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
        $("#year").change(function(){
            var yearVal =  $(this).val();                
            location.href = '${path}/attendanceRestInfo.at?year='+yearVal;
        })
       
        
        $(document).ready(function(){
            datepaginator.init();
        });

</script>              
</body>
</html>