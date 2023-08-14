<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/setting.jsp" %>   
<!DOCTYPE html>

<html dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/assets/images/favicon.png">
    <title>Groubee Login</title>	
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
	<c:if test="${sessionScope.memberID == 'admin'}">
		<script type="text/javascript"> 
			alert("관리자 로그인");
			window.location="${path}/index.co";
		</script>
	</c:if>
	<c:if test="${sessionScope.memberID == null}">
		<c:choose>
		<c:when test="${selectCnt == -1}">
	 	<script type="text/javascript"> 
			alert("비밀번호가 일치하지 않습니다. 다시 로그인해주세요");
			window.location="${path}/login.co";
		</script>
		</c:when>
		<c:when test="${selectCnt == 0}">
		<script type="text/javascript"> 
			alert("존재하지 않는 아이디입니다. 다시 로그인해주세요");
			window.location="${path}/login.co";
		</script>
		</c:when>
		</c:choose>
	</c:if>
    <div class="main-wrapper">
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
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Login box.scss -->
        <!-- ============================================================== -->
        <div class="auth-wrapper d-flex no-block justify-content-center align-items-center position-relative"
            style="background:url(${path}/resources/assets/images/background/login-register.jpg) no-repeat center center;">
            <div class="auth-box row text-center">
                <div class="col-lg-5 col-md-3 modal-bg-img"
                    style="background-image: url(${path}/resources/images/groubee_logo.png); width: 100%; height: auto;">
                </div>
                <div class="col-lg-7 col-md-9 bg-white">
                    <div class="p-3">
                        <h2>
                            Groubee Sign In
                        </h2>
                        <form class="mt-4" method="post">
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <input class="form-control" type="text" placeholder="id">
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <input class="form-control" type="password" placeholder="password">
                                    </div>
                                </div>
                                <div class="col-lg-12 d-flex no-block">
                                    <button type="submit" class="btn btn-dark">Sign In</button>                                    
                                </div>
                                <div class="col-lg-12 mt-5">
                                    <h6 class="text-uppercase mb-0">Sign In With</h6>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6">
                                            <a href="${path}/join.co" class="btn btn-block bg-facebook text-white mt-3">Sign Up</a>
                                        </div>
                                        <div class="col-lg-6 col-md-6">
                                            <a href="#" class="btn btn-block bg-twitter text-white mt-3">EMAIL</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- Login box.scss -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- All Required js -->
    <!-- ============================================================== -->
    <script src="${path}/resources/assets/libs/jquery/dist/jquery.min.js "></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${path}/resources/assets/libs/popper.js/dist/umd/popper.min.js "></script>
    <script src="${path}/resources/assets/libs/bootstrap/dist/js/bootstrap.min.js "></script>
    <!-- ============================================================== -->
    <!-- This page plugin js -->
    <!-- ============================================================== -->
    <script>
        $(".preloader ").fadeOut();
    </script>
</body>
</html>