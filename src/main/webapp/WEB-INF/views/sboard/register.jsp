<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/include/header.jsp" %>
<style>
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
  
}
</style>
</head>
<body>

  <!-- Page Wrapper -->
  <div id="wrapper">
	
	<!-- sidebar -->
	<c:import url="/WEB-INF/views/include/sidebar.jsp" />

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      	<div id="content">
     		<!-- topbar -->
			<c:import url="/WEB-INF/views/include/topbar.jsp" />
    		<form action="register" method="post">
    	
    			<input type="text" name="btitle" class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요."><br>	
	    		<div class="form-group">
	    			<textarea class="form-control" rows="10" name="bcontent" placeholder="내용을 입력해주세요."></textarea><br><br>
					<label for="exampleInputEmail1">Writer</label>
					<input type="text" name="writer" class="form-control" value='${login.uid }' readonly>
	    		</div><br>
	    		<div class="text-center">
    				<button type="submit" class="btn btn-secondary mb-3">제출하기</button>
					<button type="button" class="btn btn-secondary mb-3" onclick="cancel()">취소하기</button>  			
					
					<script>
						function cancel() {
							self.location = '/sboard/listPage';
						}
					</script>
					
					
				</div>
    		
    	
    		</form>
 		</div>
 	</div>
</div>

    
</body>
</html>