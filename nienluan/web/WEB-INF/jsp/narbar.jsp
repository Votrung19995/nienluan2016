<%-- 
    Document   : narbar
    Created on : Aug 26, 2016, 7:58:53 PM
    Author     : Vo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <style>
        .bg-primary{
                     background-color:#2ECCFA;
                     color:black;
                 }
    </style>
</head>
<nav class="navbar navbar-fixed-top navbar-dark bg-primary">
  <div class="container-fluid">
    <div class="navbar-header">
     
      <img src="<c:url value="img/lg.gif"></c:url>" class="img-responsive" style="height:50px;width:110px;">
    </div>
  
    <ul class="nav navbar-nav">
        <li class="active">
            <a href="<%= request.getContextPath() %>" title="Trang chủ" class="gly"><span class="glyphicon glyphicon-home"></span> Trang chủ</a>
        </li>
        <li class="dropdown">
                                    <a href="#" class="gly" data-toggle="dropdown" title="Các loại điện thoại được bán"><span class="glyphicon glyphicon-gift"> Sản phẩm<span class="caret"></span></span></a>
                   
                                    <!-- Tao menu: -->
                                    <ul class="dropdown-menu">
                                        <li><a href="trangchu.html?st=0&en=12&sx=asc&sp=Apple"> Apple</a></li>
                                        <li><a href="trangchu.html?st=0&en=12&sx=asc&sp=Samsung"> Samsung</a></li>
       
                                        <li><a href="trangchu.html?st=0&en=12&sx=asc&sp=Nokia"> Nokia Lumia</a></li>
                                        <li><a href="trangchu.html?st=0&en=12&sx=asc&sp=Oppo"> Oppo</a></li>
                                        <li><a href="trangchu.html?st=0&en=12&sx=asc&sp=HTC"> HTC</a></li>
                                    </ul>

        </li>
        
                                 <%
                                    //Lay ten dang nhap nguoi dung.
                                    String lv=(String)session.getAttribute("ten");
                                 %>
                                    
         <li>
         <a type="hiden" class="gly" href="goLH.html?tk=<%= lv %>" title="Liên hệ cửa hàng"><span class="glyphicon glyphicon-phone-alt"></span>  Liên hệ</a>
         </li>
         
         <li>
         <a type="hiden"  class="navbar-brand gly" href="goAd.html?tk=<%= lv %>" style="display:inline" title="Các tin tức-giảm giá sản phẩm-khuyến mãi"><span><img src="<c:url value="/img/new5.gif"></c:url>"> </span>Tin tức</a>
         </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">  
      
      <li id="tdk"></li>
      <li id="tdn"></li>
      <li id="tgh"></li>
    </ul>
   
  </div>
</nav>             