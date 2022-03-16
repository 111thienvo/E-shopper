<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:layout_user title="Login-Register">
	
	<jsp:attribute name="content">
	
		<section id="form"><!--form-->
						  <h4 style="color: red ; text-align: center; "> ${sessionScope.msg} </h4>
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">

					<div class="login-form"><!--login form-->
						
						<h2>Login to your account</h2>
						<form action="${pageContext.request.contextPath}/user/account/process-login" method="post">
							<input type="text" placeholder="Enter Username" name="username" />
							<input type="password" placeholder="Enter Password" name="password" />
							<%-- <span>
								<input type="checkbox" class="checkbox"> 
								Keep me signed in
							</span> --%>
							<button type="submit" class="btn btn-default">Login</button>
						</form>
						
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>New User Signup!</h2>
						<form action="#">
							<input type="text" placeholder="Name"/>
							<input type="email" placeholder="Email Address"/>
							<input type="password" placeholder="Password"/>
							<button type="submit" class="btn btn-default">Signup</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
 
	</jsp:attribute>
</mt:layout_user>