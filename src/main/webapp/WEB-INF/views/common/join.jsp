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
    <title>Groubee Sign Up</title>	
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
                <div class="col-lg-1 col-md-3 modal-bg-img"
                    style="background-image: url(${path}/resources/images/groubee_logo.png);">
                </div>        
        	</div>
                <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- row -->
                <div class="row">
                <!-- insertCnt가 1이면 성공 0이면 실패 -->					
					
					<div class="col-lg-12">
                        <div class="card">
                            <div class="card-header bg-facebook">
                                <h4 class="mb-0 text-white">Sign Up</h4>
                            </div>
                            <form name="joinform" action="${path}/join_action.co" method="post">    
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                  	 			<input type="hidden" name="hiddenId" value="0">                    	                        
                                
                                <div class="form-body">
									<div class="card-body">
										<div class="row pt-3">
											<!-- 이름 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="name">* User Name</label> 
													<input type="text" class="form-control" id="name" name="name" placeholder="User Name" autofocus required>
												</div>
											</div>
											<!-- 영문 이름 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="eng_name"> Eng Name</label> 
													<input type="text" class="form-control" id="eng_name" name="eng_name" placeholder="Eng Name">
												</div>
											</div>											
											<!-- 비밀번호 -->
											<div class="col-md-6">
												<div class="form-group">
													<label for="pwd">* Password</label> 
													<input type="password" class="form-control" id="pwd" name="pwd" placeholder="Password" required>
												</div>
											</div>
											<!-- 비밀번호 확인 -->
											<div class="col-md-6">
												<div class="form-group">
													<label for="repwd">* Confirm Password</label> 
													<input type="password" class="form-control" id="repwd" name="repwd" placeholder="Confirm Password" required>
												</div>
											</div>
											<!-- 주민번호 -->
											<div class="col-md-6">
												<div class="form-group">
													<label for="jumin">* Jumin no</label> <br> 
													<input type="text" id="jumin1" name="jumin1" placeholder="주민번호 앞자리" required> -
													<input type="password" id="jumin2" name="jumin2" placeholder="주민번호 뒷자리" required>
												</div>
											</div>
											<!-- 프로필 사진 -->
											<div class="col-md-6">
												<div class="form-group">
													<label for="image">Profile</label> 
													<input type="file" class="form-control" id="image" name="image" placeholder="Upload profile">
												</div>
											</div>
											<!-- 성별 -->
											<div class="col-md-6">										
												<div class="form-group">
													<label class="gender">* Gender</label> 
													<select class="form-control custom-select" id="gender" name="gender" required>
														<option value="성별">성별</option>
														<option value="남성">남성</option>
														<option value="여성">여성</option>
													</select> 
													<small class="form-control-feedback"> Select your gender </small>
												</div>
											</div>

											<!-- 결혼 여부 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="marry">* Marry</label> 
													<select class="form-control custom-select" id="marry" name="marry" required>
														<option value="결혼 여부">결혼 여부</option>
														<option value="기혼">기혼</option>
														<option value="미혼">미혼</option>
													</select>
												</div>
											</div>
											
											<!-- 내외국인 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="frgn">* foreignner</label> 
													<select class="form-control custom-select" id="frgn" name="frgn" required>
														<option value="내외국인">내외국인</option>
														<option value="내국인">내국인</option>
														<option value="외국인">외국인</option>
													</select>
												</div>
											</div>

											<!-- 국적 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="nation">* nation</label> 
													<select	class="form-control custom-select" id="nation" name="nation" required>
														<option value="국적">국적</option>
														<option value="한국">한국</option>
														<option value="미국">미국</option>
														<option value="중국">중국</option>
														<option value="일본">일본</option>
														<option value="프랑스">프랑스</option>
														<option value="영국">영국</option>
														<option value="홍콩">홍콩</option>
														<option value="러시아">러시아</option>
														<option value="캐나다">캐나다</option>
													</select>
												</div>
											</div>
											
											<!-- 휴대전화 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="tel">* tel</label><br>
													<input type="text" id="tel1" name="tel1" value="010" maxlength="3" required>
													-<input type="text" id="tel2" name="tel2" maxlength="4" required>
													-<input type="text" id="tel3" name="tel3" maxlength="4" required>
												</div>												
											</div>
											
											<!-- 회사 내선 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="in_tel">company tel</label><br>
													<input type="text" id="in_tel1" name="in_tel1" maxlength="3">
													-<input type="text" id="in_tel2" name="in_tel2" maxlength="4">
													-<input type="text" id="in_tel3" name="in_tel3" maxlength="4">
												</div>
											</div>
											<!-- 회사 이메일 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="tel">* company email</label><br>
													<input type="text" class="input" name="c_email1" maxlength="20" placeholder="email" required>
                              						@
                             						<input type="text" class="input" name="c_email2" maxlength="20" value="groubee.com">
                              						
												</div>												
											</div>
											
											<!-- 외부 이메일 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="tel">* email</label><br>
													<input type="text" class="input" name="email1" maxlength="20" placeholder="email" required>
                              						@
                             						<input type="text" class="input" name="email2" maxlength="20" placeholder="domain" required>
                              						<select name="email3" onchange="selectEmailChk();">
                                 						<option value= "0">직접 입력</option>
                                 						<option value= "naver.com">naver.com</option>
                                 						<option value= "gmail.com">gmail.com</option>
                                 						<option value= "daum.net">daum.net</option>
                                 						<option value= "nate.com">nate.com</option>                              
                              						</select>
												</div>												
											</div>
											
											<!-- 사원 주소 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="address">* address</label><br>
													<input type="text" class="form-control" id="address" name="address" placeholder="address" required>																										
												</div>												
											</div>
											<!-- 부서 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="depart_name">* depart</label><br>
													<select	class="form-control custom-select" id="depart_name" name="depart_name" required>
														<option value="0">부서 선택</option>
														<option value="사업부">사업부</option>
														<option value="인사부">인사부</option>
														<option value="영업부">영업부</option>
														<option value="개발부">개발부</option>
														<option value="경영지원부">경업지원부</option>
														<option value="총무부">총무부</option>														
													</select>																										
												</div>												
											</div>
											<!-- 직급 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="rank">* rank</label><br>
													<input type="text" class="form-control" id="rank" name="rank" value="사원" required>																										
												</div>												
											</div>
											<!-- 입사일 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="hireday">* hireday</label><br>
													<input type="date" class="form-control" id="hireday" name="hireday" required>																										
												</div>												
											</div>
											<!-- 사인 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="sign">sign</label><br>
													<input type="file" class="form-control" id="sign" name="sign">																										
												</div>												
											</div>
											<!-- 계좌번호 -->
											<div class="col-md-6">
												<div class="form-group">
													<label class="account">account</label><br>
													<select	id="bank" name="bank">
														<option value="0">은행선택</option>
														<option value="국민">국민</option>
														<option value="신한">신한</option>
														<option value="하나">하나</option>
														<option value="우리">우리</option>
														<option value="카카오뱅크">카카오뱅크</option>
														<option value="농협">농협</option>														
													</select>
													<input type="text" id="account" name="account">																										
												</div>												
											</div>
											<hr>
											<div class="form-actions">
                                        		<div class="card-body" style="align: center">
                                            		<button type="submit" class="btn btn-primary"><i class="fa fa-check"></i>Submit</button>
                                            		<button type="button" id="cancel" class="btn btn-dark">Cancel</button>
                                        		</div>
                                    		</div>
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
    <script type="text/javascript">	
 	// 이메일 도메인 선택 시 자동생성
    function selectEmailChk() {
    	if (document.joinform.email3.value == 0) {
    		document.joinform.email2.value = "";
    		document.joinform.email2.focus();
    		return false;
    	} else if (document.joinform.email3.value) {
    		document.joinform.email2.value = document.joinform.email3.value;
    		return false;
    	}
    }
	$(function(){		
		// cancel
		$('#cancel').click(function(){
			window.history.back();
		});
	});
	</script>
</body>
</html>