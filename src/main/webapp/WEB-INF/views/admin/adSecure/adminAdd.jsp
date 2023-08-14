<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/setting.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 추가 팝업 창</title>

	<script type="text/javascript">
	 
	/* window.onload=function(){  
		 var pop_btn = document.getElementById('pop_btn');  
		 pop_btn.onclick=function(){   
			 document.myForm.target= opener.name; //호출하고자하는 부모창의 이름  
			 document.myForm.submit(); // 폼 전송   
			 self.close(); //창 닫기   } }; */
	 
			/*  window.opener.name = "parentPage"; // 부모창의 이름 설정
			     document.popForm.target = "parentPage"; // 타켓을 부모창으로 설정
			     document.popForm.action = "/target/parentPage2.do";  //부모창에 호출될 url 
			     document.popForm.submit();
			     self.close();
			 출처: https://tnsgud.tistory.com/579 [Soon Gud Story:티스토리]
		 */
		$(function(){
			$("#all_check").change(function() {
		         var is_checked = $("#all_check").is(":checked");
		         $(".p_selectChk").prop("checked", is_checked); // is_checked : true
		      });
			//수정
			$("#checkAdd").click(function(){
				/* if( $('input:checkbox[name="chk_secure"]:checked').value() != null ){ */
					if(confirm("관리자를 추가하시겠습니까?")){
					
						document.adminAddGroubee.target= opener.adSecureGroubee; //호출하고자하는 부모창의 이름  (form name) //부모 페이지로 컨트롤러 리다이렉트
					    document.adminAddGroubee.action = "${path}/adminAdd2.ad" // 폼 전송   
					    document.adminAddGroubee.submit();
					    opener.reloadPage();
					    self.close();
					}
				/* }else {
					alert("선택");
				} */
			});
		});
			
	</script>

</head>
<body>
<div class="card">
	<div class="card-body">
        <h4 class="card-title">관리자 추가</h4>
        <br>
        <br><br>
        <button type="button" class="btn btn-secondary" id="checkAdd">운영자 추가</button>
        <br><br>
        <div class="table-responsive">
        	<form name="adminAddGroubee" method="post" action = "${path}/adminAdd2.ad">
        		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	            <table class="tablesaw no-wrap table-bordered table-hover table" data-tablesaw>
	                    <tr>
	                        <th scope="col" class="border">
	                        	<label for="all_check">
	                        		<input type="checkbox" id="all_check">
	                        		<span class="sr-only"></span>
	                        	</label>
	                        </th>
	                        <th>사번</th>
	                        <th scope="col" class="border">
	                        	이름(이메일)                                               	                                          
	                        </th>
	                        <th scope="col" class="border">부서</th>
	                        <th>내선번호</th>
	                        <th>재직상태</th>
	                        <th align="center" scope="col" class="border">입사일</th>
	                        <th>관리자 권한<th>                                              
	                    </tr>
	               		<c:forEach var="dto" items="${list}">
	                    <tr class="admin_detail">
	                        <td>
	                        	<label for="chk">
	                        		<input type="checkbox" class="p_selectChk" name="chk_secure" id="chk" value="${dto.id}">
	                        		<span class="sr-only"></span>
	                        	</label>
	                        </td>
	                        <td>${dto.id}</td>
	                        <td>${dto.name}
	                        	(${dto.email_in})
	                        </td>  
	                        <td>${dto.depart_name}</td>
	                        <td>${dto.in_tel}</td>
	                        <td>${dto.state}</td>
	                        <td>${dto.hireday}</td>
	                        <td>	                        	     
		                        <select class="administrator" id="administrator" name="administrator">
									<option label="선택">선택</option> 
									<option value="ROLE_ATTEND">근태관리</option>
									<option value="ROLE_APPROVAL">결재문서관리</option>
									<option value="ROLE_SECURE">보안관리</option>
									<option value="ROLE_DEPARTMENT">부서관리</option>
									<option value="ROLE_SERVICE">서비스관리</option>
									<option value="ROLE_HUMAN">인사관리</option>
									<option value="ROLE_BOARD">게시판관리</option>
									<option value="ROLE_NOTEBOX">쪽지함관리</option>
									
								</select>
	                        </td>                                                
	                    </tr>
	                    </c:forEach>	
	                    
	                    <tr align="center" height="100">
	     					<td colspan="8" align="center">
	                   		
	                    		<%-- <% 페이징 처리%> --%>
	                    		<%-- <% 이전 버튼 활성화 여부%> --%>
	                   
	                    		<c:if test="${paging.startPage > 10}">
	                    			<a href="${path}/adminAdd.ad?pageNum=${paging.prev}">[이전]</a>
	                    		</c:if>
	                   
	                    		<%-- <% 페이지 번호 처리%> --%>
	                    		<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
	                    			<a href="${path}/adminAdd.ad?pageNum=${num}">${num}</a>
	                    		</c:forEach>
	                    		
	                    		<%-- <% 다음버튼 활성화 여부 %> --%>
	                    		<c:if test="${paging.endPage < paging.pageCount}">
	                    			<a href="${path}/adminAdd.ad?pageNum=${paging.next}">[다음]</a>
	                    		</c:if>
	     					</td>
	        			</tr>
	            </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>