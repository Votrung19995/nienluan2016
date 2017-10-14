<%-- 
    Document   : profile
    Created on : Aug 27, 2016, 3:16:17 PM
    Author     : Vo
--%>

<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang thông tin cá nhân</title>
        <script src="<c:url value="/resources/js/jquery-2.2.4.min.js"></c:url>"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
       
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
        <!--Them vao cac custom footer:-->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/css/demo.css"></c:url>">
        <link rel="stylesheet" href="<c:url value="/resources/css/footer-distributed-with-address-and-phones.css"></c:url>">
        <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
            <style type="text/css">
                .hu{
                    text-shadow: 0 1px 0 #ccc,
                        0 2px 0 #c9c9c9,
                        0 3px 0 #bbb,
                        0 4px 0 #b9b9b9,
                        0 5px 0 #aaa,
                        0 6px 1px rgba(0,0,0,.1),
                        0 0 5px rgba(0,0,0,.1),
                        0 1px 3px rgba(0,0,0,.3),
                        0 3px 5px rgba(0,0,0,.2),
                        0 5px 10px rgba(0,0,0,.25),
                        0 10px 10px rgba(0,0,0,.2),
                        0 20px 20px rgba(0,0,0,.15);  
                }
                .p{
                    display:inline;
                }
                
            .troi{
                position:fixed;
                z-index:620;
                }
            .sd{
                box-shadow: 0px 2px 2px 1px rgba(0, 0, 0, 0.1), 2px 0px 10px 2px rgba(0, 0, 0, 0.1);
            }
            
            @media (min-width: 969px) and (max-width: 1292px) {
                      .btn-responsive {
                        padding:2px 4px;
                        font-size:85%;
                        line-height:1.8;
                      }
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
                    
                    <div class="col-lg-8 pull-left">
                        
                    <div class="row" style="margin-top:8px;">  
                        <p style="margin-left:10px;" class="p"><a href="<%= request.getContextPath() %>">Trang chủ</a></p>
                    <p style="margin-left:10px;color:blue" class="p">></p>
                    <p style="margin-left:10px; " class="p"><a href="goProfile.html?tk=${kh.user}">trang cá nhân</a></p>
                    </div>
                        
                    </div>

                   <div class="col-lg-4">
                        <div class="row" style="margin-top:8px;">
                            <p style="margin-right:20px;" id="log" class="pull-right"><a href="goLogout.html" class="text-muted"><span class="glyphicon glyphicon-log-out text-muted"></span>   Đăng xuất</a></p>
                            <p style="margin-right:15px;margin-left:15px;" class="pull-right text-muted" id="g">|</p>
                            <p style="" id="user" class="pull-right text-muted"><a href="goProfile.html?tk=${kh.user}" class="text-muted"> <span  class="glyphicon glyphicon-user"></span> ${kh.name}</a> </p>
                        </div>
                    </div>
                        <script>
                            $('#log').hide();
                            $('#user').hide();
                            $('#g').hide();
                        </script>
                   
                </div>
                        
                <!--//Tao Anh ca nhan:-->
                <div class="row">
                    <hr>
                    <div class="row"><h1 class="hu" id="hienlen" style="text-align:center;color:#4cae4c;display:none">
                            <i class="fa fa-info-circle"></i>     Thông tin người dùng
                        </h1>
                    </div>
                    <br><br>
                    
                    <script>
                        $("#hienlen").fadeIn(1500);
                    </script>
                    <div class="row">
                        <div class="col-lg-3">
                           
                            <div id="anh" style="border-radius:0px;height:360px;width:320px;margin-left:20px;">
                                        
                                   </div>
                            
                            <input id="fi" name="fi" type="file" accept="image/*" onchange="loadFile(event)" style="margin-left:30px;">
                                   
                                   <form action="goProfile.html" method="get">
                     
                                   <input type="hidden" style="margin-left:30px;" id="tk" name="tk" value="${tv.user}">
                                   <input type="hidden" style="margin-left:30px;" id="gt" name="gt">
                                   <br>
                                   <button class="btn btn-info" type="submit" style="border-radius:0px;margin-left:30px;" onclick="saveImg()">Đổi ảnh</button>
                                   </form>
                                   <br>
                                   
                        </div>
                        
                        <script>
                            //Ham load file:
                            var loadFile = function(event) {
                            var reader = new FileReader();
                            reader.onload = function(){
                            var output = document.getElementById('out');
                            output.src = reader.result;
                            };
                            reader.readAsDataURL(event.target.files[0]);
                            var filename = $('#fi').val().replace(/.*(\/|\\)/, '');
                            $("#gt").val(filename);
                            };
                            //Ham save anh:
                            function saveImg(){
                               
                                if($("#gt").val()===""){
                                    alert("Bạn chọn ảnh mặc định.");
                                    window.location.reload();
       
                                }
                                else{
                                    alert("Bạn muốn thay đổi ảnh khác ?");
                                   
                                }
        
                            }
                        </script>
                        
                         <!--Thong tin cac truog du lieu-->
                         
                        <div class="col-lg-6">
                         
                        <div class="thumbnail sd" style="border-radius:0px;background-color: #FBFBEF;margin-left:10px;">
                            <h3 class="text-muted" style="text-align:center">Thông tin cá nhân</h3>

                            <div class="row">
                                <div class="col-sm-4">
                                    <b style="font-size:15px;color:blue"><i class="fa fa-user"> Tài khoản người dùng:</i></b>
                                </div>
                                <div class="col-sm-8"><i style="font-size:15px;margin-right:10px;" class="text-muted pull-right">${tv.user}</i></div>

                            </div>
                            <br>

                             <div class="row">
                                <div class="col-sm-5">
                                    <b style="font-size:15px;color:blue"><i class="fa fa-file-pdf-o"> Tên người dùng:</i></b>
                                </div>
                                <div class="col-sm-7"><i style="font-size:15px;margin-right:10px;" class="text-muted pull-right">${tv.name}</i></div>

                            </div>
                            <br>

                            <div class="row">
                                <div class="col-sm-5">
                                    <b style="font-size:15px;color:blue"><i class="fa fa-phone"> Số điện thoại:</i></b>
                                </div>
                                <div class="col-sm-7"><i style="font-size:15px;margin-right:10px;" class="text-muted pull-right">${tv.phone}</i></div>

                            </div>
                            <br>

                             <div class="row">
                                <div class="col-sm-5">
                                    <b style="font-size:15px;color:blue"><i class="fa fa-map-marker"> Địa chỉ:</i></b>
                                </div>
                                <div class="col-sm-7"><i style="font-size:15px;margin-right:10px;" class="text-muted pull-right">${tv.address}</i></div>

                            </div>
                            <br>

                            <div class="row">
                                <div class="col-sm-5">
                                    <b style="font-size:15px;color:blue"><i class="fa fa-intersex"> Giới tính:</i></b>
                                </div>
                                <div class="col-sm-7"><i style="font-size:15px;margin-right:10px;" class="text-muted pull-right">${tv.gioitinh}</i></div>

                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-5">
                                    <b style="font-size:15px;color:blue"><i class="fa fa-briefcase"> Quyền hạn người dùng:</i></b>
                                </div>
                                <div class="col-sm-7"><i style="font-size:15px;margin-right:10px;" class="text-muted pull-right" id="law"></i></div>

                            </div>
                            <br>

                            <div class="row">
                                <div class="col-sm-5">
                                    <b style="font-size:15px;color:blue"><i class="fa fa-file-text"> Ghi chú các nhân:</i></b>
                                </div>
                                <div class="col-sm-7"><i style="font-size:15px;margin-right:10px;" class="text-muted pull-right" id="note"></i></div>

                            </div>
                           <br>
                           <div class="row">
                                <div class="col-sm-6">
                                    <div id="add"></div>
                                    <div id="tnhan"></div> 
                                </div>
                               <div class="col-sm-6">
                                  
                               </div>
                            </div>
                            <br>
                            
                        </div>
                                
                                
                        </div>
                        <!--Them vao khung cap nhat nguoi dung-->
                        <div class="col-lg-3">
                            <div class="panel panel-info sd" style="border-radius:0px;">
                                <div class="panel-heading">
                                    <h4 class="text-muted">Bảng cập nhật</h4>
                                </div>
                                
                                <div class="panel-body" style="border-radius:0px;height:345px;width:300px;border-color:orangered">
                                    <form class="form-horizontal" action="goUpdateKh.html?tk=${tv.user}" method="post">
                                        <input class="thumbnail" style="border-radius:0px;width:280px;" id="name" name="name" placeholder="nhập tên">
                                        <input class="thumbnail" style="border-radius:0px;width:280px;" name="phone" id="phone" placeholder="số điện thoại">
                                        <input class="thumbnail" style="border-radius:0px;width:280px;" name="address" id="address" placeholder="địa chỉ">
                                        <textarea class="thumbnail" style="border-radius:0px;width:280px;height:100px;" name="note" id="note" placeholder="ghi chú (nếu có)"></textarea>
                                        <button class="btn btn-warning btn-block" type="submit" style="border-radius:0px;width:280px;" onclick="xn();">Cập nhật lại thông tin</button>
                                    </form>

                                </div>
                                
                            </div>
                        </div>

                    </div>
                                          
                </div>
                <!--them vao noi dung quan ly-->


                <!--Xu ly dang nhap:-->

            <%
                //Lay ten ang nhap nguoi dung.
                String lv = (String) session.getAttribute("ten");
                List<Cart> carts=new ArrayList<Cart>();
                carts=(List<Cart>)session.getAttribute("carts");
                if (lv != null) {
                     if(!"admin".equals(lv)){
                                                 if(carts!=null){
                                                  %>
                                                  <script>
                                                     var html="";
                                                     html='<a id="giohang" href="goCart.html?id=${kh.user}" class="btn btn-success pull-right" style="height:38px;width:105px;margin-top:5px;margin-right:5px;padding-top:10px;" title="Giỏ hàng"><i>Giỏ hàng</i> <span class="badge"><%= carts.size() %></span></a>';
                                                     $("#tgh").append(html);
                                                  </script>
                                                  <%
                                                   }
                                                    else{
                                                        %>
                                                        <script>
                                                           var html="";
                                                           html='<a id="giohang" href="goCart.html?id=${kh.user}" class="btn btn-success pull-right" style="height:38px;width:105px;margin-top:5px;margin-right:5px;padding-top:10px;" title="Giỏ hàng"><i>Giỏ hàng</i> <span class="badge">0</span></a>';
                                                           $("#tgh").append(html);
                                                        </script>
                                                        <%
                                                    }
                                }
            %>
            <script>
                 //Ham su dung lay du lieu ve:
                var a="${tv.user}";
                var gt="${tv.gioitinh}";
                if(a==="admin"){
                   $("#giohang").hide();
                   $("#law").text('Toàn quyền quản trị website');
                   $("#add").html('<a href="goQuanly.html" style="border-radius:0px;border-color:green" class="btn btn-default btn-responsive"><i class="fa fa-pencil-square-o"> Vào trang quản lý</i></a>');
                   
                }
                else{
                    $("#law").text('Người dùng, mua hàng.');
                    
                    $("#add").html('<a href="goPurchaseHistory.html?tk=${tv.user}"style="border-radius:0px;border-color:green" class="pull-left btn btn-default btn-responsive"><i class="fa fa-book"> Lịch sử mua hàng</i></a>');
                    $("#tnhan").html('<a href="goMessage.html?user=${tv.user}" style="border-radius:0px;border-color:green;margin-left:4px;" class="pull-left btn btn-default btn-responsive"><i class="glyphicon glyphicon-envelope" style="color:orange;"> Tin nhắn</i> <span class="badge">${sotn}</span></a>');
                }
             //Ham them ghi chu ban than:
             if("${tv.note}"==="" || "${tv.note}"===null){
                  $("#note").text('Không có ghi chú');
             }
             else{
                var note="${tv.note}";
                $("#note").text(note);
             }
             
             //Kiem tra gia tri:  
             if("${tv.path}"=== "" || "${tv.path}"=== null)
             {
                //set anh cho tieu de:
                if(gt=== "nam" || gt==="Nam"){
                    
                    $("#anh").html('<img class="sd" id="out" class="img-responsive img-rounded thumbnail " style="border-radius:0px;height:350px;width:310px;" src="<c:url value="/img/usermen.png"></c:url>">');
                }
                else{
                     $("#anh").html('<img class="sd" id="out" class="img-responsive img-rounded thumbnail " style="border-radius:0px;height:350px;width:310px;" src="<c:url value="/img/usernu.png"></c:url>">');
                }
                
             }
             else{
                   
                    $("#anh").html('<img class="sd" id="out" class="img-responsive img-rounded thumbnail " style="border-radius:0px;height:350px;width:310px;" src="<c:url value="user/${tv.path}"></c:url>">');
              }
               
                $('#dn').hide();
                $('#dk').hide();
                $('#dn').fadeOut();
                $('#dk').fadeOut();
                $('#log').show();
                $('#user').show();
                $('#g').show();
                $('#tc').html('<a class="pull-left" href="<%= request.getContextPath() %>"><b>Trang chủ<b style="color:black;margin-left:5px;" >></b><b></a>');
                $('#ql').html('<a class="pull-left" href="goProfile.html?tk=${tv.user}"><b style="margin-right:20px;">user profile</b></a>');
                $('#thoat').html('<a id="dangxuat" class="pull-right btn"><span class="glyphicon glyphicon-log-out"> Đăng xuất</span></a>');
                $('#u').html('<a href="goProfile.html?tk=${tv.user}" id="tk" class="pull-left" style="margin-left:220px;margin-top:6px;color:red;"> <b name="tv"> ${tv.name}></b> <p style="color:black;margin-left:10px;" class="pull-right">||</p></a>');
                $('#thoat').html('<a id="dangxuat" class="pull-right btn"><span class="glyphicon glyphicon-log-out"> Đăng xuất</span></a>');
                //ham xu ly khi click vao dang xuat:

                $('#dangxuat').click(function (event) {

                    window.location.href = "goLogout.html";

                });
                
            </script>
            <% }


            %>
            <div class="row">
                <hr>
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
    </body>
</html>
