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
                <div class="left-part">
                <%@ include file = "/WEB-INF/views/approval/submenu.jsp" %>
                </div>
                <!-- ============================================================== -->
                <!-- Right Part -->
                <!-- ============================================================== -->
                <div class="right-part mail-list overflow-auto" style="height:100%;">
                    <div class="p-3 b-b">
                        <div class="d-flex align-items-center">
                           <div>
                                <h4> 카테고리별 문서함 </h4>
                            </div>
                            <div class="ml-auto">
                                <input placeholder="문서 제목 검색" type="text" class="form-control">
                            </div>
                        </div>
                    </div>
                    <!-- Action part -->
                    <!-- Button group part -->
                    <div class="bg-light p-3 d-flex align-items-center do-block">
                        <div class="btn-group mt-1 mb-1">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input sl-all" id="cstall">
                                <label class="custom-control-label" for="cstall">Check All  카테고리별 문서함</label>
                                
                            </div>
                        </div>
                        <div class="ml-auto">
<%--                             <div class="btn-group mr-2" role="group" aria-label="Button group with nested dropdown">
                                <button type="button" class="btn btn-outline-secondary font-18" onclick="location.href='${path}/onapproval.ap'">진행</button>
                                <button type="button" class="btn btn-outline-secondary font-18" onclick="location.href='${path}/catdoclist.ap'">완료</button>
                                <button type="button" class="btn btn-outline-secondary font-18" onclick="location.href='${path}/rejapproval.ap'">반려</button>
                            </div> --%>

                        </div>
                    </div>
                    <!-- Action part -->
                    <br>
                     <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">카테고리 선택</h4>
                                <select class="select2 form-control custom-select" style="width: 100%; height:36px;">
                                    <option>Select</option>
                                    <optgroup label="Alaskan/Hawaiian Time Zone">
                                        <option value="AK">Alaska</option>
                                        <option value="HI">Hawaii</option>
                                    </optgroup>
                                    <optgroup label="Pacific Time Zone">
                                        <option value="CA">California</option>
                                        <option value="NV">Nevada</option>
                                        <option value="OR">Oregon</option>
                                        <option value="WA">Washington</option>
                                    </optgroup>
                                    <optgroup label="Mountain Time Zone">
                                        <option value="AZ">Arizona</option>
                                        <option value="CO">Colorado</option>
                                        <option value="ID">Idaho</option>
                                        <option value="MT">Montana</option>
                                        <option value="NE">Nebraska</option>
                                        <option value="NM">New Mexico</option>
                                        <option value="ND">North Dakota</option>
                                        <option value="UT">Utah</option>
                                        <option value="WY">Wyoming</option>
                                    </optgroup>
                                    <optgroup label="Central Time Zone">
                                        <option value="AL">Alabama</option>
                                        <option value="AR">Arkansas</option>
                                        <option value="IL">Illinois</option>
                                        <option value="IA">Iowa</option>
                                        <option value="KS">Kansas</option>
                                        <option value="KY">Kentucky</option>
                                        <option value="LA">Louisiana</option>
                                        <option value="MN">Minnesota</option>
                                        <option value="MS">Mississippi</option>
                                        <option value="MO">Missouri</option>
                                        <option value="OK">Oklahoma</option>
                                        <option value="SD">South Dakota</option>
                                        <option value="TX">Texas</option>
                                        <option value="TN">Tennessee</option>
                                        <option value="WI">Wisconsin</option>
                                    </optgroup>
                                    <optgroup label="Eastern Time Zone">
                                        <option value="CT">Connecticut</option>
                                        <option value="DE">Delaware</option>
                                        <option value="FL">Florida</option>
                                        <option value="GA">Georgia</option>
                                        <option value="IN">Indiana</option>
                                        <option value="ME">Maine</option>
                                        <option value="MD">Maryland</option>
                                        <option value="MA">Massachusetts</option>
                                        <option value="MI">Michigan</option>
                                        <option value="NH">New Hampshire</option>
                                        <option value="NJ">New Jersey</option>
                                        <option value="NY">New York</option>
                                        <option value="NC">North Carolina</option>
                                        <option value="OH">Ohio</option>
                                        <option value="PA">Pennsylvania</option>
                                        <option value="RI">Rhode Island</option>
                                        <option value="SC">South Carolina</option>
                                        <option value="VT">Vermont</option>
                                        <option value="VA">Virginia</option>
                                        <option value="WV">West Virginia</option>
                                    </optgroup>
                                </select>
                                <br>
                                </div>
                                </div>
                    <!-- list-->
                      <div class="table-responsive">
                        <table class="table email-table no-wrap table-hover v-middle">
                            <tbody>
                                <!-- row -->
                                <tr class="unread">
                                    <!-- label -->
                                    <td class="user-image p-2">
                                    	<h6 class="mb-0 text-truncate font-weight-medium">상태
                                    </td>
                                    <td class="user-name px-1 py-2">
                                        <h6 class="mb-0 text-truncate font-weight-medium">문서번호</h6>
                                    </td>
                                    <td class="py-2 px-3 no-wrap text-truncate"> 
                                        <h6 class="mb-0 text-truncate font-weight-medium">문서제목</h6>
                                    </td>
                                    <td class="clip px-1 py-2"><i class="fa fa-paperclip"></i></td>
                                    <td class="time text-right"> 
                                    <h6 class="mb-0 text-truncate font-weight-medium">기안일 </h6></td>
                                </tr>
                                <!-- row -->
                                <c:forEach var = "dto" items="${list}">    
                                <tr class="unread">
                                    <!-- label -->
                                    <td class="user-image p-2"><span class="badge badge-warning blue-grey-text text-darken-4 mr-2">${dto.state}</span> </td>
                                    <td class="user-name px-1 py-2">
                                        <h6 class="mb-0 text-truncate font-weight-medium">bee-22-${dto.doc_id}</h6>
                                    </td>
                                    <td class="py-2 px-3 no-wrap text-truncate"> 
                                           <a onclick="window.open('${path}/doc_detailAction.fo?doc_id=${dto.doc_id}','기안문서','width=850,height=1100,scrollbars=yes');" href="${path}/catdoclist.ap?stateid=com"> <span class="blue-grey-text text-darken-4">${dto.title}</span></a>
                                    </td>
                                    <td class="clip px-1 py-2"><i class="fa fa-paperclip"></i></td>
                                    <td class="time text-right">${dto.upday}</td>
                                </tr>
                                </c:forEach>
                        </table>
                    </div>
                    <!-- 페이징  -->                    
                    <div class="p-3 mt-4">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                            	<!-- 이전 버튼 -->
                            	<c:forEach var = "dto" items="${list}" begin = "0" end = "0">
	                            	<c:if test="${paging.startPage > 10}">
	                            		<li class="page-item"><a class="page-link" href="${path}/catdoclist.ap?stateid=${dto.stateid}&pageNum=${paging.prev}">Previous</a></li>
									</c:if>
									<!-- 페이지 -->
									<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
										<li class="page-item"><a class="page-link" href="${path}/catdoclist.ap?stateid=${dto.stateid}&pageNum=${num}">${num}</a></li>
									</c:forEach>
									<!-- 다음 버튼 -->
									<c:if test="${paging.endPage < paging.pageCount}">
										<li class="page-item"><a class="page-link" href="${path}/catdoclist.ap?stateid=${dto.stateid}&pageNum=${paging.next}">Next</a></li>
									</c:if>
								</c:forEach>
                            </ul>
                        </nav>
                    </div>
                </div>
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
</body>

</html>