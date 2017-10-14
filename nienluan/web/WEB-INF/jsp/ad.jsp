<%-- 
    Document   : profile
    Created on : Aug 27, 2016, 3:16:17 PM
    Author     : Vo
--%>

<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang tin tức - giảm giá</title>
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
                .p{
                    display: inline;
                }
            @media (min-width: 969px) and (max-width: 1292px) {
                      .btn-responsive {
                        padding:2px 4px;
                        font-size:85%;
                        line-height:1.8;
                      }
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
                    <p style="margin-left:10px; " class="p"><a href="">tin tức - giảm giá</a></p>
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
                
            
                           
          
                <!--them vao noi dung quan ly-->


                <!--Xu ly dang nhap:-->

            <%
                //Lay ten ang nhap nguoi dung.
                String lv = (String) session.getAttribute("ten");
                List<Cart> carts=new ArrayList<Cart>();
                carts=(List<Cart>)session.getAttribute("carts");
                if (lv != null) {
                     if(!"admin".equals(lv)){if(carts!=null){
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
                   
                }
                $('#dn').hide();
                $('#dk').hide();
                $('#dn').fadeOut();
                $('#dk').fadeOut();
                $('#log').show();
                $('#user').show();
                $('#g').show();
                $('#tc').html('<a class="pull-left" href="<%= request.getContextPath() %>"><b>Trang chủ<b style="color:black;margin-left:5px;" >></b><b></a>');
                $('#ql').html('<a class="pull-left" href="goProfile.html?tk=<%= lv %>"><b style="margin-right:20px;">user profile</b></a>');
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
                                                        html2='<a id="giohang" href="goCart.html" class="btn btn-success" style="height:38px;width:105px;margin-top:5px;margin-right:5px;padding-top:10px;" title="Giỏ hàng"><i>Giỏ hàng</i> <span class="badge">0</span></a>';
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
           <div class="row">
               <hr>
               <div id="hien" style="text-align:center;display:none">
                   <h2 class="text-muted">Các tin tức đã đăng</h2>
                   <p class="text-muted" style="font-style:italic">( Tin giảm giá - Tin tức khác )</p>
                   <br><br>
               </div>  
               
                <script>
                     $("#hien").fadeIn(2000);
                </script>
           </div>
           
          
           
            <div class="row" style="height:1220px;">
                
                
                <div class="col-xs-4 col-sm-4" id="up" style="display:none">
                   
                   
                        
                        <c:forEach items="${ad}" var="item">
                           
                            <div class="thumbnail sd">
                            <p class="pull-right">Đăng bởi: <i style="color:green">admin</i></p>
                            <br>
                            <img src="<c:url value="ad/${item.path}"></c:url>"  class="img-responsive img-responsive">
                            <h4 class="text-muted" style="text-align:center;color:blue">${item.tieude}</h4>
                            <p class="text-muted" style="text-align:center">${item.tomtat}....</p>
                            <p style="text-align:center"> <a href="adDetail.html?id=${kh.user}&ad=${item.id}" class=" btn-warning  btn"> Xem chi tiết <span class="glyphicon glyphicon-chevron-right"></span></a></p>
                            </div>
                            
                        </c:forEach>
                        
                   
                </div>
                <script>
                    $("#up").fadeIn(1000);
                </script>
                <div class="col-xs-4 col-sm-4"></div>
                <div class="col-xs-4 col-sm-4"></div>
                <div class="col-xs-4 col-sm-4"></div>
            </div>
            
            </div>
            
            <div class="row">
                <hr>
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
    </body>
</html>
