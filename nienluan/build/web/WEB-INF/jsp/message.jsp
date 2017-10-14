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
        <title>Trang tin phản hồi</title>
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
            p{
                display:inline;
            }
            .sd{
                box-shadow: 0px 2px 2px 1px rgba(0, 0, 0, 0.1), 2px 0px 10px 2px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
       <div class="container" style="width:100%">
    
        <div class="row">
                    <hr>
                    
                    <div class="col-xs-8 pull-left">
                        
                    <div class="row" style="margin-top:8px;">  
                        <p style="margin-left:10px;" class="pull-left"><a href="<%= request.getContextPath() %>">Trang chủ</a></p>
                        <p  style="margin-left:10px;color:blue" class="pull-left">></p>
                        <p style="margin-left:10px;" class="pull-left"><a href="goProfile.html?tk=${tk.user}">trang cá nhân</a></p>
                        <p  style="margin-left:10px;color:blue" class="pull-left">></p>
                        <p style="margin-left:10px;" class="pull-left"><a href="#">tin nhắn</a></p>
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
                                                $('#u').html('<a href="goProfile.html?tk=${tk.user}" id="tk" class="pull-left" style="margin-left:220px;margin-top:6px;color:red;"> <b name="tv"> <%= lv %></b> <p style="color:black;margin-left:10px;" class="pull-right">||</p></a>');
                                                $('#thoat').html('<a id="dangxuat" class="pull-right btn"><span class="glyphicon glyphicon-log-out"> Đăng xuất</span></a>');
                                                //ham xu ly khi click vao dang xuat:
                                                
                                                $( '#dangxuat' ).click(function( event ) {
                                                   
                                                            window.location.href="goLogout.html";
                            
                                                 });
                              
                                           </script>
                                           <% }
                                           
                                        
                   %>
        <div class="row" style="height:600px;">
            <hr>
            <div class="col-sm-10 col-sm-offset-1">
                <div class="thumbnail sd" style="height:500px;">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr style="background-color:#CEF6F5">
                                <th class="text-muted">STT</th>
                                <th class="text-muted">Tin nhắn của bạn</th>
                                <th class="text-muted">Tình trạng</th>
                                <th class="text-muted">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${message}" var="it" varStatus="i">
                                <tr>
                                    <td>${it.id}</td>
                                    <td>${it.cauhoi}</td>
                                    <c:choose>
                                        <c:when test="${it.tinhtrang eq 'no'}">
                                            <td style="color:orange"><span class="glyphicon glyphicon-remove-sign"></span> Chưa trả lời</td>
                                            <td>Không có hành động</td>
                                        </c:when>
                                        <c:otherwise>
                                            <%
                                                int i=0;
                                                i++;
                                            %>
                                            <td style="color:green"><span class="glyphicon glyphicon-check"></span> Đã trả lời</td>
                                            <td>
                                                <a class="btn btn btn-info" href="#" data-toggle="modal" data-target="#myModal${i.count}" style="color:white">Xem phản hồi</a>
                                             
                                            </td>
                                            <!-- Modal -->
                                        <div id="myModal${i.count}" class="modal fade" role="dialog">
                                          <div class="modal-dialog">

                                            <!-- Modal content-->
                                            <div class="modal-content">
                                              <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title" style="color:green">Admin trả lời</h4>
                                              </div>
                                              <div class="modal-body">
                                                <p>${it.traloi}</p>
                                              </div>
                                              <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                              </div>
                                            </div>

                                          </div>
                                        </div>
                                        </c:otherwise>
                                    </c:choose>
                                            <script>
                                            $(document).ready(function(){
                                                $('[data-toggle="tooltip"]').tooltip();
                                            });
                                            </script>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>           
        </div>
        
        <div class="row">
        <hr>
        <a href="<%= request.getContextPath() %>" class="btn-sm pull-right">
        <span class="glyphicon glyphicon-home"></span>  Trang chủ
        </a>
                    
        <a href="goProfile.html?tk=${tk.user}" class="btn-sm pull-left">
        <span class="glyphicon glyphicon-chevron-left"></span>  Về trang cá nhân
        </a>
        </div>
        </div>
        
    </body>
</html>
