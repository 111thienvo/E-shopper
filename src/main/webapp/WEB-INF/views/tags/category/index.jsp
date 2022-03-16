<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							
							<div class="panel panel-default">
							<c:forEach var="category" items="${categories }">
								<div class="panel-heading">
								<input hidden="${category.id }">
									<h4 class="panel-title">
										<a href="${pageContext.request.contextPath }/user/shop/category/find/${category.id }">
											<span class="badge pull-right"></span>											
											${category.name }
										</a>
									</h4>
								</div>
								</c:forEach>	
							</div>	
								
						</div> <!--/category-productsr-->
					
						<%-- <div class="brands_products"><!--brands_products-->
							<h2>Brands</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<li><a href=""> <span class="pull-right">(50)</span>Acne</a></li>
									<li><a href=""> <span class="pull-right">(56)</span>Grüne Erde</a></li>
									<li><a href=""> <span class="pull-right">(27)</span>Albiro</a></li>
									<li><a href=""> <span class="pull-right">(32)</span>Ronhill</a></li>
									<li><a href=""> <span class="pull-right">(5)</span>Oddmolly</a></li>
									<li><a href=""> <span class="pull-right">(9)</span>Boudestijn</a></li>
									<li><a href=""> <span class="pull-right">(4)</span>Rösch creative culture</a></li>
								</ul>
							</div>
						</div><!--/brands_products--> --%>
						
						<!-- <div class="price-range">price-range
							<h2>Price Range</h2>
							<div class="well">
								 <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
								 <b>$ 0</b> <b class="pull-right">$ 600</b>
							</div>
						</div>/price-range -->
						
						<div class="shipping text-center"><!--shipping-->
							<img src="${pageContext.request.contextPath}/resources/user/images/home/shipping.jpg" alt="" />
						</div><!--/shipping-->
						
					</div>
				</div>