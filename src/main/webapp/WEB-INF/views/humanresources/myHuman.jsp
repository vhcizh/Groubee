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


        <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Left Part  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- End Left Part  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Right Part  Mail Compose -->
            <!-- ============================================================== -->
			<!-- 여기부터 내용 넣으십시오 -->
               <!-- Column -->
                       <div class="card-body">
                          <center class="mt-4"> 
                          <img src="${path}/resources/assets/images/users/5.jpg" class="rounded-circle" width="150" />
                              <h4 class="card-title mt-2">${dto.name}</h4>
                          </center>
                       </div>
                       <div>
                           <hr>
                       </div>
                       <div class="card-body"> 
                            <small class="text-muted pt-4 db">직책</small>
                           <h6>${dto.rank}</h6>
                            <small class="text-muted pt-4 db">부서</small>
                           <h6>${dto.depart_name}</h6>
                            <small class="text-muted pt-4 db">사번</small>
                           <h6>${dto.id}</h6>
                       <small class="text-muted">이메일 </small>
                         <h6>${dto.email_in}</h6> 
                         <small class="text-muted pt-4 db">폰번호</small>
                         <h6>${dto.tel}</h6> 
                         <small class="text-muted pt-4 db">내선번호</small>
                         <h6>${dto.in_tel}</h6>
                         
                        
                       </div>
    <!-- All Jquery -->
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
    <!-- ============================================================== -->
</body>

</html>


