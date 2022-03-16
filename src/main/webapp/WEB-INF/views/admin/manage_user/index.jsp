<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:layout_admin title="Manage-User">
	<jsp:attribute name="content">
			<div class="row row--grid"> 
				<div class="col-12">
					<div class="Playlist">
						<!-- tabs nav -->
						<ul class="nav nav-tabs profile__tabs" id="profile__tabs"
						role="tablist">
							<li class="nav-item">
								<a class="nav-link active" data-toggle="tab" href="#artist-tab"
							role="tab" aria-controls="artist-tab" aria-selected="true">User</a>
							</li>

							<!-- <li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#user-tab"
							role="tab" aria-controls="user-tab" aria-selected="true">User</a>
							</li> -->

						</ul>
						<!-- end tabs nav -->					
					</div>
				</div>
			
			</div> 
		<div class="tab-content">
		<div class="tab-pane fade show active" id="artist-tab" role="tabpanel">
		    <div class="row row--grid">
               <div class="col-12">
                  <div class="iq-card">
                     <div
								class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                           <h4 class="card-title">Lists</h4>
                        </div>
                        <div
									class="iq-card-header-toolbar d-flex align-items-center">

                        </div>
                        
                     </div>
                     <div class="iq-card-body">
                        <div class="table-responsive">
                           <table
										class="data-tables table table-striped table-bordered"
										style="width: 50%">
                              <thead>
                                 <tr>
                                    <th style="width: 5%;">No.</th>
                                    <th style="width: 5%;">Profile</th>
                                    <th style="width: 15%;">Full Name</th>
                                    <th style="width: 12%;">Email</th>
                                    <th style="width: 8%">Birthday</th>
                                    <th style="width: 15%;">Address</th>
                                    <th style="width: 10%;">Phone</th>
                                    <th style="width: 5%;">Create Date</th>
                                    <th style="width: 5%;">Update Date</th>
                                 </tr>
                              </thead>
                              <tbody>
                              	<c:forEach var="user"
												items="${users }" varStatus="i">
                                 <tr>
                                    <td>${i.index + 1 } </td>
                                    <td>
                                       <img
														src="${pageContext.request.contextPath }/assets/uploads/${user.photo}"
														class="img-fluid avatar-50 rounded" alt="author-profile">
                                    </td>
                                    <td>${user.firstName } ${user.lastName}</td>
                                    <td>${user.email }</td>
                                    <td>${user.dob }</td>
                                    <td>${user.address }</td>
                                    <td>
                                       <p class="mb-0">${user.phone }</p>
                                    </td>
                                     <td><fmt:formatDate value="${user.createdAt }" type="date" pattern="dd/MM/yyyy"/></td>
			                         <td><fmt:formatDate value="${user.modifiedAt }" type="date" pattern="dd/MM/yyyy"/></td>
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
		<div class="tab-pane fade" id="user-tab" role="tabpanel">
		    <div class="row row--grid">
       
               
            </div>
        </div>
		</div>
		
		
		<script>
		$(document).ready(function(){
			$('.toggle-artist-active').each(function(index){
			    $(this).on("click", function(){
			        var id = $(this).data("id")
			        var self = $(this);
				    $.ajax({
				    	type: 'GET',
				        data: {
				            id: id
				        },
				        url: '${pageContext.request.contextPath}/admin/artist/edit-status',
				        success: function (status) {
				                if (status == true) {
				                	self.text('Active');
				                	self.addClass('iq-bg-info')
				                	self.removeClass('iq-bg-danger')
				                } else{
				                	self.text('Block') 
				                	self.addClass('iq-bg-danger')
				                	self.removeClass('iq-bg-info')
				                }
				            }
	        		});
	    		});
			});
		}) ;
		</script>
	</jsp:attribute>
</mt:layout_admin>