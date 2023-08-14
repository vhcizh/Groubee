<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %> 

<!DOCTYPE html>
<html>

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
</head>

<body>
   <!-- 좌측메뉴바 시작 -->
               <div class="left-part bg-white pb-5" style="height:100%;">
                <!-- Mobile toggle button -->
                <a class="ti-menu ti-close btn btn-success show-left-part d-block d-md-none"
                    href="javascript:void(0)"></a>
                <!-- Mobile toggle button -->
                <div class="scrollable position-relative" style="height:100%;">
                    <div class="p-3">
                        <div class="card-body position-relative">
                                <h4 class="card-title mb-4">인사관리</h4>
                                <div id="carouselExampleFade" class="carousel slide status-carousel"
                                    data-ride="carousel">
                                    <div class="carousel-inner">
                                    </div> <!-- carousel-item active -->
                                    <hr class="attendenceHr">
                                </div>
                            </div>
                    </div>
                    <div class="p-6">
                  <nav class="sidebar-nav">
                        <ul id="sidebarnav">
                           <li class="sidebar-item" style="color: #343a40;">
                              <a class="sidebar-link" href="${path}/humanMain.hu"
                              aria-expanded="false" style="color: #343a40;">
                              <span class="hide-menu" style="color: #343a40;">내인사정보 </span></a>
                           </li>
                           <li class="sidebar-item" style="color: #343a40;">
                              <a class="sidebar-link" href="${path}/groub.hu"
                              aria-expanded="false" style="color: #343a40;">
                              <span class="hide-menu" style="color: #343a40;">조직도 </span></a>
                           </li>
                           <li class="sidebar-item" style="color: #343a40;">
                              <a class="sidebar-link" href="${path}/userHuman.hu"
                              aria-expanded="false" style="color: #343a40;">
                              <span class="hide-menu" style="color: #343a40;">전사 인사 정보</span></a>
                           </li>
                        </ul>
                     </nav>
                    </div>
                </div>
            </div>
            
                <!-- ============================================================== -->
</body>

</body>
</html>