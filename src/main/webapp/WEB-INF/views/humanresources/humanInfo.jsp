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
    <link href="${path}/resources/dist/css/style.min.css" rel="stylesheet">
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
        <!-- 좌측고정 메뉴바 -->
        <%@ include file="/WEB-INF/views/common/leftMenu.jsp" %>
        <!-- 좌측고정 메뉴바 -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper" style="height:100%;">
            <!-- ============================================================== -->
            <!-- Left Part  -->
            <!-- ============================================================== -->
			<%@ include file="/WEB-INF/views/humanresources/leftMenu.jsp" %>
            <!-- ============================================================== -->
            <!-- End Left Part  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Right Part  Mail Compose -->
            <!-- ============================================================== -->
            <div class="right-part overflow-auto" style="height:100%;">
			<!-- 여기부터 내용 넣으십시오 -->
			<div class="row">
                    <!-- Column -->
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card">
                            <!-- Tabs -->
                            <ul class="nav nav-pills custom-pills" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="pills-timeline-tab" data-toggle="pill"
                                        href="#current-month" role="tab" aria-controls="pills-timeline"
                                        aria-selected="true">인적사항</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#last-month"
                                        role="tab" aria-controls="pills-profile" aria-selected="false">직무/담당</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-setting-tab" data-toggle="pill" href="#previous-month"
                                        role="tab" aria-controls="pills-setting" aria-selected="false">인사평가</a>
                                </li>
                            </ul>
                            <!-- Tabs -->
                            <div class="tab-content" id="pills-tabContent">
                            
                                <div class="tab-pane fade show active" id="current-month" role="tabpanel"
                                    aria-labelledby="pills-timeline-tab">
                          			  <div class="card-body">
                                        <form class="form-horizontal form-material">
                                            <div class="form-group">
                                                <label class="col-md-12">이름</label>
                                                <div class="col-md-12">
                                                 <input type="text" placeholder="홍길동"  readonly
                                                        class="form-control form-control-line">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="example-email" class="col-md-12">이메일</label>
                                                <div class="col-md-12">
                                                    <input type="email" placeholder="hong@naver.com"  readonly
                                                        class="form-control form-control-line" name="example-email"
                                                        id="example-email">
                                                </div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="col-md-12">직책</label>
                                                <div class="col-md-12">
                                                    <input type="text" placeholder=""
                                                        class="form-control form-control-line">
                                                </div>
                                            </div>
                                            
                                              <div class="form-group">
                                                <label class="col-sm-12">채용구분</label>
                                                <div class="col-sm-12">
                                                    <select class="form-control form-control-line">
                                                    	<option>선택하세요</option>
                                                        <option>경력</option>
                                                        <option>신입</option>
                                                    </select>
                                                </div>
                                            </div>
                                         
                                            <div class="form-group">
                                               <label class="col-md-12">생년월일</label>
                                                <div class="col-md-12">
                                                    <input type="Date" placeholder="123 456 7890"
                                                        class="form-control form-control-line">
                                                </div>
                                            </div>
                                               <div class="form-group">
                                                <label class="col-md-12">입사일</label>
                                                <div class="col-md-12">
                                                    <input type="Date" value="password"
                                                        class="form-control form-control-line">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">퇴사일</label>
                                                <div class="col-md-12">
                                                    <input type="Date" placeholder="123 456 7890"
                                                        class="form-control form-control-line">
                                                </div>
                                            </div>
                                            
                                             <div class="card-body bg-light">
			                                    <div class="row">
			                                        <div class="form-group">
			                                                <label class="col-md-12">퇴직사유</label>
			                                                <div class="col-md-12">
			                                                    <textarea rows="10" cols="100"
			                                                     placeholder="재직중이면(해당사항없음)"
			                                                        class="form-control form-control-line"></textarea>
			                                                </div>
			                                            </div>
			                                    </div>
				                                </div>
                                            
                                            <div class="form-group">
                                                <label class="col-sm-12">성별</label>
                                                <div class="col-sm-12">
                                                    <select class="form-control form-control-line">
                                                    	<option>선택하세요</option>
                                                        <option>남자</option>
                                                        <option>여자</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-12">결혼여부</label>
                                                <div class="col-sm-12">
                                                    <select class="form-control form-control-line">
                                                    	<option>선택하세요</option>
                                                        <option>미혼</option>
                                                        <option>기혼</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <button class="btn btn-success">저장</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                
                                
                 <div class="tab-pane fade" id="last-month" role="tabpanel"
                     aria-labelledby="pills-profile-tab">
                     <div class="card-body">
                              <!-- Row 신상-->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <hr class="mt-0">
                            <form class="form-horizontal r-separator">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-12 col-lg-6">
                                            <div class="form-group row">
                                                <label for="inputEmail3"
                                                    class="col-sm-3 text-right control-label col-form-label">부서</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="inputEmail3"
                                                        placeholder="">
                                                </div>
                                            </div>
                                        </div>
                                          <div class="col-sm-12 col-lg-6">
                                            <div class="form-group row">
                                                <label for="inputEmail3"
                                                    class="col-sm-3 text-right control-label col-form-label">직책</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="inputEmail3"
                                                        placeholder="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-lg-6">
                                            <div class="form-group row">
                                                <label for="inputEmail3"
                                                    class="col-sm-3 text-right control-label col-form-label">업무</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" id="inputEmail3"
                                                        placeholder="">
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 col-lg-6">
                                            <div class="form-group row pt-3">
                                                <label for="inputEmail3"
                                                    class="col-sm-3 text-right control-label col-form-label">발령일</label>
                                                <div class="col-sm-9">
                                                    <input type="Date" class="form-control" id="inputEmail3"
                                                        placeholder="Username Here">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body bg-light">
                                    <div class="row">
                                        <div class="form-group">
                                                <label class="col-md-12">담당업무</label>
                                                <div class="col-md-12">
                                                    <textarea rows="10" cols="100"
                                                        class="form-control form-control-line"></textarea>
                                                </div>
                                            </div>
                                    </div>
	                                </div>
                                <div class="card-body">
                                    <div class="form-group mb-0 text-right">
                                        <button type="submit"
                                            class="btn btn-info waves-effect waves-light">저장</button>
                                        <button type="submit"
                                            class="btn btn-dark waves-effect waves-light">취소</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- End Row -->
                <!-- 직무/담당  -->
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="previous-month" role="tabpanel"
                                    aria-labelledby="pills-setting-tab">
                                    <div class="card-body">
                                        <form class="form-horizontal form-material">
                                            <div class="form-group">
                                                <label class="col-md-12">평가자</label>
                                                <div class="col-md-12">
                                                    <input type="text" value=""
                                                        class="form-control form-control-line" readonly>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">평가년도</label>
                                                <div class="col-md-12">
                                                    <input type="Date" placeholder=""
                                                        class="form-control form-control-line">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="example-email" class="col-md-12">역량</label>
                                                <div class="col-md-12">
                                                    <input type="text" placeholder=""
                                                        class="form-control form-control-line" name="example-email"
                                                        id="example-email" readonly>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">성과</label>
                                                <div class="col-md-12">
                                                    <input type="text" value=""
                                                        class="form-control form-control-line" readonly>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">의견</label>
                                                <div class="col-md-12">
                                                    <textarea rows="5"
                                                        class="form-control form-control-line">
                                                        select m.* , p.* from 
														grb_member m join grb_personnel p on m.id = p.id
														where m.id = 123;
                                                        </textarea>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
                <!-- Row -->
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
                    <input type="checkbox" class="custom-control-input" name="sidebar-position"
                        id="sidebar-position">
                    <label class="custom-control-label" for="sidebar-position">Fixed Sidebar</label>
                </div>
                <div class="custom-control custom-checkbox mt-2">
                    <input type="checkbox" class="custom-control-input" name="header-position"
                        id="header-position">
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
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link"
                            data-navbarbg="skin1"></a></li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link"
                            data-navbarbg="skin2"></a></li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link"
                            data-navbarbg="skin3"></a></li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link"
                            data-navbarbg="skin4"></a></li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link"
                            data-navbarbg="skin5"></a></li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link"
                            data-navbarbg="skin6"></a></li>
                </ul>
                <!-- Header BG -->
            </div>
            <div class="p-3 border-bottom">
                <!-- Logo BG -->
                <h5 class="font-weight-medium mb-2 mt-2">Sidebar Backgrounds</h5>
                <ul class="theme-color">
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link"
                            data-sidebarbg="skin1"></a></li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link"
                            data-sidebarbg="skin2"></a></li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link"
                            data-sidebarbg="skin3"></a></li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link"
                            data-sidebarbg="skin4"></a></li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link"
                            data-sidebarbg="skin5"></a></li>
                    <li class="theme-item"><a href="javascript:void(0)" class="theme-link"
                            data-sidebarbg="skin6"></a></li>
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
</body>

</html>

