<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="mtags" uri="http://mytags.vn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:layout_user title="Shop">
	
	<jsp:attribute name="content">
<link rel="stylesheet"
			href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$('#buttonDemo1').click(function() {
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath }/ajax/demo1',
				success : function(data) {
					$('#result1').html(data);
				}
			});
		});
	});
</script>
			<section id="advertisement">
		<div class="container">
			<img src="${pageContext.request.contextPath}/resources/user/images/shop/advertisement.jpg" alt="" />
		</div>
	</section>
	
	<section>
		<div class="container">
			<div class="row">
				<mtags:category/>
				
				
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Features Items</h2>
						<c:forEach var="product" items="${products }">
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img  src="${pageContext.request.contextPath}/assets/uploads/${product.photo}" alt="" />
										<h2>$${product.price }</h2>
										<p>${product.name }</p>
										<a href="${pageContext.request.contextPath}/user/cart/add_cart?id=${product.id }" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2>$${product.price }</h2>
											<p>${product.name }</p>
											<a href="${pageContext.request.contextPath}/user/cart/add_cart?id=${product.id }" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
										</div>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href="${pageContext.request.contextPath}/user/shop/detail?id=${product.id }"><i class="fa fa-info"></i>Detail</a></li>
										<!-- <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li> -->
										<!-- <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li> -->
									</ul>
								</div>
							</div>
						</div>
						</c:forEach>	
						<!-- <ul class="pagination">
							<li class="active"><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">&raquo;</a></li>
						</ul> -->
					</div><!--features_items-->
				</div>
				
			</div>
		</div>
	</section>
   
	</jsp:attribute>
</mt:layout_user>