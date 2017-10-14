<%-- 
    Document   : profile
    Created on : Aug 27, 2016, 3:16:17 PM
    Author     : Vo
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang lịch sử mua hàng</title>
        <script src="<c:url value="/resources/js/jquery-2.2.4.min.js"></c:url>"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
        <!--Them vao cac custom footer:-->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/css/demo.css"></c:url>">
         <link rel="stylesheet" href="<c:url value="/resources/css/footer-distributed-with-address-and-phones.css"></c:url>">
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
        <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>

        <style>
             .p{
                display:inline;
            }
            .sd{
                box-shadow: 0px 2px 2px 1px rgba(0, 0, 0, 0.1), 2px 0px 10px 2px rgba(0, 0, 0, 0.1);
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
                    <p style="margin-left:10px; " class="p"><a href="goProfile.html?tk=${kh.user}">trang cá nhân</a></p>
                    <p style="margin-left:10px;color:blue" class="p">></p>
                    <p style="margin-left:10px; " class="p"><a href="goPurchaseHistory.html?tk=${kh.user}">lịch sử mua hàng</a></p>
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
                
               </div>
                       
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

           
               
                <!--Them vao lien he:-->
             
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
//                                                        $( '#giohang' ).click(function( event ) {
//                                                   
//                                                           alert("Bạn chưa đăng nhập.");
//                            
//                                                       });
                                                       
                                                        
                                                        
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
            
               <div class="row " style="height:650px;">
              
                <hr>
                <br><br>
               
                <div class="col-md-10 col-md-offset-1">
                    
                    <div class="thumbnail sd">
                         <center>
                    <h2 id="an" class="text-muted" style="display:none">Hóa Đơn Mua Hàng Của Bạn</h2>
                      </center>
                <br>
                           <div class="table-responsive" id="tan" style="display:none">
                        
                    <table class="table table-striped table-bordered table-hover">
                      <thead>
                        <tr  class="info">
                          <th class="text-muted" style="text-align:center">STT</th>
                          <th class="text-muted" style="text-align:center">Mã Hóa Đơn</th>
                          <th class="text-muted" style="text-align:center">Ngày Mua hàng</th>
                          <th class="text-muted" style="text-align:center">Tổng Tiền Thanh Toán</th>
                          <th class="text-muted" style="text-align:center">Tình Trạng Hóa Đơn</th>
                          
                          <th class="text-muted" style="text-align:center">Nhận hàng</th>
                          <th class="text-muted" style="text-align:center">Xem Chi Tiết</th>
                          
                         
                         
                        </tr>
                      </thead>
                      <tbody>
                          <c:forEach items="${pur}" var="pur" varStatus="i">
                              <tr style="text-align:center">
                                  <td>${i.count}</td>
                                  <td>${pur.purchaseId}</td>
                                  <td>${pur.purchaseDate}</td>
                                  <td>${pur.total} VNĐ</td>
                                  <c:choose>
                                      <c:when test="${pur.status==0}">
                                          <td><i class="fa fa-frown-o" style="color:orange"></i> Chưa giao hàng</td>
                                      </c:when>
                                      <c:otherwise>
                                          <td><i class="glyphicon glyphicon-check" style="color:green"></i> Đã giao hàng</td>
                                      </c:otherwise>
                                  </c:choose>
                                  
                                  <c:choose>
                                      <c:when test="${pur.status==0}">
                                          <td><i class="fa fa-hand-paper-o"></i> Chưa thể nhận hàng</td>
                                      </c:when>
                                          
                                      <c:when test="${pur.give==0}">
                                          <td>
                                              <a href="give.html?tk=${kh.user}&id=${pur.purchaseId}" title="nhận hàng ngay" class="btn"> <i class="fa fa-thumbs-o-up" style="color:green"></i> Nhận hàng ngay</a>
                                          </td>
                                      </c:when>
                                          
                                      <c:otherwise>
                                          <td>
                                              <span class="glyphicon glyphicon-download-alt"style="color:blue"></span>Bạn đã nhận hàng
                                          </td>
                                      </c:otherwise>
                                  </c:choose>
                                  
                                  <!--Them vao modal xem chi tiet cac san pham-->
                                   <td><a href="goHistoryDetail.html?id=${pur.purchaseId}&tk=${kh.user}"><span class="glyphicon glyphicon-list-alt"></span></a></td>
                                  
                              </tr>
                          </c:forEach>
                      </tbody>
                    </table>
                        
                     </div>
                    </div>
                
                </div>
            </div>
                                            
                <script>
                     $("#an").fadeIn(1500);
                     $("#tan").fadeIn(1500);
                </script>
            <div class="row">
                
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
            </div>
    </body>
</html>
