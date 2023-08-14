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
    <!-- This Page CSS -->
    <link rel="stylesheet" type="text/css"
        href="${path}/resources/assets/libs/bootstrap-duallistbox/dist/bootstrap-duallistbox.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

 
</head>		
	<script>
	$(function(){
			loadline();
	});	

	function loadline(){
		$.ajax({
			url: "${path}/selectLineView.ap?${_csrf.parameterName}=${_csrf.token}",
			type: "post",
			success : function(result) {
				$("#load_line").html(result);
			},
			error: function(){
				alert("load_line 오류");
			}
		});
	};	

	
	function formselect(){
		 var form = $("#selectform option:selected").val();
			  window.open('${path}/form1.fo?form_name='+form,'문서기안','width=860,height=1100,location=no,status=no,scrollbars=yes');
		};
		
	$(function(){
		$("#all_loadline").click(function(){
			location.href = "${path}/selectAllmemform.ap?${_csrf.parameterName}=${_csrf.token}";
		});
		$("#loadline").click(function(){
			location.href = "${path}/selectform.ap?${_csrf.parameterName}=${_csrf.token}";
		});
	});
	

	
	</script>		
              <div class="card" onload = "loadline();">
                 <div class="card-body">
                    <form name = "selectform" action = "${path}/selectAppAction.ap" method = "post"> 
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">  
		                <div class="row">
		                    <div class="col-12">
		                        <div class="card">
		                            <div class="card-body">
		                                <h4 class="card-title">결재선 선택</h4>
		                                <div id = btn>
		                                <button type = "button" id = "all_loadline" class ="btn btn-secondary btn-sm">모든 부서 리스트</button>
		                                <button type = "button" id = "loadline" class ="btn btn-secondary btn-sm">해당 부서 리스트</button>
		                                </div>
		                                <select multiple="multiple" size="10" class="duallistbox" name = "getter_id">
		                                 <c:forEach var="dto" items="${list}" varStatus = "status">
		                                    <option value="${dto.id}">${dto.id}  ${dto.depart_name} ${dto.name} ${dto.rank} </option>
		                                </c:forEach>   
		                                </select>
		                              	<!-- 결재선 표기 위치 -->
		                              	<div id = "load_line"></div>
		                                <br><hr>
		                            	 <div>
					                     <h5 class="card-title">카테고리선택</h5>
					                     <h6 class="card-subtitle">카테고리를 선택하세요</h6>
					                       <select class="select2 form-control custom-select" name = "category" id = "category" style="width: 100%; height:36px;" required>
					                         <optgroup label="일반">
					                             <option value="내부기안">내부기안</option>
					                             <option value="외부공문">외부공문</option>
					                         </optgroup>
					                         <optgroup label="교육">
					                             <option value="">교육</option>
					                             <option value="교육신청">교육신청</option>
					                             <option value="교육보고">교육보고</option>
					                         </optgroup>
					                         <optgroup label="사업진행">
					                             <option value="마케팅">마케팅</option>
					                             <option value="IT">IT</option>
					                         </optgroup>
					                      </select>
				                      </div>
		                            </div>
		                        </div>
		                    </div>
		                 </div>
                      	<button type = "submit" id = "load_line_select" class ="btn btn-secondary btn-sm">결재선선택</button>  
             		  </form>
             		<div>
             		<br><hr><br> 
                     <h5 class="card-title">기안양식선택</h5>
                     <h6 class="card-subtitle">기안 양식을 선택하세요</h6>
                     <select class="select2 form-control custom-select" name = "selectform" id = "selectform" style="width: 100%; height:36px;">
                         <optgroup label="일반">
                             <option value="업무기안">업무기안</option>
                         </optgroup>
                         <optgroup label="보고">
                             <option value="회의록">회의록</option>
                             <option value="계획보고">사업계획보고</option>
                             <option value="결과보고">사업결과보고</option>
                             <option value="교육보고">교육보고서</option>
                         </optgroup>
                         <optgroup label="신청">
                             <option value="교육신청">교육신청</option>
                         </optgroup>
                      </select>
                      <br>
                      <button type = "button" class ="btn btn-secondary btn-sm" onclick="formselect(); self.close();">기안문작성</button> 
                     </div>
                       </div>
                   </div>
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
    <!-- This Page JS -->
    <script src="${path}/resources/assets/libs/bootstrap-duallistbox/dist/jquery.bootstrap-duallistbox.min.js"></script>
    <script src="${path}/resources/dist/js/pages/forms/dual-listbox/dual-listbox.js"></script>
</body>

</html>