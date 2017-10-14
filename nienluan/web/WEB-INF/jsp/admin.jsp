<%-- 
    Document   : welcome
    Created on : Aug 17, 2016, 9:39:20 PM
    Author     : Vo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang quản lý bán hàng</title>
        <script src="<c:url value="/resources/js/jquery-2.2.4.min.js"></c:url>"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
        
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
         <!--Them vao cac custom footer:-->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/css/demo.css"></c:url>">
        <link rel="stylesheet" href="<c:url value="/resources/css/footer-distributed-with-address-and-phones.css"></c:url>">
        
        <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
        <!--Them hieu ung khi click vao hinh anh:-->
        <style>
            .p{
                display:inline;
            }
        </style>
    </head>
    <body>
        <!--import tran gdieu huong vao:-->
       <jsp:include page="narbar.jsp"></jsp:include>
       
       <div class="container" style="width:100%">
        <br><br>
       
        
        <div class="row">
                    <hr>
                    
                    <div class="col-xs-8 pull-left">
                        
                    <div class="row" style="margin-top:8px;">  
                        <p style="margin-left:10px;" class="pull-left p"><a href="<%= request.getContextPath() %>">Trang chủ</a></p>
                        <p  style="margin-left:10px;color:blue" class="pull-left p">></p>
                        <p style="margin-left:10px;" class="pull-left p"><a href="goQuanly.html?tk=${tk.user}">quản lý</a></p>
                    </div>
                        
                    </div>

                    <div class="col-xs-4">
                        <div class="row" style="margin-top:8px;">
                            <p style="margin-right:20px;" class="pull-right" id="log"><a href="goLogout.html" class="text-muted"><span class="glyphicon glyphicon-log-out text-muted"></span>   Đăng xuất</a></p>
                            <p style="margin-right:15px;margin-left:15px;" class="pull-right text-muted" id="g">|</p>
                            <p style="" id="user" class="pull-right text-muted"><a href="goProfile.html?tk=${tk.user}" class="text-muted"> <span  class="glyphicon glyphicon-user"></span> ${tk.name}</a> </p>
                        </div>
                    </div>
                        <script>
                            $('#log').hide();
                            $('#user').hide();
                            $('#g').hide();
                        </script>
       </div>
      
        
        <div class="row">
            <hr>
            <div class="col-xs-2"></div>
            <div class="col-xs-3" style="text-align:center">
                <a href="goFeeback.html?tk=${tk.user}"><img class="img-thumbnail img-responsive" src="<c:url value="/img/feeback.jpg"></c:url>" title="Thêm,cập nhật hay xóa nhân viên bán hàng" style="height:240px;">
                <i class="fa fa-comment-o fa-4x" aria-hidden="true"></i><b> Ý Kiến - Phản Hồi</b>
            </a>
            </div>
            <div class="col-xs-2"></div>
            <div class="col-xs-3" style="text-align:center">
                <a href="goQlhh.html"><img class="img-thumbnail img-responsive" src="<c:url value="/img/qldt.jpg"></c:url>" title="Thêm các mặt hàng điện thoại" style="height:240px;">
            <i class="fa fa-laptop fa-4x" aria-hidden="true"></i><b> Quản lý hàng hóa</b>
            </a>
                 
            </div>
            <div class="col-xs-2"></div>
            
        </div>
            
        <div class="row">
            <br><br><br><br>  
        </div>
            
        <div class="row">
            <div class="col-xs-2"></div>
            <div class="col-xs-3" style="text-align:center">
                <a href="goSafeOff.html"><img class="img-thumbnail img-responsive" src="<c:url value="/img/sale.jpg"></c:url>" title="Đăng tin tức về khuyến mãi-giảm giá" style="height:240px;">
             <i class="fa fa-share-alt fa-3x" aria-hidden="true"></i><b> Quản tin tức-giảm giá</b>
            </a>
            </div>
            <div class="col-xs-2"></div>
            <div class="col-xs-3" style="text-align: center">
                <a href="gopurchaseManager.html?tk=${tk.user}"><img class="img-thumbnail img-responsive" src="<c:url value="/img/cost.jpg"></c:url>" title="Quản lý   hóa đơn của Khách hàng" style="height:240px;">
                <i class="fa fa-list fa-3x" aria-hidden="true"></i><b> Quản lý hóa đơn</b>
            </a>
            </div>
            <div class="col-xs-2"></div>
        </div>
        <!--them vao noi dung quan ly-->
        
            
            <!--Xu ly dang nhap:-->
            
             <%
                                          //Lay ten ang nhap nguoi dung.
                                           String lv=(String)session.getAttribute("ten");
                                           if(lv!=null){
                                           %>
                                           <script>
                                                
                                                $('#dn').hide();
                                                $('#giohang').hide();
                                                $('#dk').hide();
                                                $('#user').show();
                                                $('#log').show();
                                                $('#g').show();
                                                $('#tc').html('<a class="pull-left" href="<%= request.getContextPath() %>"><b>Trang chủ<b style="color:black;margin-left:5px;" >></b><b></a>');
                                                $('#ql').html('<a class="pull-left" href="goQuanly.html"><b style="margin-right:20px;">quản lý</b></a>');
                                                $('#thoat').html('<a id="dangxuat" class="pull-right btn"><span class="glyphicon glyphicon-log-out"> Đăng xuất</span></a>');
                                                $('#u').html('<a href="goProfile.html?tk=<%= lv %>" id="tk" class="pull-left" style="margin-left:220px;margin-top:6px;color:red;"> <b name="tv"> <%= lv %></b> <p style="color:black;margin-left:10px;" class="pull-right">||</p></a>');
                                                $('#thoat').html('<a id="dangxuat" class="pull-right btn"><span class="glyphicon glyphicon-log-out"> Đăng xuất</span></a>');
                                                //ham xu ly khi click vao dang xuat:
                                                
                                                $( '#dangxuat' ).click(function( event ) {
                                                   
                                                            window.location.href="goLogout.html";
                            
                                                 });
                              
                                           </script>
                                           <% }
                                           
                                        
                   %>
        <div class="row">
        <jsp:include page="footer.jsp"></jsp:include>
        </div>
        </div>
        
    </body>
</html>
