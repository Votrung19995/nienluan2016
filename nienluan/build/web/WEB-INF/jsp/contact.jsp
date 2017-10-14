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
        <title>Trang liên hệ</title>
        <script src="<c:url value="/resources/js/jquery-2.2.4.min.js"></c:url>"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
        <!--Them vao cac custom footer:-->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/css/demo.css"></c:url>">
         <link rel="stylesheet" href="<c:url value="/resources/css/footer-distributed-with-address-and-phones.css"></c:url>">
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
        <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>



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
                        <p style="margin-left:10px;" id="ql" class="pull-left"><a href="goLH.html?tk=${kh.user}">liên hệ</a></p>
                  
                        
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
                             <p>Bạn chưa phải là thành viên? <a href="Dangky.html">Đăng ký</a></p>
                        </div>
                    </div>
                </div>
            </div>

           
               
                <!--Them vao lien he:-->
                
                
                <div class="row" id="an">
                <hr>
                <div class="row">
                    <h2 class="text-muted" style="text-align: center"><marquee behavior="alternate" width="5%">>></marquee>Hãy Liên Hệ Với Chúng Tôi !<marquee behavior="alternate" width="5%"><< </marquee></h2>
                </div>
                <br>
                <div class="col-md-10">
                    <div class="pull-right">
                        
                        <p class="text-muted" >Chúng tôi mong muốn lắng nghe từ bạn. Hãy liên hệ với chúng tôi và một thành viên của chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất. Chúng tôi yêu thích việc nhận được email của bạn mỗi ngày <em>mỗi ngày</em>.</p>
                        <form role="form" class="form-horizontal" action="addContact.html" method="post">
                            <div class="form-group">
                                
                                   
                                
                               <div class="col-md-6 pull-left">
                                   <input type="hidden" placeholder="Tên của bạn" name="ten" value="${kh.user}" id="ten" class="form-control" />
                               </div>
                                <div class="col-md-2"></div>

                            </div>
                            <div class="form-group">
                            <label for="name" class="control-label col-md-4 text-muted">Email</label>
                              <div class="col-md-6 pull-left">
                                  <input type="email" placeholder="Email của bạn" id="email" name="email"  class="form-control" required/>
                              </div>
                               <div class="col-md-2"></div>

                           </div>
                            
                           <div class="form-group">
                                   <label class="control-label  col-md-4 text-muted">Nội dung</label>
                               <div class="col-md-6 pull-left">
                                   <textarea rows="3" class="form-control" style="height:250px;" id="cauhoi" name="cauhoi" required></textarea>
                               </div>
                               <div class="col-md-2"></div>
                           </div>
                            
                           <div class="form-group">
                                   <label class="control-label  col-md-4"></label>
                               <div class="col-md-6 pull-left">
                                   <button type="submit" class="btn btn-default" onclick="return confirm('Bạn muốn gửi phản hồi!')"><i class="fa fa-send" style="color:green"> Gửi phản hồi</i></button>
                               </div>
                               <div class="col-md-2"></div>
                           </div>
                            
                        </form>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="pull-right">
                        <h5>Bản đồ</h5>
                        <p>
                            <a href="#">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15729855.42909206!2d96.7382165931671!3d15.735434000981483!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31157a4d736a1e5f%3A0xb03bb0c9e2fe62be!2zVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1445179448264" width="200" height="200" frameborder="0" style="border:0" scrolling="no" marginheight="0" marginwidth="0"></iframe>
                                <br />
                            </a>
                            <br />
                            <a href="#">Xem bản đồ</a>
                        </p>
                        <p>
                            Đại chỉ 1.
                            <br /> Địa chỉ 2.
                        </p>
                    </div>
                </div>
            </div>
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
                                            
            <div class="row">
                <hr>
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
    </body>
</html>
