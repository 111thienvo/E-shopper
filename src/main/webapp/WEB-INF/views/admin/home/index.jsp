<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:layout_admin title="Admin-Page"> 
	
	<jsp:attribute name="content">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	        <div class="row">
		    <div class="col-sm-6 col-md-6 col-lg-3">
		        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
		            <div class="iq-card-body">
		                <div class="d-flex align-items-center justify-content-between">
		                    <h6>Products</h6>
		                    <span class="iq-icon" data-toggle="tooltip" data-placement="bottom" title="Number of Product"><i
		                            class="ri-information-fill"></i></span>
		                </div>
		                <div class="iq-customer-box d-flex align-items-center justify-content-between mt-3">
		                    <div class="iq-map text-primary font-size-32"><i class="ri-bar-chart-grouped-line"></i></div>
		                    <div class="d-flex align-items-center">
		                        <h2>${countProduct }</h2>
		                        <div class="rounded-circle iq-card-icon iq-bg-primary ml-3"> <i class="fa fa-product-hunt"></i></div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-6 col-md-6 col-lg-3">
		        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
		            <div class="iq-card-body">
		                <div class="d-flex align-items-center justify-content-between">
		                    <h6>Orders </h6>
		                    <span class="iq-icon" data-toggle="tooltip" data-placement="bottom" title="Number of Track"><i
		                            class="ri-information-fill"></i></span>
		                </div>
		                <div class="iq-customer-box d-flex align-items-center justify-content-between mt-3">
		                    <div class="iq-map text-success font-size-32"><i class="ri-bar-chart-grouped-line"></i></div>
		                    <div class="d-flex align-items-center">
		                       <%--  <h2>${countOrder }</h2> --%>
		                        <div class="rounded-circle iq-card-icon iq-bg-success ml-3"><i class="fa fa-shopping-cart"></i></div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-sm-6 col-md-6 col-lg-3">
		        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
		            <div class="iq-card-body">
		                <div class="d-flex align-items-center justify-content-between">
		                    <h6>Users</h6>
		                    <span class="iq-icon" data-toggle="tooltip" data-placement="bottom" title="Number of User"><i
		                            class="ri-information-fill"></i></span>
		                </div>
		                <div class="iq-customer-box d-flex align-items-center justify-content-between mt-3">
		                    <div class="iq-map text-danger font-size-32"><i class="ri-bar-chart-grouped-line"></i></div>
		                    <div class="d-flex align-items-center">
		                        <h2>${countUser }</h2>
		                        <div class="rounded-circle iq-card-icon iq-bg-danger ml-3"><i class="las la-user-tie"></i></div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    
		    <!-- Progress Chart -->
		    <!-- TOP Order Product -->
		    <div class="col-lg-12">
		        <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
		            <div class="iq-card-body">
		                <div id="progress-top5_OrderProduct"></div>
		            </div>
		        </div>
		    </div>
		    <!-- end Progress Chart -->


		               <!-- best track -->
		               <div class="col-lg-12">
		                  <div class="iq-card iq-card-block iq-card-stretch iq-card-height">
		                     <div class="iq-card-header d-flex justify-content-between">
		                        <div class="iq-header-title">
		                           <h4 class="card-title">New Product</h4>
		                        </div>
		                        <div class="iq-card-header-toolbar d-flex align-items-center">
		                           <a href="${pageContext.request.contextPath }/admin/manage_product" type="button" class="btn btn-outline-primary">View All</a>
		                        </div>
		                     </div>
		                     <div class="iq-card-body rec-pat">
		                        <div class="table-responsive">
		                           <table class="table table-striped mb-0 table-borderless">
		                              <thead>
		                                 <tr>
		                                    <th style="width: 5%;">No</th>
		                                    <th style="width: 15;">Name</th>
		                                    <th style="width: 5%;">Description</th>
		                                    <th style="width: 10%;">SKU</th>
		                                    <th style="width: 5%;">Category</th>
		                                    <th style="width: 10%;">createdAt</th>
		                                    <th style="width: 10%;">modifiedAt</th>
		                                    <th style="width: 10%;">Price</th>
		                                    <th style="width: 10%;">Quantity</th>
		                                   <!--  <th style="width: 8%;">Status</th> -->
		                                 </tr>
		                              </thead>
		                              <tbody>
		                              	 <c:forEach var="newProduct" items="${newProduct }" varStatus="i">
			                                 <tr>
			                                    <td>${i.index + 1 }</td>
			                                    <td>
			                                       <div class="media align-items-center">
			                                          <img src="${pageConext.request.contextPath }/assets/uploads/${newProduct.photo }" class="img-fluid avatar-35 rounded" alt="image">
			                                          <div class="media-body ml-3">
			                                             <p class="mb-0">
				                                             ${newProduct.name }
			                                              	<span style="color: var(--iq-danger)"><i class="las la-star"></i></span>
		                                              	 </p>
			                                          </div>
			                                       </div>
			                                    </td>
			                                    <td>
			                                    	<span>${newProduct.description}</span>
			                                    </td>
			                                     <td>
			                                    	<span>${newProduct.sku}</span>
			                                    </td>
			                                     <td>
			                                    	<span>${newProduct.category.name}</span>
			                                    </td>
			                                    <td><fmt:formatDate value="${newProduct.createdAt }" type="date" pattern="dd/MM/yyyy"/></td>
			                                    <td><fmt:formatDate value="${newProduct.modifiedAt }" type="date" pattern="dd/MM/yyyy"/></td>
			                                    <td>
			                                    	<span>$${newProduct.price}</span>
			                                    </td>
			                                     <td>
			                                    	<span>${newProduct.quantity}</span>
			                                    </td>
			                                 </tr>
		                                 </c:forEach>
		                              </tbody>
		                           </table>
		                        </div>
		                     </div>
		                  </div>
		               </div>
		 </div>
		
            <!-- end best track -->
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<%-- <script>
$(document).ready(function () {
	$.ajax({
		type: 'GET',
		url: '${pageContext.request.contextPath}/admin/dashboard/load-top5_OrderProduct-data',
		success: function(orders){
			top5_Orders = orders;
			console.log("size: " + top5_Orders.length);
			/*Top 5 Order*/
			if(jQuery('#progress-top5_OrderProduct').length){
				var options = {
					    series: [{
						    name: "Order",
					        data: [{
					            x: orders[0].product.name,
					            y: orders[0].quantity
					        }, {
					            x: orders[1].product.name,
					            y: orders[1].quantity
					        }, {
					            x: orders[2].product.name,
					            y: orders[2].quantity
					        }, {
					            x: orders[3].product.name,
					            y: orders[3].quantity
					        }, {
					            x: orders[4].product.name,
					            y: orders[4].quantity
					        }],
					    }],
					    chart: {
					        height: 350,
					        type: 'bar'
					    },
					    plotOptions: {
					        bar: {
					            columnWidth: '45%',
					            distributed: true,
					        }
					    },
					    dataLabels: {
					        enabled: false
					    },
					    legend: {
					        show: false
					    },
					    stroke: {
					        show: true,
					        width: 2,
					        colors: ['transparent']
					    },
					    xaxis: {
					        type: 'category',
					        labels: {
					            style: {
					                fontSize: '15px'
					            }
					        }
					    },
					    yaxis: {
					        title: {
					            text: 'Top Products',
					            style: {
					                fontSize:  '20px',
					                fontWeight:  'bold',
					                fontFamily:  undefined,
					                color:  '#263238'
					              },
					        }
					    },
					    tooltip: {
					        y: {
					        	formatter: function (val) {
					                return val + " |"
					            }
					        }
					    }
					};

					var chart = new ApexCharts(document.querySelector("#progress-top5_OrderProduct"), options);
					chart.render();
			}
		}
	})
	
});
</script> --%>
	</jsp:attribute>
</mt:layout_admin>