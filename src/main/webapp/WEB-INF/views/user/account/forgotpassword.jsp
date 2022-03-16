<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:layout_user title="Login-Register">
	
	<jsp:attribute name="content">
	
		<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Forgot Password</h2>
						<form action="${pageContext.request.contextPath}/user/account/forgotpassword" method="post">
							<input type="text" placeholder="Enter Username" name="username" />
							<input type="text" placeholder="Enter Email" name="email" />
							<%-- <span>
								<input type="checkbox" class="checkbox"> 
								Keep me signed in
							</span> --%>
							<button type="submit" class="btn btn-default">Enter</button>
						</form>
					</div><!--/login form-->
				</div>
				
			</div>
		</div>
	</section><!--/form-->
   
	</jsp:attribute>
</mt:layout_user>