<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>


<mt:layout_user title="Product-Detail">
	
	<jsp:attribute name="content">
	
			<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">

						<div class="shipping text-center"><!--shipping-->
							<img src="${pageContext.request.contextPath}/resources/user/images/home/shipping.jpg" alt="" />
						</div><!--/shipping-->
						
					</div>
				</div>
				
				<div class="col-sm-9 padding-right">
					<div class="product-details"><!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<img src="${pageContext.request.contextPath}/assets/uploads/${product.photo }" width="100" alt="" />
							</div>
							<div id="similar-product" class="carousel slide" data-ride="carousel">
								
								 <%--  <!-- Wrapper for slides -->
								    <div class="carousel-inner">
										<div class="item active">
										  <a href=""><img src="${pageContext.request.contextPath}/resources/user/images/product-details/similar1.jpg" alt=""></a>
										  <a href=""><img src="${pageContext.request.contextPath}/resources/user/images/product-details/similar2.jpg" alt=""></a>
										  <a href=""><img src="${pageContext.request.contextPath}/resources/user/images/product-details/similar3.jpg" alt=""></a>
										</div>
										<div class="item">
										  <a href=""><img src="${pageContext.request.contextPath}/resources/user/images/product-details/similar1.jpg" alt=""></a>
										  <a href=""><img src="${pageContext.request.contextPath}/resources/user/images/product-details/similar2.jpg" alt=""></a>
										  <a href=""><img src="${pageContext.request.contextPath}/resources/user/images/product-details/similar3.jpg" alt=""></a>
										</div>
										<div class="item">
										  <a href=""><img src="${pageContext.request.contextPath}/resources/user/images/product-details/similar1.jpg" alt=""></a>
										  <a href=""><img src="${pageContext.request.contextPath}/resources/user/images/product-details/similar2.jpg" alt=""></a>
										  <a href=""><img src="${pageContext.request.contextPath}/resources/user/images/product-details/similar3.jpg" alt=""></a>
										</div>
										
									</div> --%>

								  <!-- Controls -->
								  <a class="left item-control" href="#similar-product" data-slide="prev">
									<i class="fa fa-angle-left"></i>
								  </a>
								  <a class="right item-control" href="#similar-product" data-slide="next">
									<i class="fa fa-angle-right"></i>
								  </a>
							</div>

						</div>
						<div class="col-sm-7">
							<div class="product-information"><!--/product-information-->
								<img src="${pageContext.request.contextPath}/resources/user/images/product-details/new.jpg" class="newarrival" alt="" />
								<h2>${product.name }</h2>
								<p>ID: ${product.sku }</p>
								<%-- <img src="${pageContext.request.contextPath}/resources/user/images/product-details/rating.png" alt="" /> --%>
								<span>
									<span> $${product.price }</span>
									<!-- <label>Quantity:</label>
									<input type="number" value="1" min="1" max="1000"/> -->
									<a href="${pageContext.request.contextPath}/user/cart/add_cart?id=${product.id }" class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i>
										Add to cart
									</a>
								</span>
								
								<p><b>Description:</b> ${product.description }</p>
								<p><b>Category:</b> E-SHOPPER</p>
								<a href=""><img src="${pageContext.request.contextPath}/resources/user/images/product-details/share.png" class="share img-responsive"  alt="" /></a>
							</div><!--/product-information-->
						</div>
					</div><!--/product-details-->
					
					<div class="category-tab shop-details-tab"><!--category-tab-->
						<div class="col-sm-12">
							<ul class="nav nav-tabs">
								<!-- <li><a href="#details" data-toggle="tab">Details</a></li> -->
								<!-- <li><a href="#companyprofile" data-toggle="tab">Company Profile</a></li> -->
								<li><a href="#product" data-toggle="tab">Product</a></li>
								<li class="active"><a href="#reviews" data-toggle="tab">Reviews (5)</a></li>
							</ul>
						</div>
						
						<div class="tab-content">
						
							<div class="tab-pane fade" id="product" >
							<c:forEach var="item" items="${products }">
								<div class="col-sm-3">
									<div class="product-image-wrapper">
										<div class="single-products">
											<div class="productinfo text-center">
												<img src="${pageContext.request.contextPath}/assets/uploads/${item.photo }" width="100" height="110" alt="" />
												<h2>$${item.price }</h2>
												<p>${item.name }</p>
												<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
											</div>
										</div>
									</div>
								</div>
								</c:forEach>
							</div>
								
							<div class="tab-pane fade active in" id="reviews" >
								<div class="col-sm-12">
								   <c:set var = "now" value = "<%=new java.util.Date()%>" />
									<ul>
									
										<li><a href=""><i class="fa fa-user"></i></a></li>
										<li><a href=""><i class="fa fa-clock-o"></i><fmt:formatDate type = "time" value = "${now}" /></a></li>
										<li><a href=""><i class="fa fa-calendar-o"></i><fmt:formatDate type = "date" value = "${now}" /></a></li>
									</ul>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
									<p><b>Write Your Review</b></p>
									
									<form action="#">
										<span>
											<input type="text" placeholder="Your Name"/>
											<input type="email" placeholder="Email Address"/>
										</span>
										<textarea name="" ></textarea>
										<b>Rating: </b> <img src="${pageContext.request.contextPath}/resources/user/images/product-details/rating.png" alt="" />
										<button type="button" class="btn btn-default pull-right">
											Submit
										</button>
									</form>
								</div>
							</div>
							
						</div>
					</div><!--/category-tab-->
					
						<div class="recommended_items"><!--recommended_items-->
						<h2 class="title text-center">recommended items</h2>						
						<div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner">
								<div class="item active">	
								<c:forEach var="items" items="${products }">
									<div class="col-sm-4">
										<div class="product-image-wrapper">
											<div class="single-products">
												<div class="productinfo text-center">
													<img src="images/home/recommend3.jpg" alt="" />
													<h2>$${items.price }</h2>
													<p>Easy Polo Black Edition</p>
													<button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
								
							</div>
							 <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
								<i class="fa fa-angle-left"></i>
							  </a>
							  <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
								<i class="fa fa-angle-right"></i>
							  </a>			
						</div>
					</div><!--/recommended_items-->
					
				</div>
			</div>
		</div>
	</section>
	</jsp:attribute>
</mt:layout_user>