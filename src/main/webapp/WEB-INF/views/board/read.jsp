<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Tables</title>

  <!-- Custom fonts for this template -->
  <link href="../../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../../resources/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="../../resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>
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
<body>

	<div id="wrapper">
		<!-- sidebar -->
		<c:import url="/WEB-INF/views/include/sidebar.jsp" />
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<c:import url="/WEB-INF/views/include/topbar.jsp" />
				
				<form method="post" name="form">
					<input type="hidden" name="bno" value="${board.bno}">
				</form>
				
		
				<div class="box-body">
				
					<div class="form-group">
						<label for="exampleInputEamil">게시글 제목</label><input type="text" id="title" name="title" class="form-control" value="${board.title}" readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">게시글 내용</label><textarea class="form-control" name="content" rows="3" readonly="readonly">${board.content}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">작성자</label><input type="text" id="writer" name="writer" class="form-control" value="${board.writer}" readonly="readonly">
					</div>
				</div>
				
				<div class="box-footer text-center" style="width: 100%">
					<button type="submit" class="btn btn-warning" onclick="modify()">Modify</button>
					<button type="submit" class="btn btn-danger" onclick="remove()">REMOVE</button>
					<button type="submit" class="btn btn-primary" onclick="listAll()">LIST ALL</button>
				</div>
				
				<script>
					var formObj = document.form;
					var title = document.getElementById('title').value;
					var writer = document.getElementById('writer').value;
					function modify() {
						console.log(formObj);
						formObj.setAttribute('action', '/board/modify');
						formObj.setAttribute('method', 'get');					
						formObj.submit();
						
					}

					function remove() {

						formObj.setAttribute('action','/board/remove');
						formObj.submit();
						
					}

					function listAll() {
						self.location = "/board/list";
					}
				</script>
				
			</div>
		</div>
	</div>

</body>
</html>