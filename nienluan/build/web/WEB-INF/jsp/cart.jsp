<%-- 
    Document   : cart
    Created on : Oct 12, 2016, 4:02:38 PM
    Author     : Vo
--%>

<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang giỏ hàng </title>
        <script src="<c:url value="/resources/js/jquery-2.2.4.min.js"></c:url>"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
        
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
         <!--Them vao cac custom footer:-->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/css/demo.css"></c:url>">
       <link rel="stylesheet" href="<c:url value="/resources/css/footer-distributed-with-address-and-phones.css"></c:url>">
        
        <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
        <!--Them hieu ung khi click vao hinh anh:-->
        <style>
            .p{
                display:inline;
            }
            .btn{
                border-radius:0px;
            }
/*            .troi{
                position:absolute;
                z-index:720;
            }
*/          .noi{
               position:absolute;
               z-index:auto;
            }
            .sd{
                box-shadow: 0px 2px 2px 1px rgba(0, 0, 0, 0.1), 2px 0px 10px 2px rgba(0, 0, 0, 0.1);
            }
            ul li{
                list-style:none;
            }
        </style>
    </head>
    
    <body onload="startTime()">
         <jsp:include page="narbar.jsp"></jsp:include>
        <div class="container" style="width:100%">
            <br><br>

                <div class="row">
                    <hr>
                    
                    <div class="col-xs-8 pull-left">
                        
                    <div class="row" style="margin-top:8px;">  
                        <p style="margin-left:10px;" class="pull-left"><a href="<%= request.getContextPath() %>">Trang chủ</a></p>
                        <p style="margin-left:10px;color:blue" class="pull-left">></p>
                        <p style="margin-left:10px;" id="ql" class="pull-left"><a href="goCart.html?id=${kh.user}">giỏ hàng của bạn</a></p>
                  
                        
                    </div>
                        
                    </div>

                    <div class="col-xs-4">
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
                
               </div>      <!--Them vao hop thoai dang nhap:-->
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
                                    <input type="text" class="form-control" placeholder="Nhập tên người dùng" id="username" name="user" required/>
                                </div>
                                <div class="form-group">
                                    <label><span class="glyphicon glyphicon-eye-open"></span> Mật khẩu</label>
                                    <input type="password" class="form-control" placeholder="Nhập mật khẩu" id="password" name="password" required/>
                                </div>
                                <div class="checkbox">
                                    <label> <input type="checkbox"> Ghi nhớ tôi</label>
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
                            <p>Bạn chưa phải là thành viên? <a href="#" data-toggle="modal" data-target="#sign">Đăng ký</a></p>
                        </div>
                    </div>
                </div>
            </div>

           
                       
              <div class="row">
                     <hr>
                     
                    
                     <%
                      String t=(String)session.getAttribute("pur");
                      if(t!=null){
                          %>
                            <div class="alert alert-success">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Chúng tôi đã nhận được đơn hàng của bạn</strong>
                            </div>
                            <br>
                          <%
                         
                      }
                      session.removeAttribute("pur");
                     
                    %>
                     <h2 class="text-muted" style="text-align:center;display:none" id="div2">Giỏ Hàng Của Bạn</h2>
                  
                     <br>
                     
                     <script>
                         $("#div2").fadeIn(3500);
                     </script> 
                     <div class="col-xs-8">
               
                <form method="post" action="updateCart.html" id="target">
                    <input name="tk" value="${kh.user}" type="hidden">
                    <table class="table table-hover table-responsive table-striped table-bordered sd" style="display:none" id="tb">
                <thead>
                    <tr style="background-color:#f4ecf7">
                        <th style="text-align:center">Ảnh</th>
                        <th style="text-align:center">Tên mặt hàng</th>
                        <th style="text-align:center">Số lượng</th>
                        <th style="text-align:center">Màu sắc</th>
                        <th style="text-align:center">Giảm giá</th>
                        <th style="text-align:center">Thành tiền</th>
                        <th style="text-align:center">Xóa</th>
                    </tr>
                </thead>
                
                <tbody>
                    
                <c:set var="Total" value="${0}"/>
                <c:forEach items="${ct}" var="cart" varStatus="i">
                    <tr style="text-align:center" onclick="myFunction(this)">
                        <td>
                            <img src="<c:out value="img/${cart.path}"></c:out>" class="img-responsive img-thumbnail" style="height:90px;width:90px;">
                        </td>
                        
                        <td style="padding-top:30px;">
                            <p style="font-size:20px;" class="text-muted">${cart.invtname}</p>
                        </td>
                        <form method="post" action="updateCart.html" id="target">
                        <td style="padding-top:30px;width:100px;">
                            <input id="sl${i.count}" name="sl${i.count}" value="${cart.sl}"  class="form-control" style="border-radius:0px;">
                           
                        </td>
                        
                        <td style="padding-top:30px;">
                            <p style="font-size:20px;" class="text-muted">${cart.color}</p>
                        </td>
                        
                        <td style="padding-top:34px;text-align:center">
                            
                            <p style="font-size:20px;"> ${cart.sale} %</p>
                           
                        </td>
                        
                        <c:choose>
                            <c:when test="${cart.sale>0}">
                                <td style="padding-top:30px;text-align:center">
                            
                                <p style="color:red;font-size:25px"> ${(cart.sl*cart.gia)-(cart.sl*cart.gia*(cart.sale/100))}<span style="display:inline;font-style:italic" class="text-muted"> VNĐ</span></p>
                                <p style="color:green">( Đã giảm giá )</p>
                           
                                </td>
                                <c:set var="Total" value="${Total + (cart.sl*cart.gia)-(cart.sl*cart.gia*(cart.sale/100))}" />
                            </c:when>
                            <c:otherwise>
                                 <td style="padding-top:30px;text-align:center">
                            
                                 <p style="color:red;font-size:25px"> ${cart.sl*cart.gia}<span style="display:inline;font-style:italic" class="text-muted"> VNĐ</span></p>
                                 <p class="text-muted">( Không giảm giá )</p>
                                 </td>
                                  <c:set var="Total" value="${Total + cart.sl*cart.gia}" />
                            </c:otherwise>
                        </c:choose>
                       
                        
                        <td style="padding-top:30px;width:100px;">
                            
                            <a class="btn" href="deleteCart.html?id=${i.count}&tk=${kh.user}" id="x${i.count}" style="font-size:20px;">
                                <span class="glyphicon glyphicon-remove"></span>
                            </a>
                           
                        </td>
                    </tr>
                   
                </c:forEach>
                    <script>
                         $("#tb").fadeIn(2000);
                    </script> 
                     <%
                                          //Lay ten ang nhap nguoi dung.
                                           String lv=(String)session.getAttribute("ten");
                                            List<Cart> carts=new ArrayList<Cart>();
                                            carts=(List<Cart>)session.getAttribute("carts");
                                           if(lv!=null){
                                               
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
                                                        $( '#giohang' ).click(function( event ) {
                                                   
                                                           alert("Bạn chưa đăng nhập.");
                            
                                                       });
                                                       
                                                        
                                                        
                                                  </script>
                                                  <%
                                                }
                                           
                                        
                   %>
                   
                   <script>
                                                    
                                            function testThu() {
                                                var user = $('#username').val();
                                                var pass = $('#password').val();
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
                  
               
                            $('table tr td input').change(
                                    function(){
                                         $( "#target" ).submit();
                                    });
                       
                    </script>
               
                </tbody>
                </table>
                </form>
            </div>
                   
            <div class="col-xs-4">
                
                <div class="thumbnail">
                    <p style="text-align:center;color:blue;font-size:20px;">Tổng Tiền Thanh Toán</p>
                    <center>
                         <p style="color:red;font-size:35px;display:inline" id="tt" class="text-muted">${Total} </p><b style="font-style:italic" class="text-muted">VNĐ</b>
                    </center>
                    <br>
                    
                    <form class="form-horizontal" id="thanhtoan" action="addPurchase.html" method="post">
                
                     
                  
                  
                        <input type="hidden" class="form-control" id="user" name="user" required value="${kh.user}">
                 
                  
                  
                <div class="form-group">
                  <label class="control-label col-sm-4 pull-left text-muted" for="name">Tên của bạn</label>
                  <div class="col-sm-8">
                      <input type="text" class="form-control" id="name" name="name" required value="${kh.name}">
                  </div>
                </div>
                  
                <div class="form-group">
                  <label class="control-label col-sm-4 text-muted" for="pwd">Email của bạn</label>
                  <div class="col-sm-8">
                      <input type="text" class="form-control" id="email" name="email" required="">
                  </div>
                </div>
                  
                <div class="form-group">
                  <label class="control-label col-sm-4 text-muted" for="pwd">Địa chỉ</label>
                  <div class="col-sm-8">
                      <input type="text" class="form-control" id="dc" name="address" value="${kh.address}" required>
                  </div>
                </div>
                    
                <div class="form-group">
                  <label class="control-label col-sm-4 text-muted" for="pwd">Số điện thoại</label>
                  <div class="col-sm-8">
                      <input type="text" class="form-control" id="sdt" name="sdt" value="${kh.phone}" required>
                  </div>
                </div>
                  
               
                      <input type="hidden" class="form-control" id="total" name="total" required>
                
                  <script>
                        $("#total").val($("#tt").text());
                        //..su dug ham thanh toan:
                        var tien=parseFloat($("#tt").text());
                        function tinhtien(){
                           var xn=confirm('Bạn muốn đặt hàng ?');
                           if(xn){
                               if(tien===0.0){
                                   
                                     alert('Không có mặt hàng được chọn');
                                }
                                else{
                                     $("#thanhtoan").submit();
                                }
                           }
                           
                        }
                  </script>
                <div class="form-group">
                  <label class="control-label col-sm-4 text-muted" for="pwd">Ngày đặt hàng</label>
                  <div class="col-sm-8">
                      <input type="text" class="form-control" id="date" name="date" required>
                  </div>
                </div>
                  
                <script>
                      var d = new Date();
                      var n = d.toDateString(); 
                      $("#date").val(n);
                </script>
                <br>
                <div class="form-group">
                 
                    <div class="col-sm-10 col-sm-offset-1">
                        <button type="submit" class="btn btn-info btn-lg btn-block btn-responsive" onclick="tinhtien()">Đặt hàng ngay</button> 
                    </div>
                 
                </div>
              </form>
                  
                </div>
            </div>
            
             </div>
        </div>
        
        <div class="row">
                <hr>
                <jsp:include page="footer.jsp"></jsp:include>
         </div>
    </body>
</html>
