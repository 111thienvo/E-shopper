<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:layout_admin title="Add">
	<jsp:attribute name="content">
		 <div class="row">
               <div class="col-sm-12">
                  <div class="iq-card">
                     <div class="iq-card-header d-flex justify-content-between">
                        <div class="iq-header-title">
                           <h4 class="card-title">Add new Product</h4>
                        </div>
                     </div>
                     <div class="iq-card-body">
                        <s:form method="post" action="${pageContext.request.contextPath }/admin/manage_product/add" modelAttribute="product" enctype="multipart/form-data">
                           <div class="form-group">
                              <label for="title">Name:</label>
                              <input type="text" class="form-control"  name="name" required="required">
                           </div>
                            <div class="form-group">
                              <label for="title">SKU:</label>
                              <input type="number" class="form-control" min="1" maxlength="99999999" name="sku" required="required">
                           </div>
                            <div class="form-group">
                              <label for="title">Price:</label>
                              <input type="number" class="form-control"  min="1" name="price" required="required">
                           </div>
                            <div class="form-group">
                              <label for="title">Quantity:</label>
                              <input type="number" class="form-control"  min="1" max="1000" name="quantity" required="required">
                           </div>
                            
                           
                           <div class="form-group">
                              <label>Category:</label>
                              <select class="form-control"  name="category.id">
                              	 <c:forEach var="category" items="${categories }">
	                                 <option value="${category.id }">${category.name }</option>
                              	 </c:forEach>
                              </select>
                           </div>
                           <div class="form-group">
                              <label>Discount:</label>
                              <select class="form-control"  name="discount.id">
                              	 <c:forEach var="discount" items="${discounts }">
	                                 <option value="${discount.id }">${discount.name }</option>
                              	 </c:forEach>
                              </select>
                           </div>
                           <div class="form-group">
                              <label>Description:</label>
                              <textarea class="form-control" rows="4" name="description" required="required"></textarea>
                           </div>
                           <div class="form-group">
                              <label for="inputGenres" >Thumbnail:</label>
                              <input id="inputGenres" type="file" name="photo1" onchange="previewChangeAccountImage(this)" required="required">
                              <br>
                              <img src="" id="thumbnail" class="img-responsive rounded " width="300" height="300">
                           </div>
                           <button type="submit" class="btn btn-primary">Submit</button>
                           <button type="reset" class="btn btn-danger">Reset</button>
                        </s:form>
                     </div>
                  </div>
               </div>
            </div>
            
     <script>
	     function previewChangeAccountImage(e) {
	  	    const img = document.getElementById("thumbnail") || null
	  	    const file = e.files[0];
	  	    if (file) {
	  	        const reader = new FileReader();
	  	        reader.onload = function() {
	  	            const result = reader.result;
	  	            if (img) {
	  	                img.src = result
	  	            }
	  	        }
	
	  	        reader.readAsDataURL(file);
	  	    }
	  	 }
     </script>
	</jsp:attribute>
</mt:layout_admin>	
