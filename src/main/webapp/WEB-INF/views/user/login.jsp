<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<%@ include file = "/WEB-INF/views/include/header.jsp" %>
  </head>
  <body class="login-page">
      <div class="login-box">
      <div class="login-logo">
        <a href="/resources/index2.html"><b>Zerock</b>Project</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>
  
  	<form id='loginForm' action="/user/loginPost" method="post">
	    <div class="form-group has-feedback">
	    <input type="text" name="uid" class="form-control" placeholder="USER ID"/>
	    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
	  </div>
	  <div class="form-group has-feedback">
	    <input type="password" name="upw" class="form-control" placeholder="Password"/>
	    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
	  </div>
	  <div>
	    <div class="col-xs-8">    
	      <div class="checkbox icheck">
	        <label>
	        <input type="checkbox" name="userCookie">
	          Remember
	        </label>
	      </div>                        
	    </div><!-- /.col -->
	    <div class="col-xs-4">
	      <button type="submit" class="btn btn-primary btn-block btn-flat btn-login">Sign In</button>
	    </div><!-- /.col -->
	  </div>	
  	</form>
  	</div>
  	</div>
  </body>
</html>