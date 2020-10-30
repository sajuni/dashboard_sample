<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>게시판 - 등록</title>

  <!-- Custom fonts for this template -->
  <link href="../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../../resources/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="../../resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
    	
    			<input type="text" name="btitle" class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요.">		
	    		<div class="form-group">
	    			<textarea class="form-control" rows="10" name="bcontent" placeholder="내용을 입력해주세요."></textarea>
	    		</div>
	    		<div class="text-center">
    				<button type="submit" class="btn btn-secondary mb-3">제출하기</button>
					<button type="button" class="btn btn-secondary mb-3" onclick="cancel()">취소하기</button>  			
					
					<script>
						function cancel() {
							self.location = '/board/listPage';
						}
					</script>
					
				</div>
    		</form>
 		</div>
 	</div>
</div>
 
    
	  <!-- Bootstrap core JavaScript-->
  <script src="../../resources/vendor/jquery/jquery.min.js"></script>
  <script src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="../../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="../../resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="../../resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="../../resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="../../resources/js/demo/datatables-demo.js"></script>
    
</body>
</html>