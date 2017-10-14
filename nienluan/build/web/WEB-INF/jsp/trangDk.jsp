<%-- 
    Document   : profile
    Created on : Aug 27, 2016, 3:16:17 PM
    Author     : Vo
--%>

<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang đăng ký thành viên</title>
        <script src="<c:url value="/resources/js/jquery-2.2.4.min.js"></c:url>"></script>
        <!--Them vao xac nhan-->
        <script src="<c:url value="/resources/js/jquery.validate.js"></c:url>"></script>
        <!--Them vao cokie jqury-->
        <script src="<c:url value="/resources/js/jquery.cookie.js"></c:url>"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
           
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
        <!--Them vao cac custom footer:-->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/css/demo.css"></c:url>">
               <link rel="stylesheet" href="<c:url value="/resources/css/footer-distributed-with-address-and-phones.css"></c:url>">
        <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
        
        <style>
            .p{
                display:inline;
            }
        </style>
    </head>
        <body onload="startTime()">
            <!--import tran gdieu huong vao:-->
        <jsp:include page="narbar.jsp"></jsp:include>
            <div class="container" style="width:100%">
          
           <br><br>
            
           
           <div class="row">
                    <hr>
                    
                    <div class="col-xs-8 pull-left">
                        
                    <div class="row" style="margin-top:8px;">  
                        <p style="margin-left:10px;" class="p"><a href="<%= request.getContextPath() %>">Trang chủ</a></p>
                    <p style="margin-left:10px;color:blue" class="p">></p>
                    <p style="margin-left:10px;" class="p"><a href="Dangky.html">trang đăng ký</a></p>
                    </div>
                        
                    </div>
                        <script>
                                                     var html="";
                                                     html+='<a id="giohang" href="#" class=" btn-success btn pull-right" data-toggle="modal"  data-target="#myModal" style="margin-top: 8px;" title="Giỏ hàng">+ <i>Giỏ hàng</i></a>';
                                                     $("#themdk").append(html);
                                                     
                                                     
                        </script>
                   
            </div>

                
           <div class="row" style="height:720px;">
               <hr> 
            <!--Màn hình đăng ký-->
            <br><br>
             <div class="row">
                       <h2 class="text-muted" id="h" style="text-align:center;color:green;display:none"><marquee behavior="alternate" width="5%">>></marquee>Đăng Ký Thành Viên<marquee behavior="alternate" width="5%"><< </marquee></h2>
                       <br>
                       <script>
                           $("#h").fadeIn(1500);
                          
                       </script>
             </div>
            <div class="thumbnail col-xs-6 col-xs-offset-3" id="sign" style="padding:80px;border-radius:0px;display:none">
                <!--Than Modal:-->
                
                           
                            <form action="goDK.html" role="form" action="" method="post" id="formDK">
                               
                                <div class="row">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-muted">Tên đăng nhập</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="Nhập tên người dùng" id="user" name="user"/>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-muted"> Mật khẩu</label>
                                        <div class="col-md-8">
                                            <input type="password" class="form-control" placeholder="Nhập mật khẩu" id="password" name="password"/>
                                        </div>
                                    </div>
                                </div>

                                <br>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-muted"> Nhập lại mật khẩu</label>
                                        <div class="col-md-8">
                                            <input type="password" class="form-control"  id="repassword" placeholder="Nhập lại mật khẩu" name="repassword"/>
                                        </div>
                                    </div>
                                </div>

                                <br>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-muted"> Tên khách hàng</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control"  id="name" placeholder="Tên khách hàng" name="name"/>
                                        </div>
                                    </div>
                                </div>

                                <br>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-muted"> Số điện thoại</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control"  id="phone" placeholder="Số điện thoại" name="phone"  maxlength="10"/>
                                        </div>
                                    </div>
                                </div>

                                <br>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-muted"> Địa chỉ</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" id="address" placeholder="Địa chỉ" name="address"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4"></div>
                                    <div class="col-md-8">
                                        <div class="radio">
                                            <label class="text-muted"> <input type="radio" value="nam" id="gt" name="gt"/>Nam</label>
                                            <label class="text-muted"> <input type="radio" value="nu" id="gt" name="gt"/>Nữ</label>
                                        </div> 
                                    </div>

                                </div>

                              

                                    <div class="row">
                                        <div class="col-md-4"></div>
                                        <div class="col-md-8" style="text-align:center">
                                            <br>
                                            <button type="submit" class="btn btn-info  pull-left" onclick="return confirm('Bạn chắc muốn đăng ký ?')"> <span class="glyphicon glyphicon-ok-sign"></span> Đăng ký</button>

                                        </div>

                                    </div>

                            </form>
                            
                     

                    </div>
                </div>
            </div>
                        <script>
                            $("#sign").fadeIn(1500);
                             //ham gui json qua:
                            $('#user').change(
                                    function(){
                                    $.ajax({
                                    type:"post",
                                    url:"goKTuser.html",
                                    data:{
                                        userid:$(this).val()
                                    },
                                    success: function (data) { 
                                        if(data==="1")
                                        {
                                        alert("Đã tồn tại Tài khoản người dùng!");
                                        $('#user').val('');
                                        }
                                    }
                                }); 

                                    });
                                    
                                    //Ham xac nhan Validate:
                                    $( document ).ready( function () {
			$("#formDK").validate( {
				rules: {
                                        name: "required",
                                        address: "required",
					user: {
						required: true,
						minlength:2
					},
                                        phone: {
						required: true,
						minlength:10
					},
					password: {
						required: true,
						minlength:6
					},
					repassword: {
						required: true,
						minlength:6,
						equalTo: "#password"
					},
					email: {
						required: true,
						email: true
					},
					gt: "required"
				},
				messages: {
                                        name:{
                                             required: "Bạn chưa nhập vào tên của bạn"
                                        },
                                        phone:{
                                             required: "Bạn chưa nhập vào số điện thoại",
				             minlength: "Số điện thoại không hợp lệ"
                                        },
                                        address:{
                                             required: "Bạn chưa nhập vào địa chỉ"
                                        },
					user: {
						required: "Bạn chưa nhập vào tên đăng nhập",
						minlength: "Tên đăng nhập phải có ít nhất 2 ký tự"
					},
					password: {
						required: "Bạn chưa nhập mật khẩu",
						minlength: "Mật khẩu phải có ít nhất 6 ký tự"
					},
					repassword: {
						required: "Bạn chưa nhập lại mật khẩu",
						minlength: "Mật khẩu phải có ít nhất 6 ký tự",
						equalTo: "Mật khẩu không trùng khớp với mật khẩu đã nhập"
					},
					email: "Hộp thư điện tử không hợp lệ",
					gt: "Bạn phải chọn giới tính"
				},
				errorElement: "em",
				errorPlacement: function ( error, element ) {
					// Add the `help-block` class to the error element
					error.addClass( "help-block" );

					if ( element.prop( "type" ) === "checkbox" ) {
						error.insertAfter( element.parent( "label" ) );
					} else {
						error.insertAfter( element );
					}
				},
				highlight: function ( element, errorClass, validClass ) {
					$( element ).parents( ".col-sm-5, .col-sm-6" ).addClass( "has-error" ).removeClass( "has-success" );
				},
				unhighlight: function (element, errorClass, validClass) {
					$( element ).parents( ".col-sm-5, .col-sm-6" ).addClass( "has-success" ).removeClass( "has-error" );
				}
			       } );
		            } );
                                    
                                    
                        </script>
            
            <div class="row">
                 <hr>
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
    </body>
</html>
