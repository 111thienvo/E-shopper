<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:layout_admin title="Manage-Product">
	<jsp:attribute name="content">

            <div class="row row--grid">
				<div class="col-12">
					<div class="Playlist">
						<!-- tabs nav -->
						<ul class="nav nav-tabs profile__tabs" id="profile__tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#playlist-tab" role="tab" aria-controls="playlist-tab" aria-selected="true">Playlists</a>
							</li>

							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#album-tab" role="tab" aria-controls="album-tab" aria-selected="false">Albums</a>
							</li>

						</ul>
						<!-- end tabs nav -->					
					</div>

					<!-- content tabs -->
					<div class="tab-content">
						<!-- Playlist Tab -->
						<div class="tab-pane fade show active" id="playlist-tab" role="tabpanel">
							<div class="row row--grid">
								<div class="col-12">
									<div class="iq-card">
                     					<div class="iq-card-header d-flex justify-content-between">
                        					<div class="iq-header-title">
                           						<h4 class="card-title">List Product</h4>
                        					</div>
                        					<div class="iq-card-header-toolbar d-flex align-items-center">
					                           <a href="${pageContext.request.contextPath }/admin/manage_product/add" class="btn btn-primary">Add New Product</a>
					                        </div>
                     				 	</div>
				                     <div class="iq-card-body">
				                        <div class="table-responsive">
				                           <table class="data-tables table table-striped table-bordered" style="width:50%">
				                              <thead>
				                                 <tr>
				                                   <th style="width: 5%;">No.</th>
												   <th style="width: 5%;">Photo</th>
												   <th style="width: 10%;">Name</th>
												   <th style="width: 5%;">SKU</th>
												   <th style="width: 5%">Description</th>
												   <th style="width: 5%;">Quantity</th>
												   <th style="width: 5%;">Price</th>
												   <th style="width: 5%;">Category</th>
												   <th style="width: 5%;">Discount</th>
												   <th style="width: 5%;">Create Date</th>
												   <th style="width: 5%;">Update Date</th>
												   <th style="width: 5%;">Action</th>
				                                 </tr>
				                              </thead>
				                              <tbody id="playlists-body">
				                              	 <c:forEach var="product" items="${products }" varStatus="i">
					                                 <tr  style="height: 180px;">
					                                    <td class="text-center">${i.index + 1 }</td>
					                                    <td>
					                                       <img src="${pageContext.request.contextPath }/assets/uploads/${product.photo }" class="img-responsive avatar-150 rounded" alt="" width="200" height="200">
					                                    </td>
					                                    <td>${product.name }</td> 
					                                    <td>${product.sku }</td>
					                                    <td class="text-center">${product.description }</td>
					                                    <td class="text-center"> ${product.quantity } </td>
					                                    <td class="text-center"> ${product.price } </td>
					                                    <td class="text-center"> ${product.category.name } </td>
					                                    <td class="text-center"> ${product.discount.name } </td>
					                                    <td class="text-center"><fmt:formatDate value="${product.createdAt }" type="date" pattern="dd/MM/yyyy"/></td>
					                                     <td class="text-center"><fmt:formatDate value="${product.modifiedAt }" type="date" pattern="dd/MM/yyyy"/></td>
					                                    <td>
					                                       <div class="flex align-items-center text-center list-user-action">
					                                          <a class="bg-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" 
					                                          	 href="${pageContext.request.contextPath }/admin/manage_product/edit?id=${product.id }">
					                                          	 <i class="ri-pencil-line"></i>
					                                          </a>
					                                          <a class="bg-primary delete-btn" type="button" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete" 
					                                          	 data-id="${product.id}">
					                                          	 <i class="ri-delete-bin-line"></i>
					                                          </a>
					                                          
					                                       </div>
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
						</div>
						<!-- end Playlist Tab -->
				
						
					</div>
					<!-- end content tabs -->
				</div>
			</div>	


			
<script>
	$(document).ready(function(){
		$('.toggle-playlist-status').each(function (index) {
		    $(this).on("click", function () {
		        var id = $(this).data("id")
		        var self = $(this);
		        $.ajax({
		            type: 'GET',
		            data: {
		                id: id
		            },
		            url: '${pageContext.request.contextPath}/admin/playlist/edit-status',
		            success: function (status) {
		                if (status == 1) {
		                    self.text('Public');
		                    self.addClass('iq-bg-info')
		                    self.removeClass('iq-bg-danger')
		                } else if (status == 3) {
		                    self.text('Hidden')
		                    self.addClass('iq-bg-danger')
		                    self.removeClass('iq-bg-info')
		                }

		            }
		        });
		    });
		});

		$('.toggle-album-status').each(function (index) {
		    $(this).on("click", function () {
		        var id = $(this).data("id")
		        var self = $(this);
		        $.ajax({
		            type: 'GET',
		            data: {
		                id: id
		            },
		            url: '${pageContext.request.contextPath}/admin/playlist/edit-status',
		            success: function (status) {
		                if (status == 1) {
		                    self.text('Public');
		                    self.addClass('iq-bg-info')
		                    self.removeClass('iq-bg-danger')
		                } else if (status == 3) {
		                    self.text('Hidden')
		                    self.addClass('iq-bg-danger')
		                    self.removeClass('iq-bg-info')
		                }

		            }
		        });
		    });
		});

		$('.toggle-view-tracks').click(function () {
		    var id = $(this).data("id");
		    $.ajax({
		        type: 'GET',
		        data: {
		            id: id
		        },
		        url: '${pageContext.request.contextPath}/admin/playlist/view-tracks',
		        success: function (tracks) {
		            var result = "";
		            if (tracks.length <= 0) {
		                result += "<h4>There are no songs in this playlist yet</h4>";
		            }
		            for (var i = 0; i < tracks.length; i++) {
		                result += "<div class='d-flex justify-content-between align-items-center p-3'>";
		                result += "<div class='d-flex flex-row align-items-center'> <i class='fa fa-music color'></i> <small class='ml-2' style='font-size: larger;'>" + tracks[i].title + "</small> </div>";
		                result += "<div class='d-flex flex-row'>";
		                if (tracks[i].statusId == 1) {
		                    result += "<i class='fa fa-check color mr-15'></i>";
		                } else if (tracks[i].statusId == 2) {
		                    result += "<i class='ri-upload-2-fill mr-15'></i>";
		                } else if (tracks[i].statusId == 3) {
		                    result += "<i class='fas fa-times mr-15'></i>";
		                }
		                result += "<button class='delete-action center-item'><i class='ri-delete-bin-line' onclick='delete_track(this)' data-id='" + tracks[i].id + "'></i></button>"
		                result += "</div>";
		                result += "</div>";
		            }
		            $('.track-card').html(result);
		        }
		    });
		});
	})
	
	function delete_track(e) {
	    var id = $(e).data("id");
	    Swal.fire({
	        icon: 'warning',
	        title: 'Are you sure?',
	        text: "You won't be able to revert this!",
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: 'Yes, delete it!'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            $.ajax({
	                type: 'GET',
	                data: {
	                    id: id
	                },
	                url: '${pageContext.request.contextPath}/admin/playlist/delete-track',
	                success: function (tracks) {
	                    if (tracks.length <= 0) {
	                        result += "<h4>There are no songs in this playlist yet</h4>";
	                    }
	                    Swal.fire({
	                        icon: 'success',
	                        title: 'Deleted!',
	                        text: 'Your data/change have been saved',
	                        showConfirmButton: false,
	                        timer: 1500
	                    });
	                    var result = "";
	                    for (var i = 0; i < tracks.length; i++) {
	                        result += "<div class='d-flex justify-content-between align-items-center p-3'>";
	                        result += "<div class='d-flex flex-row align-items-center'> <i class='fa fa-music color'></i> <small class='ml-2' style='font-size: larger;'>" + tracks[i].title + "</small> </div>";
	                        result += "<div class='d-flex flex-row'>";
	                        if (tracks[i].statusId == 1) {
	                            result += "<i class='fa fa-check color mr-15'></i>";
	                        } else if (tracks[i].statusId == 2) {
	                            result += "<i class='ri-upload-2-fill mr-15'></i>";
	                        } else if (tracks[i].statusId == 3) {
	                            result += "<i class='fas fa-times mr-15'></i>";
	                        }
	                        result += "<button class='delete-action center-item'><i class='ri-delete-bin-line' onclick='delete_track(this)' data-id='" + tracks[i].id + "'></i></button>"
	                        result += "</div>";
	                        result += "</div>";
	                    }
	                    $('.track-card').html(result);
	                }
	            });
	        }
	    })
	}
</script>
<script type="module" defer>	
	import modal, { swalAlert, redirectAlert, singleAlert, confirmAlert, redirectAlertURLCustom } from '${pageContext.request.contextPath }/resources/user/js/notification.js';
	$('.delete-btn').each(function (index) {
    	$(this).click(function () {
        	var id = $(this).data("id");
        	confirmAlert(
        	    function () {
        	        console.log("id: " + id);
         	       $.ajax({
         	           type: 'GET',
          	           data: {
             	           id: id
                    	},
                    	url: '${pageContext.request.contextPath }/admin/manage_product/delete',
                    	success: function (response) {
                        	if (response) {
                            	swalAlert(modal.MODAL_CONTENT.delete_success);
                            	var url = '${pageContext.request.contextPath }/admin/manage_product';
                            	window.location.replace(url);
                        	}
                        	if (!response) { 
								swalAlert(modal.MODAL_CONTENT.delete_error) 
							}
                    	}
                	})

            	}, modal.MODAL_CONTENT.confirm_delete_dialog)
    	})
	})
</script>
	</jsp:attribute>
</mt:layout_admin>
