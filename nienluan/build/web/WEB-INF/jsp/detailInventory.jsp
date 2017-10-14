<%-- 
    Document   : profile
    Created on : Aug 27, 2016, 3:16:17 PM
    Author     : Vo
--%>

<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chi tiết mặt hàng</title>
        <script src="<c:url value="/resources/js/jquery-2.2.4.min.js"></c:url>"></script>
        <!--Them vao cokie jqury-->
        <script src="<c:url value="/resources/js/jquery.cookie.js"></c:url>"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>"> 
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
        <!--Them vao cac custom footer:-->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/css/demo.css"></c:url>">
        <link rel="stylesheet" href="<c:url value="/resources/css/footer-distributed-with-address-and-phones.css"></c:url>">
        <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
        
        <!--Then vao zoom anh-->
        <link rel="stylesheet" href="<c:url value="/resources/css/etalage.css"></c:url>">
        <script src="<c:url value="/resources/js/jquery.etalage.min.js"></c:url>"></script>
        
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
                        <p style="margin-left:10px;" class="pull-left"><a href="<%= request.getContextPath() %>">Trang chủ</a></p>
                        <p style="margin-left:10px;color:blue" class="pull-left">></p>
                        <p style="margin-left:10px;" id="ql" class="pull-left"></p>
                        <p style="margin-left:10px;color:blue" class="pull-left">></p>
                        <p style="margin-left:10px;color:green" id="sp" class="pull-left"></p>
                        
                    </div>
                        
                    </div>

                    <div class="col-xs-4">
                        <div class="row" style="margin-top:8px;">
                            <p style="margin-right:20px;" id="log" class="pull-right"><a href="goLogout.html?de=de&id=${invt.inventoryId}&name=${invt.name}" class="text-muted"><span class="glyphicon glyphicon-log-out text-muted"></span>   Đăng xuất</a></p>
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
                        
                <!--Xu ly dang nhap:-->

            <%
                //Lay ten ang nhap nguoi dung.
                String dt="";
                String sp=(String)request.getParameter("name");
                String st=(String)request.getAttribute("id");
                if(st!=null){
                Pattern patternN = Pattern.compile("^[NL[0-9]]{0,}");
                Pattern patternO = Pattern.compile("^[ONMR[0-9]]{0,}");
                Pattern patternH = Pattern.compile("^[HTEG[0-9]]{0,}");
                Pattern patternI = Pattern.compile("^[IP[0-9]]{0,}");
                Pattern patternS = Pattern.compile("^[SAaE[0-9]]{0,}");
                Matcher matcherN=patternN.matcher(st);
                Matcher matcherO=patternO.matcher(st);
                Matcher matcherH=patternH.matcher(st);
                Matcher matcherI=patternI.matcher(st);
                Matcher matcherS=patternS.matcher(st);
                if(matcherN.matches()){
                    dt="Nokia";
                }
                if(matcherO.matches()){
                    dt="Oppo";
                }
                if(matcherI.matches()){
                    dt="Apple";
                }
                if(matcherS.matches()){
                    dt="Samsung";
                }
                if(matcherH.matches()){
                    dt="HTC";
                }
                %>
                <script>
                    $('#ql').html('<a  href="trangchu.html?st=0&en=12&sx=desc&sp=<%= dt %>"><%= dt %></a>');
                    $('#sp').html('<i style="color:green"><%= sp %></i>');
                </script>
                <%
                    
                }
                String lv = (String) session.getAttribute("ten");
                List<Cart> carts=new ArrayList<Cart>();
                carts=(List<Cart>)session.getAttribute("carts");
                //Lay ve bieu thuc chinh quy:
               
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
                
                
                $('#log').show();
                $('#user').show();
                $('#g').show();
                
                $('#thoat').html('<a id="dangxuat" class="pull-right btn"><span class="glyphicon glyphicon-log-out"> Đăng xuất</span></a>');
                $('#u').html('<a href="goProfile.html?tk=<%= lv %>" id="tk" class="pull-left" style="margin-left:220px;margin-top:6px;color:red;"> <b name="tv"> <%= lv %></b> <p style="color:black;margin-left:10px;" class="pull-right">||</p></a>');
                $('#thoat').html('<a id="dangxuat" class="pull-right btn"><span class="glyphicon glyphicon-log-out"> Đăng xuất</span></a>');
                //ham xu ly khi click vao dang xuat:

                $('#dangxuat').click(function (event) {

                    window.location.href = "goLogout.html";

                });
                
                
                
            </script>
            <% }
             
            else{
                                                  %>
                                                  <script>
                                                      
                                                        var html="";
                                                        var html1="";
                                                        var html2="";
                                                        html='<a href="Dangky.html" id="dk" class="gly1"title="Đăng ký thành viên"><span class="glyphicon glyphicon-user" > Đăng ký</span></a>';
                                                        html1='<a href="#" id="dn" class="gly1" data-toggle="modal" title="Đăng nhập vào hệ thống"  data-target="#myModal" ><span class="glyphicon glyphicon-log-in"> Đăng nhập</span></a> ';
                                                        html2='<a id="giohang" href="goCart.html?id=${kh.user}" class="btn btn-success" style="height:38px;width:105px;margin-top:5px;margin-right:5px;padding-top:10px;" title="Giỏ hàng"><i>Giỏ hàng</i> <span class="badge">0</span></a>';
                                                        $('#tgh').append(html2);
                                                        $('#tdk').append(html);
                                                        $('#tdn').append(html1);
//                                                        $( '#giohang' ).click(function( event ) {
//                                                   
//                                                           alert("Bạn chưa đăng nhập.");
//                            
//                                                       });
                                                       
                                                        
                                                        
                                                  </script>
                                                  <%
                                              }
                                           

            %>
            
            <%
                
            %>
            <div class="row">
                  <!--Them vao hop thoai dang nhap:-->
            <div class="modal fade" id="myModal" role="dialog">
                <!--Than Modal:-->
                <div class="modal-dialog">
                    <!--Modal content:-->
                    <div class="modal-content">

                        <div class="modal-header" style="padding:20px 30px; text-align: center;background-color:#33F9FF">
                            <button type="button" class="close"  data-dismiss="modal" >&times;</button>
                            <h3><span class="glyphicon glyphicon-lock"></span> Đăng Nhập</h3>
                        </div>
                        <div class="modal-body" style="padding:20px 30px;">
                            <form action="goDN.html" role="form" method="post" id="myForm" >

                                <div class="form-group">

                                    <label><span class="glyphicon glyphicon-user"></span> Người dùng</label>
                                    <input type="text" class="form-control" placeholder="Nhập tên người dùng" id="username" name="username" required/>
                                </div>
                                <div class="form-group">
                                    <label><span class="glyphicon glyphicon-eye-open"></span> Mật khẩu</label>
                                    <input type="password" class="form-control" placeholder="Nhập mật khẩu" id="password" name="password" required/>
                                </div>
                                <div class="checkbox">
                                    <label> <input type="checkbox" id="ghinho"> Ghi nhớ tôi</label>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-success btn-block" type="button" onclick="testThu();" data-dismiss="modal"><span class="glyphicon glyphicon-off"></span> Đăng nhập</button>
                                </div>
                            </form>
                            <script type="text/javascript">
//                              $('#myForm').validator();
                            </script>
                        </div>
                        <div class="modal-footer" style="margin-left:12px;">
                            <button type="button" class="btn btn-danger pull-left" data-dismiss="modal"> <span class="glyphicon glyphicon-remove"></span> Hủy bỏ</button>
                             <p>Bạn chưa phải là thành viên? <a href="Dangky.html">Đăng ký</a></p>
                        </div>
                    </div>
                </div>
            </div>

            <!--Màn hình đăng ký-->

            <div class="modal fade" id="sign" role="dialog">
                <!--Than Modal:-->
                <div class="modal-dialog">
                    <!--Modal content:-->
                    <div class="modal-content">
                        <div class="modal-header" style="height:50px;background-color:#33F9FF">
                            <button type="button" class="close"  data-dismiss="modal" >&times;</button>
                            <b style="font-size:20px"><span class="glyphicon glyphicon-pencil"></span> Đăng ký thành viên</b>
                        </div>
                        <div class="modal-body" style="padding:10px 40px;">
                            <form action="goDK.html" role="form" method="post" id="formDK">

                                <div class="row">
                                    <div class="form-group">
                                        <label class="control-label col-md-4">Tên đăng nhập</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" placeholder="Nhập tên người dùng" id="user" name="user" required/>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="control-label col-md-4"> Mật khẩu</label>
                                        <div class="col-md-8">
                                            <input type="password" class="form-control" placeholder="Nhập mật khẩu" id="password" name="password" required/>
                                        </div>
                                    </div>
                                </div>

                                <br>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="control-label col-md-4"> Nhập lại mật khẩu</label>
                                        <div class="col-md-8">
                                            <input type="password" class="form-control"  id="repassword" placeholder="Nhập lại mật khẩu" name="repassword" required/>
                                        </div>
                                    </div>
                                </div>

                                <br>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="control-label col-md-4"> Tên khách hàng</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control"  id="name" placeholder="Tên khách hàng" name="name" required/>
                                        </div>
                                    </div>
                                </div>

                                <br>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="control-label col-md-4"> Số điện thoại</label>
                                        <div class="col-md-8">
                                            <input type="number" class="form-control"  id="phone" placeholder="Số điện thoại" name="phone"  maxlength="10" required/>
                                        </div>
                                    </div>
                                </div>

                                <br>
                                <div class="row">
                                    <div class="form-group">
                                        <label class="control-label col-md-4"> Địa chỉ</label>
                                        <div class="col-md-8">
                                            <input type="text" class="form-control" id="address" placeholder="Địa chỉ" name="address" required/>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4"></div>
                                    <div class="col-md-8">
                                        <div class="checkbox">
                                            <label> <input type="checkbox" value="nam" id="name" name="gt"/>Nam</label>
                                            <label> <input type="checkbox" value="nu" id="name" name="gt"/>Nữ</label>
                                        </div> 
                                    </div>

                                </div>

                                <div class="modal-footer" style="margin-left:12px;">

                                    <div class="row">
                                        <div class="col-md-4"></div>
                                        <div class="col-md-8">
                                            <button type="submit" class="btn btn-success  pull-left" onclick="return confirm('Bạn chắc muốn đăng ký ?')"> <span class="glyphicon glyphicon-ok-sign"></span> Đăng ký</button>

                                        </div>

                                    </div>

                                </div>
                            </form>
                            
                            
                        </div>

                    </div>
                </div>
            </div>
            </div>
                                        
                                        <script>
                                                    
                                            function testThu() {
                                                var user = $('#username').val();
                                                var pass = $('#password').val();
                                                
                                                 //kiem tra gia tri check:
                                                if($("#ghinho").is(":checked")){
                                                    $.cookie('ten',user, { expires: 1 });
                                                    $.cookie('matkhau',pass, { expires: 1 });
                                                    $.cookie('re',"ok", { expires: 1 });
                                                 }
                                                 else {
                                                    // reset cookies
                                                    $.cookie('ten', null);
                                                    $.cookie('matkhau', null);
                                                    $.cookie('re', null);
                                                    }
                                                    
                                                //Su dung Ajax lay gia tri ve:
                                                $.ajax({
                                                    type: "post",
                                                    url: "goDN.html",
                                                    data: {
                                                        user: user,
                                                        pass: pass
                                                    },
                                                    success: function (kq) {
                                                        if (kq === "1") {
                                                            alert("Tài khoản Admin đăng nhập thành công!");
                                                            window.location.href="goQuanly.html";


                                                        }
                                                        else if(kq === "2"){
                                                             alert("Đăng nhập thành công!");
                                                             window.location.reload();
                                                        }
                                                        else {
                                                            alert("Đăng nhập thất bại!");
                                                            window.location.reload();
                                                        }
                                                         
                                                    }
                                                });

                                            }
                                            
                                          </script>
                                          
                                     <script>
//                                      //Ham nhan ve cookie:
                                        var re = $.cookie('re');
                                        if(re==="ok"){
                                        var ten = $.cookie('ten');
                                        var matkhau = $.cookie('matkhau');
                                        
                                        //Them vao cac truong:
                                        $("#username").val(ten);
                                        $("#password").val(matkhau);
                                        $("#ghinho").prop('checked', true);
                                        }
                                        else{
                                            $("#username").val("");
                                            $("#password").val("");
                                            $("#ghinho").prop('checked',false);
                                        }
                                    </script>
            <!--Them vao binh luan và share-->
            <div class="row">
                <hr>
<!--                Khu vuc thong bao thanh cong
-->             <%
                      String t=(String)session.getAttribute("ts");
                      if("no".equals(t)){
                          %>
                           <div class="alert alert-success">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Thành Công!</strong> Đã thêm sản phẩm vào giỏ hàng.
                            </div>
                          <%
                         
                      }
                    else if("yes".equals(t)){
                          %>
                           <div class="alert alert-warning">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Đã Update!</strong> Đã update giỏ hàng.
                            </div>
                          <%
                    }
                     session.removeAttribute("ts");
                %>
                
                <div class="col-xs-1"></div>
                <div class="col-xs-7">
                    <h1 class="text-muted">Điện Thoại <%= sp %> </h1> 
                    
                    <div class="row">
                     <div class="g-plusone pull-right" style="margin-left:160px;" data-annotation="inline" data-width="300"></div>
                      <!--Like face-->
                    <iframe src="https://www.facebook.com/plugins/like.php?href=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&width=94&layout=button&action=like&show_faces=true&share=true&height=65&appId" width="94" height="65" 
                            style="border:none;overflow:hidden;margin-right:300px;" scrolling="no" frameborder="0" allowTransparency="true" class="pull-right"></iframe>
                    </div>
                    <!-- Đặt thẻ này vào phần đầu hoặc ngay trước thẻ đóng phần nội dung của bạn. -->
                    <script src="https://apis.google.com/js/platform.js" async defer>
                     
                    </script>
                    <div class="row">
                        <div class="row">
                            <ul id="etalage" style="margin-top:6px;">
                               <li>
                                   <a href="#">
                                   <img class="etalage_source_image img-responsive" src="<c:url value="img/${invt.path}"></c:url>" style="border-radius:0px;margin-left:40px;;">
                                   </a>
                               </li>
                            
                           </ul>
                            <script>
                            jQuery(document).ready(function($){

                                    $('#etalage').etalage({
                                            thumb_image_width:400,
                                            thumb_image_height:410,
                                            source_image_width:650,
                                            source_image_height:790,
                                            show_hint: true,
                                            click_callback: function(image_anchor, instance_id){
                                                    alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
                                            }
                                    });

                            });
                           </script>
                           
                          
                        </div>
                        
                           
                        
                        <div class="row">
                            <br><br><br><br>
                            <h2 class="text-muted" style="text-align:center">Thông số kỹ thuật</h2>
                            <br>
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                    <td>
                             
                                    </td>
                                    </tr> 
                                </thead>
                                
                                <tbody>
                                    
                                    
                                    <tr>
                                        <th>
                                            <div class="col-sm-7"><p class="pull-left text-muted">Hình dáng điện thoại:</p></div>
                                            <div class="col-sm-5"><i class="pull-right text-info">nguyên khối</i></div>
                                        </th> 
                                    </tr>
                                    
                                    <tr>
                                        <th>
                                            <div class="col-sm-7"><p class="pull-left text-muted">Thao tác trên máy:</p></div>
                                            <div class="col-sm-5"><i class="pull-right text-info">cảm ứng</i></div>
                                        </th> 
                                    </tr>
                                    
                                    <tr>
                                        <th>
                                            <div class="col-sm-7"><p class="pull-left text-muted">Màn hình:</p></div>
                                            <div class="col-sm-5"><i class="pull-right text-info">${invt.sreen}</i></div>
                                        </th> 
                                    </tr>
                                    
                                    <tr>
                                        <th>
                                            <div class="col-sm-7"><p class="pull-left text-muted">Camera:</p></div>
                                            <div class="col-sm-5"><i class="pull-right text-info">${invt.camera}</i></div>
                                        </th> 
                                    </tr>
                                    
                                    <tr>
                                        <th>
                                            <div class="col-sm-7"><p class="pull-left text-muted">CPU:</p></div>
                                            <div class="col-sm-5"><i class="pull-right text-info">${invt.cpu}</i></div>
                                        </th> 
                                    </tr>
                                    
                                    <tr>
                                        <th>
                                            <div class="col-sm-7"><p class="pull-left text-muted">Hệ điều hành:</p></div>
                                            <div class="col-sm-5"><i class="pull-right text-info">${invt.hdh}</i></div>
                                        </th> 
                                    </tr>
                                    
                                    <tr>
                                        <th>
                                            <div class="col-sm-7"><p class="pull-left text-muted">RAM:</p></div>
                                            <div class="col-sm-5"><i class="pull-right text-info">${invt.ram}</i></div>
                                        </th> 
                                    </tr>
                                    
                                    <tr>
                                        <th>
                                            <div class="col-sm-7"><p class="pull-left text-muted">Màu sắc:</p></div>
                                            <div class="col-sm-5"><i class="pull-right text-info">${invt.color}</i></div>
                                        </th> 
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--Khug hien thi binh luan san pham-->               
                   <div class="row">
                       
                      
                       <div class="col-xs-11 pull-left">
                           <h4 class="text-muted"><p>Bình luận về sản phẩm</p></h4>
                           <br>
                       <!--Thanh tab-->
                       <ul class="nav nav-tabs" style="width:100%">
                            
                        <li class="active">
                            <a data-toggle="tab" href="#menu">Hội chém gió <span><img style="width:25px;height:25px;" src="user/dou.png"></span>

                            </a>
                        </li>
                        <li>
                            
                        <a data-toggle="tab" href="#menu1">Bình luận qua <span><img style="width:25px;height:25px;" src="img/face.png"></span>
                            
                        </a>
                            
                        </li>
                        
                       </ul>
                       
                       
                       <div class="tab-content">
                               <br>
                                <!--tabs content-->
                                <div id="menu" class="tab-pane fade in active">
                                    <h3>  <span class="label label-success" style="border-radius:0px;"><i>Lượt bình luận</i>  <span class="badge">${count}</span></span></h3>
                                    <br>
                                    
                                    <div class="thumbnail" style="border-radius:0px;height:auto">
                                        <br>
                                        <!--Them vao khung binh luan-->
                                        
                                       
                                       
                                        <div class="thumbnail" style="border-radius:0px;">
                                                <div class="row">
                                                    <div class="col-md-2" id="co">
                                                    
                                                    </div>
                                       
                                                    <div class="col-md-10">
                                                        <form>
                                                            <textarea id="content" style="width:100%;height:87px;" placeholder="Nội dung bình luận..."></textarea>
                                                            <a class="btn pull-right" style="border-radius:0px;background-color:orange;color:white" onclick="comment()">Bình luận</a>
                                                        </form>
                                                        <input id="url" value="${kh.path}" type="hidden">
                                                    </div>
                                                </div>
                                                
                                                
                                        </div>
                                               <c:forEach items="${cm}" var="c">
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <img class="img-responsive pull-left" style="height:50px;width:50px;margin-right:20px;" src="<c:url value="user/${c.path}"></c:url>">
                                                        <p style="margin-top:0px;font-size:18px;color:blue">${c.name} :</p>
                                                        <p class="text-muted">${c.date}</p>
                                                    </div>
                                                    <div class="col-md-7">
                                                         
                                                        <div class="pull-left">
                                                            <i class="text-muted">${c.comment}</i>
                                                        </div>
                                                       
                                                    </div>
                                                </div>
                                                <br>
                                                </c:forEach>
                                        
                                        <%
                                           String re=(String)session.getAttribute("ten");
                                           if("".equals(re) || re!=null){
                                        %>
                                        <script>
                                                
                                                        //Sau khi phat hien co tai koan dang nhap thi append anh cua user vao:
                                                        var im="";
                                                        im+='<img class="img-responsive img-thumbnail" src="<c:url value="user/${kh.path}"></c:url>" style="height:90px;width:90px;">';
                                                        //Them vao the anh:
                                                        $("#co").append(im);
                                                        
                                                        
                                                        //tao su kien click vao:
                                                        function comment(){
                                                            var ct=$("#content").val();
                                                            var invtId="${invt.inventoryId}";
                                                            var name="${kh.name}";
                                                            var path=$("#url").val();
                                                            //Lay gia tri ngay hien tai
                                                            var d=new Date();
                                                            //doi gia tri ngay:
                                                            var n = d.toDateString();
                                                            
                                                            if(ct===null || ct===""){
                                                                alert('Không được bỏ trống!');
                                                            }
                                                            else{
                                                                $.ajax({
                                                                type: "post",
                                                                url: "goComment.html",
                                                                data: {
                                                                    comment:ct,
                                                                    invtId:invtId,
                                                                    name:name,
                                                                    path:path,
                                                                    date:n
                                                                  
                                                                },
                                                                success: function (kq) {
                                                                   window.location.reload();

                                                                }
                                                                   });

                                                            }
                                                        }
                                                        
                                                        
                                        </script>
                                       <%
                                         }
                                            else{
                                                 
                                                 %>
                                                 <script>
                                                         
                                                       //Sau khi phat hien Khong co tai koan dang nhap thi append anh cua user vao:
                                                        var im="";
                                                        im+='<img class="img-responsive img-thumbnail" src="<c:url value="user/coment.jpg"></c:url>" style="height:90px;width:90px;">';
                                                        //Them vao the anh:
                                                        $("#co").append(im);
                                                        
                                                         //tao su kien click vao:
                                                        function comment(){
                                                            alert('Vui lòng đăng nhập để bình luận !');
                                       
                                                        }
                                                        
                                                       
                                                 </script>
                                                 <%
                                            }
                                       %>
                                        
                                    </div>
                                    
                                </div>

                                <div id="menu1" class="tab-pane fade">
                                   <div class="fb-comments" data-href="https://www.facebook.com/groups/827057213998416/" data-numposts="5"></div>
                                   <div id="fb-root"></div>
                                   
                                        <script>(function(d, s, id) {
                                          var js, fjs = d.getElementsByTagName(s)[0];
                                          if (d.getElementById(id)) return;
                                          js = d.createElement(s); js.id = id;
                                          js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.7";
                                          fjs.parentNode.insertBefore(js, fjs);
                                        }(document, 'script', 'facebook-jssdk'));</script>
                                        
                                </div>

                        </div>
                       
                        
                          
                       </div>
                       <div class="col-xs-1">
                           
                       </div>
                   </div>
                </div> 
                <div class="col-xs-1"></div>
                <div class="col-xs-4">
                    <div class="row">
                    <div class="thumbnail" style="border-color:blue;height:570px;margin-top:140px;">
                        <br>
                        <c:choose>
                            <c:when test="${invt.sale>0}">
                            <p style="color:orangered;font-size:25px;text-align:center">Giá mới: ${invt.gia-(invt.gia*(invt.sale/100))} VNĐ</p>
                            <p style="font-size:25px;text-align:center" class="text-muted"><strike>Giá cũ: ${invt.gia} VNĐ</strike></p> 
                            </c:when>
                            <c:otherwise>
                            <h2 style="text-align:center;color:red">Giá bán: ${invt.gia} VNĐ</h2>
                            </c:otherwise>
                        </c:choose>
                        
                        <br>
                        <div class="thumbnail" style="background-color:#E0F8F1;height:300px;">
                            <p style="margin-top:15px;">
                                <span class="glyphicon glyphicon-ok" style="color:green"></span>
                                Đặt hàng online hoặc Liên Hệ qua số: <b style="color:blueviolet">19008198</b>
                            </p>
                            <p style="margin-top:15px;">
                                <span class="glyphicon glyphicon-ok" style="color:green"></span>
                                Giao hàng miễn phí tận nơi trong ngày
                            </p>
                            <p style="margin-top:15px;">
                                <span class="glyphicon glyphicon-ok" style="color:green"></span>
                                Chúng tôi cam kết hàng chính hãng.
                            </p>
                            <p style="margin-top:15px;">
                                <span class="glyphicon glyphicon-ok" style="color:green"></span>
                                Bảo hành sản phẩm <b style="color:green">12 tháng</b>
                            </p>
                            <p style="margin-top:15px;">
                                <span class="glyphicon glyphicon-ok" style="color:green"></span>
                                Nếu sản phẩm lỗi hư hỏng nặng không thể bảo hành. Trong vòng <b style="color:red">1 tháng</b>, khách hàng có thể đổi mới máy 100 % zin.
                            </p>
                            <p style="margin-top:15px;">
                                <span class="glyphicon glyphicon-ok" style="color:green"></span>
                                Thanh toán bằng tiền mặc hoặc <b><img class="img-responsive img-thumbnail" src="<c:url value="img/visa.jpg"></c:url>" style="height:50px;width:70px;"></b>
                                <b><img class="img-responsive img-thumbnail" src="<c:url value="img/sa.jpg"></c:url>" style="height:50px;width:70px;"></b>
                            </p>
                        </div> 
                                    <input id="slh" value="${invt.count}" type="hidden">
                               
                                <c:choose>
                                    <c:when test="${invt.count>0}">
                                      <div class="btn btn-block btn-lg" style="background-color:#ACFA58;">
                                      <b style="font-size:20px;">Số lượng hàng: <b style="font-style: italic;color:blueviolet;"> ${invt.count}</b></b>
                                      </div>
                                    </c:when>
                                    
                                    <c:otherwise>
                                      <div class="btn btn-block btn-lg" style="background-color:#ACFA58;">
                         
                                      <b style="font-size:25px;font-style:italic">Đã Hết Hàng !</b>
                                      </div>
                                    </c:otherwise>
                                    
                                </c:choose>
                        
                        <button class="btn btn-block btn-lg bg-primary" style="" onclick="gh()">
                            <span class="glyphicon glyphicon-shopping-cart"> Thêm giỏ hàng</span> 
                        </button>   
                    </div>
                            <script>
                                 function gh(){
                                     var gth = $("#slh").val();
                       
                                     if(gth == 0){
                                           alert("Xin lỗi đã hết hàng!");
                                     }
                                     else{
                                           if(confirm("Bạn có muốn add vào giỏ hàng??")){
                                            var ten="${kh.user}";
                                            if(ten!==""){
                                                window.location.href="addToCart.html?id=${invt.inventoryId}&name=${invt.name}&path=${invt.path}&price=${invt.gia}&sale=${invt.sale}&color=${invt.color}";
                                            }
                                            else{
                                                alert('Bạn cần đăng nhập để sử dụng chức năng này!');
                                            }
                                            }
                                     }
                             
                                     
                                 }
                            </script>
               
                </div> 
                        <br>
                        <div class="row">
                            <h2 class="text-muted" style="text-align:center;color:green"><i>Các sản phẩm cùng loại</i></h2>      
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                               <!--//day cac list danh sach cung loai-->
                               <c:forEach items="${sp}" var="invt">
                                       <div class="thumbnail" style="border-radius:0px;margin-bottom:15px;margin-top:5px;margin-left:40px;">
                                              
                                            <a href="goDetailInventory.html?id=${invt.inventoryId}&name=${invt.name}" title="${invt.name}">
                                            <img class="img-responsive" src="<c:url value="/img/${invt.path}"></c:url>" style="height:200px;width: 200px;"> 
                                            </a>
                                            <h5 class="text-muted" style="text-align:center">${invt.name}</h5>
                                      </div>
                                  
                               </c:forEach> 
                                    
                            </div>
                            <div class="col-md-2"></div>
                           
                                
                        </div>
                        
                       
                        
                        
                </div>

                       
            </div>
         
            <hr>
            <div class="row">
          
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
    </body>
</html>
