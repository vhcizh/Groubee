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
    <!-- This Page CSS -->
    <link href="${path}/resources/assets/libs/summernote/dist/summernote-bs4.css" rel="stylesheet">
    <link href="${path}/resources/assets/libs/dropzone/dist/min/dropzone.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<link href="${path}/resources/commonCSS/attandance.css" rel="stylesheet">

<script type="text/javascript">
	alert("select * from grb_attendance a \n join grb_member m on a.id = m.id \n where  m.id = 1 \n order by today;");	
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
                <div class="right-part mail-list overflow-auto" style="height:100%;">
                    <!-- Button group part -->
					<div class="bg-light p-3 d-flex align-items-center do-block">
						<div style="align: center">
							<h4>월 근태 현황</h4>
							<h1>2022.10</h1>
						</div>						
					</div>
                    <!-- Action part -->
                    <div class="card">
						<div class="card-body">
							<h4 class="card-title">10월</h4>
							<div class="container" style="align: center">								
								<div class="p-0 border-0"><hr></div>
								<div class="row">
									<div class="col bg-light border p-3">
										<div>이번달 누적 시간</div>
										<div>08h 37m 7s</div>
									</div>
									<div class="col order-12 bg-light border p-3">
										<div>이번달 연장 시간</div>
										<div>18h 00m 00s</div>
									</div>									
								</div>
							</div>							
						</div>
					</div>


					<!-- Language - Comma decimal place  -->
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body">																		
                                        <h4 class="card-title">10월 
                                        	<a class="get-code" data-toggle="collapse" href="#pgr2" aria-expanded="true">
                                        	<i class="fa fa-code" title="월 근태 확인" data-toggle="tooltip"></i></a>
                                        </h4>
                                        <h6 class="card-subtitle">누적 근무 시간 33h 12m 53s(연장 근무 시간 0h 0m 0s)</h6>
                                        <div class="collapse mt-3 well" id="pgr2" aria-expanded="true">
                                            <div class="table-responsive">
											<table id="lang_comma_deci" class="table table-striped table-bordered display no-wrap" style="width: 100%">
											<thead>
												<tr>
													<th colspan="2">일자</th>
													<th>업무시작</th>
													<th>업무종료</th>
													<th>총 근무시간</th>
													<th>근무시간 상세</th>
													<th>승인요청 내역</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>1</td>
													<td>토</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>2</td>
													<td>일</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>3</td>
													<td>월</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>4</td>
													<td>화</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>5</td>
													<td>수</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>6</td>
													<td>목</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>7</td>
													<td>금</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>8</td>
													<td>토</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>9</td>
													<td>일</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>10</td>
													<td>월</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>11</td>
													<td>화</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>12</td>
													<td>수</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>13</td>
													<td>수</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>14</td>
													<td>목</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>15</td>
													<td>금</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>16</td>
													<td>토</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>17</td>
													<td>일</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>18</td>
													<td>월</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>19</td>
													<td>화</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>20</td>
													<td>수</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>21</td>
													<td>목</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>22</td>
													<td>금</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>23</td>
													<td>토</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>24</td>
													<td>일</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>25</td>
													<td>월</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>26</td>
													<td>화</td>
													<td>09:42:58 
														<span class="badge badge-pill badge-success ml-2 font-weight-normal py-1 px-2">ip</span>
													</td>
													<td>16:32:35
														<span class="badge badge-pill badge-success ml-2 font-weight-normal py-1 px-2">ip</span>
													</td>
													<td>1h 38m 14s</td>
													<td>기본 1h 38m 14s / 연장 0h 0m 0s</td>
													<td></td>
												</tr>
												<tr>
													<td>27</td>
													<td>수</td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>28</td>
													<td>목</td>
													<td>09:42:58
														<span class="badge badge-pill badge-success ml-2 font-weight-normal py-1 px-2">ip</span>
													</td>
													<td>16:00:58
														<span class="badge badge-pill badge-success ml-2 font-weight-normal py-1 px-2">ip</span>
													</td>
													<td>1h 38m 14s</td>
													<td>기본 1h 38m 14s / 연장 0h 0m 0s</td>
													<td></td>
												</tr>
												<tr>
													<td>29</td>
													<td>금</td>
													<td>13:23:02 
														<span class="badge badge-pill badge-success ml-2 font-weight-normal py-1 px-2">ip</span>
													</td>
													<td>17:51:56
														<span class="badge badge-pill badge-success ml-2 font-weight-normal py-1 px-2">ip</span>
													</td>
													<td>4h 28m 12s</td>
													<td>기본 4h 28m 12s / 연장 0h 0m 0s</td>
													<td>완료 (연차 8.00h)</td>
												</tr>
												<tr>
													<td>30</td>
													<td>토</td>
													<td>12:06:12
														<span class="badge badge-pill badge-success ml-2 font-weight-normal py-1 px-2">ip</span> 
													</td>
													<td>19:12:29
														<span class="badge badge-pill badge-success ml-2 font-weight-normal py-1 px-2">ip</span>
													</td>
													<td>0h 44m 7s</td>
													<td>기본 0h 44m 7s / 연장 0h 0m 0s</td>
													<td></td>
												</tr>
												<tr>
													<td>31</td>
													<td>일</td>
													<td>09:42:58
														<span class="badge badge-pill badge-success ml-2 font-weight-normal py-1 px-2">ip</span>
													</td>
													<td>16:32:35
														<span class="badge badge-pill badge-success ml-2 font-weight-normal py-1 px-2">ip</span>
													</td>
													<td>1h 38m 14s</td>
													<td>기본 1h 38m 14s / 연장 0h 0m 0s</td>
													<td></td>
												</tr>												
											</tbody>
											</table>
										</div>
                                        </div>
                                        <div class="list-group"> 
                                        	<a href="javascript:void(0)" class="list-group-item active">Cras justo odio</a>
                                        </div>
								</div>
							</div>
						</div>
					</div>					
					
					
					<!-- skill bars -->
					<div class="card">
                    	<div class="card-body">
					
						<h4 class="card-title">이번달 근태 현황</h4>	
						<h5 class="mt-4">
							출근<span class="pull-right">85%</span>
						</h5>
						<div class="progress ">
							<div
								class="progress-bar bg-info wow animated progress-animated"
								style="width: 85%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>
						<h5 class="mt-4">
							지각<span class="pull-right">5%</span>
						</h5>
						<div class="progress ">
							<div
								class="progress-bar bg-warning wow animated progress-animated"
								style="width: 5%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>					
						<h5 class="mt-4">
							누적 근무<span class="pull-right">85%</span>
						</h5>
						<div class="progress ">
							<div
								class="progress-bar bg-danger wow animated progress-animated"
								style="width: 85%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>
						<h5 class="mt-4">
							초과 근무<span class="pull-right">0%</span>
						</h5>
						<div class="progress">
							<div class="progress-bar bg-info wow animated progress-animated"
								style="width: 00%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
							</div>
						</div>
						<h5 class="mt-4">
							연장 근무<span class="pull-right">65%</span>
						</h5>
						<div class="progress">
							<div
								class="progress-bar bg-success wow animated progress-animated"
								style="width: 65%; height: 6px;" role="progressbar">
								<span class="sr-only">60% Complete</span>
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
    <script src="${path}/resources/dist/js/pages/email/email.min.js"></script>
    <script src="${path}/resources/assets/libs/summernote/dist/summernote-bs4.min.js"></script>
    <script src="${path}/resources/assets/libs/dropzone/dist/min/dropzone.min.js"></script>
    <script>
        $('#summernote').summernote({
            placeholder: 'Type your email Here',
            tabsize: 2,
            height: 250
        });
        Dropzone.autoDiscover = false;
        $(document).ready(function () {
            var myDrop = new Dropzone("#dzid", {
                url: '/file/post'
            });
        });
    </script>
</body>
</html>