<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<mt:layout_user title="Profile">
	
	<jsp:attribute name="content">
	
<%-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> --%>
			<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
   
     <div class="col-md-3 border-right">
           <%--  <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="${pageContext.request.contextPath}/assets/uploads/${accountProfile.photo}" width="90"></div> --%>      
    <form method="post" action="${pageContext.request.contextPath }/user/profile/changeImage" enctype="multipart/form-data">
					               <div class="text-center" style="position: relative; display: inline-block;">
						                  <img class="profile-user-img img-fluid img-circle"   src="${pageContext.request.contextPath}/assets/uploads/${accountProfile.photo}" width="100"
						                       alt="User profile picture">
						                  <div class="gb_gb gb_cb">
						                  		<a class="gb_hb gb_Jf gb_cb gb_Of" aria-label="Thay đổi ảnh hồ sơ." href="#openfile" data-toggle="modal" id="${accountProfile.id }" onclick="openChangeAvt(id);">
						                  			<svg class="gb_ib" enable-background="new 0 0 24 24" focusable="false" height="26" viewBox="0 0 24 24" width="18">
						                  				<path d="M20 5h-3.17L15 3H9L7.17 5H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V7c0-1.1-.9-2-2-2zm0 14H4V7h16v12zM12 9c-2.21 0-4 1.79-4 4s1.79 4 4 4 4-1.79 4-4-1.79-4-4-4z"></path>
						                  			</svg>
						                  		</a>
						                  </div>
					               </div>
				               </form>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
            	<s:form action="${pageContext.request.contextPath }/user/profile/editProfile" modelAttribute="accountProfile" method="post">
				<div class="d-flex justify-content-between align-items-center mb-3">
                    <h6 class="text-right">Edit your profile</h6>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">First name</label><s:input type="text" class="form-control" placeholder="first name" path="firstName" /></div>
                    <div class="col-md-6"><label class="labels">Last name</label><s:input type="text" class="form-control" placeholder="last name" path="lastName" /></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Email</label><s:input type="text" class="form-control" placeholder="email" path="email"/></div>
                    <div class="col-md-12"><label class="labels">Address</label><s:input type="text" class="form-control" placeholder="address..." path="address"/></div>
                    <div class="col-md-12"><label class="labels">Phone</label><s:input type="text" class="form-control" placeholder="phone number" path="phone"/></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6"><label class="labels">Birthday</label><s:input type="text" class="form-control" id="birthday" placeholder="dd/MM/yyyy" path="dob" /></div>
                    
                </div>
               
                <div class="mt-5 text-center"><input class="btn btn-primary profile-button" type="submit" value="Save Profile"></div>
				</s:form>
           		<div class="mt-5 text-center"><button style="background-color: green;" class="btn btn-primary profile-button" data-target="#editPassword" data-toggle="collapse" type="button">Change Password</button></div>
           		<form method="post" action="${pageContext.request.contextPath}/user/profile/changepass" enctype="multipart/form-data">
           		<div class="form-group row collapse" id="editPassword">
           		<div class="row mt-3">
           			<div class="col-md-6"><label class="labels">Old Password</label><input type="password" class="form-control" name="oldPassword" id="oldPassword" placeholder="Enter old password"></div> 
                    <div class="col-md-6"><label class="labels">New Password</label><input type="password" class="form-control" name="newPassword" id="newPassword" onchange='check_pass();' placeholder="Must not be the same as the old password "></div>                
               		<div class="col-md-6"><label class="labels">Confirm</label><input type="password" class="form-control" name="confirmPassword" id="confirmPassword" onchange='check_pass();' placeholder="Confirm password "></div>                
                </div>
                <div class="mt-5 text-center"><input style="background-color: green;" class="btn btn-primary profile-button" name="submit"  value="Save"  id="submit" disabled type="submit"></div>
           		</div>
           		${msg1 }
 				</form>
            </div>
        </div>
    </div>
</div>

<div id="openfile" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
			<input name="avatar" type="hidden" value="noimg" />
				<div class="modal-header">
					<h4 class="modal-title">Change Image</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										
				</div>
				<div class="modal-body">
					<%-- <form method="post" action="${pageContext.request.contextPath }/user/profile/changeImage" enctype="multipart/form-data"> --%>
						<div class="form-group">
							<img src="" id="accAvatar" width="20%" height="20%" >
							<br>
							<input type="file" name="file" id="file" class="form-control" onchange="previewChangeAccountImage(this)"  accept="image/*"/>
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
							<input type="submit" class="btn btn-success" onclick="uploadFile()" value="Upload" />
						</div>
					<!-- </form> -->
				</div>
			</div>
		</div>
	</div> 
   	<script>
   	 function openChangeAvt(id) {
			$.ajax({
					type : 'GET',
					url : '${pageContext.request.contextPath }/user/ajax/findaccountbyid',
					data : {
						id : id
						},
					success : function(account) {
						$('#accAvatar').attr("src", "/assets/uploads/" + account.photo);
					}
				});
		}
	  

   	async function uploadFile() {
   	  let formData = new FormData(); 
   	  formData.append("file", file.files[0]);
   	  let response = await fetch('/user/ajax/upload', {
   	    method: "POST", 
   	    body: formData
   	  }); 

   	  if (response.status == 200) {
   		alert("Success !");
   	  }
   	}
	</script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#birthday" ).datepicker();
  } );
  function check_pass() {
	    if (document.getElementById('newPassword').value ==
            document.getElementById('confirmPassword').value) {	    	
        	document.getElementById('submit').disabled = false;	       
   		 } else {
       		document.getElementById('submit').disabled = true;
    		}
	 
	}
  </script>
	</jsp:attribute>
</mt:layout_user>