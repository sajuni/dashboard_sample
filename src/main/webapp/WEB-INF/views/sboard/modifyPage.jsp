<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<%@ include file = /WEB-INF/views/include/header.jsp %>
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
				
				<form method="post" name="form">
					<input type="hidden" name="bno" value="${board.bno}">
					<input type="hidden" name="page" value="${cri.page} ">
					<input type="hidden" name="perPageNum" value="${cri.perPageNum}"> 
					<input type="hidden" name="searchType" value="${cri.searchType}">
					<input type="hidden" name="keyword" value="${cri.keyword}">
				</form>
				
				<div class="box-body">
				
					<div class="form-group">
						<label for="exampleInputEamil">게시글 제목</label><input type="text" id="btitle" name="title" class="form-control" value="${board.btitle}">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">게시글 내용</label><textarea class="form-control" name="content" rows="3" id="bcontent">${board.bcontent}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">작성자</label><input type="text" id="bwriter" name="writer" class="form-control" value="${board.bwriter}" readonly="readonly">
					</div>
				</div>
				
				<div class="box-footer text-center" style="width: 100%">
					<button type="submit" class="btn btn-warning" onclick="save()">SAVE</button>
					<button type="submit" class="btn btn-primary" onclick="cancel()">CANCEL</button>
				</div>
				
				<script>
					var formObj = document.form;

					function save() {
						
						var title = document.getElementById('btitle').value;
						var content = document.getElementById('bcontent').value;

						let inputTitle = document.createElement('input');
						let inputContent = document.createElement('input');

						inputTitle.setAttribute("type","hidden");
						inputTitle.setAttribute("name", "btitle");
						inputTitle.setAttribute("value", title);
						inputContent.setAttribute("type","hidden");
						inputContent.setAttribute("name", "bcontent");
						inputContent.setAttribute("value", content);
						
						formObj.appendChild(inputTitle);
						formObj.appendChild(inputContent);			
						formObj.setAttribute('action', '/sboard/modifyPage');
						formObj.setAttribute('method', 'post');
						formObj.submit();
					
					}

					function cancel() {
						self.location = "/sboard/readPage?bno="+formObj.bno.value+"&page="+formObj.page.value+"&perPageNum="+formObj.perPageNum.value;
					}
				</script>
				
				
			</div>
		</div>
	</div>
</body>
</html>