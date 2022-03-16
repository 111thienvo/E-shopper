<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:layout_user title="Cart">
	
	<jsp:attribute name="content">

			<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="${pageContext.request.contextPath}/user/home">Home</a></li>
				  <li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
			<form method="post" action="${pageContext.request.contextPath }/user/cart/update">
				
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td style="text-align: center;" class="image"><input style=" zoom: 1.5; "  type="checkbox" name="" id="" class="select_all"></td>
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity </td>
							<td class="total">Total</td>
							<td></td>
							
						</tr>
					</thead>
					
					<c:set var="total" value="0"></c:set>
							<c:forEach var="item" items="${sessionScope.cart }" varStatus="i">
							<c:set var="total"
									value="${total + item.quantity * item.product.price }"></c:set>
					<tbody>
						<tr>
							<td style="text-align: center;" class="cart_description">
							
								 <input  style=" zoom: 1.5;" name="cart_checkbox" class="cart_checkbox" type="checkbox" >
							</td>
							<td class="cart_product">
								<a href=""><img width="100px" src="${pageContext.request.contextPath}/assets/uploads/${item.product.photo}" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="${pageContext.request.contextPath}/user/shop/detail?id=${item.product.id }">${item.product.name }</a></h4>
								<p>ID: ${item.product.sku }</p>
							</td>
							<td class="cart_price">
								<p>$${item.product.price }</p>
							</td>
							<!-- <td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div>
							</td> -->
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									
									<input class="cart_quantity_input" type="number"  name="quantity" value="${item.quantity }" min="1" max="1000" autocomplete="off" size="2">
									
								</div>
							</td>
							<!-- <td class="cart_total" > -->
							<td class="cart_total_price"  data-cart_total_price="${item.product.price * item.quantity }">$&nbsp;${item.product.price * item.quantity }
								
								<!-- <p class="cart_total_price"  >$${item.product.price * item.quantity }</p> -->
								<input hidden="${item.product.id }">
							</td>
							<td class="cart_delete">
								
								<a onclick="return confirm('Are you sure you want to delete this product?');" class="cart_quantity_delete" href="${pageContext.request.contextPath }/user/cart/remove?index=${i.index}"><i class="fa fa-times"></i></a>
							</td>
							
						</tr>
					</tbody>
					</c:forEach>
				</table>
				<input type="submit" style="font-size: 16px;" class="btn btn-default update"  value="Update">
				<a class="btn btn-default check_out" href="${pageContext.request.contextPath }/user/shop">Continue Shopping</a>
				</form>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<!-- <h3>What would you like to do next?</h3>
				<p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p> -->
			</div>
			<div class="row">
				<div class="col-sm-6">
					
				</div>
				<div class="col-sm-6">
					<div class="total_area">
						<ul>	
							<li>Shipping Cost <span>Free</span></li>
							<li>Total <span class="overall_total"></span></li>
						</ul>
							<!-- <a class="btn btn-default update" href="">Update</a> -->
							<a class="btn btn-default check_out" href="">Check Out</a>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	$('.select_all').on('change', function() {
		  $('.cart_checkbox').not(this).prop('checked', this.checked);
		  sum(); //call this 
		});

		$(".cart_checkbox").change(function() {
		  var total_length = $(".cart_checkbox").length;
		  var checked_length = $(".cart_checkbox:checked").length;
		 
		  //check if length less then total
		  if (checked_length < total_length) {
		    $('.select_all').prop('checked', false); //uncheck..
		  } else {
		    $('.select_all').prop('checked', true); //check
		  }
		   sum();//call this
		})

		function sum() {

		  var overall_total = 0;
		  //loop through only checked trs..
		  $(".cart_checkbox:checked").closest("tr").find('.cart_total_price').each(function() {
			  cart_total_price =  total_price = $(this).data('cart_total_price');
			  console.log(cart_total_price);
		    overall_total = overall_total + parseFloat(cart_total_price);
		  })
		  $('.overall_total').text("$"+overall_total);
		}
</script>
	</jsp:attribute>
</mt:layout_user>