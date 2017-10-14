<%-- 
    Document   : footer
    Created on : Aug 26, 2016, 8:08:56 PM
    Author     : Vo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!--              
<!--                            
               <footer class="footer-distributed">

                   <div class="row">
                            <div class="footer-left">
                            <div class="col-sm-2">
                                <br>
                                <a href="" class="pull-right">  <img src="<c:url value="/img/shop.jpg"></c:url>" class="img-thumbnail" width="150px" height="150" style="margin-top:2px;"></a>
                               
                            </div>
                            <div class="col-sm-4 pull-left">
                                <div class="pull-left footer-company-about" style="margin-bottom:40px;">
                                    <br>
                                    <p class="pull-left" >
                                    <b>Thiết kế bởi VLMT &copy; 2016</b>
                                    </p>
                                    <br>
                                    
                                    <p class="pull-left">
                                    Cửa hàng điện thoai di động Trung mobile
                                    </p>
                                    <br>
                                    
                                    <p class="pull-left">
                                    Chi nhánh: Xã Tân Lược - Huyện Bình Tân - Tỉnh Vĩnh Long
                                    </p>
                                    <br>
                                    
                                   <p class="pull-left">
                                       Mọi chi tiết xin liên hệ: <b style="color:buttonface">01663550900</b> hoặc <b style="color:buttonface">1900 8198</b>
                                    </p>
                                   <br>
                                   <p class="pull-left">
                                      Email: <i style="color:blue">Votrung017@gmail.com</i>
                                   </p>
                                   <br><br><br>
                       
                                   <p class="pull-left" style="color:green;font-size:30px;margin-right:100px;" id="clock">
                                     
                                   </p>
                                   <br>
                                   
                                   <script>
                                    function startTime() {
                                        var today = new Date();
                                        var h = today.getHours();
                                        var m = today.getMinutes();
                                        var s = today.getSeconds();
                                        m = checkTime(m);
                                        s = checkTime(s);
                                        document.getElementById('clock').innerHTML =
                                        h + ":" + m + ":" + s;
                                        var t = setTimeout(startTime, 500);
                                    }
                                    function checkTime(i) {
                                        if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
                                        return i;
                                    }
                                   </script>
                                </div>
                            </div>
                            <div class="col-sm-1"></div>
                            <div class="pull-left col-xs-5 col-lg-5 col-sm-5">
                               <p class="footer-links pull-right" style="margin-bottom:40px;">
                              
                                            <a href="">Trang chủ</a>
         
                                            <a href="#" title="Giới thiệu">Giới thiệu</a> 
                                             
                                            <a href="#">Khuyến mãi-Tin Tức</a>
                                             
                                            <a href="#">Liên hệ </a>
                               </p>
                                <p style="padding-left:64px;color:orange;font-style:italic;font-size:20px;margin-bottom:10px;">
                                <marquee > Khẳng định thương hiệu Việt !</marquee>
                                </p>
                                <br>
                            </div>
                          
			   </div>
                       
                           
                            <div class="footer-right" style="margin-right:22px;">
                                <a href="#"><i class="fa fa-facebook" style="color:blue"></i></a>
                                <a href="#"><i class="fa fa-twitter" style="color:#58ACFA"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-google-plus"style="color:orangered"></i></a>

			    </div>
                       
                      
                        </div>
                   
                        
                   
			
			
		</footer>-->

<!-- The content of your page would go here. -->
 <%
                                //Lay ten dang nhap nguoi dung.
                                String lv=(String)session.getAttribute("ten");
 %>  
		<footer class="footer-distributed">

			<div class="footer-left">

				<h3>Trung<span> mobile</span></h3>

				<p class="footer-links">
					    <a href="<%= request.getContextPath()%>">Trang chủ</a> |
         
                                           
                                             
                                            <a href="goAd.html?tk=<%= lv %>">Khuyến mãi-Tin Tức</a> |
                                             
                                            <a href="goLH.html?tk=<%= lv %>">Liên hệ </a>
				</p>

				<p class="footer-company-name">Bản quyền &copy; 2016</p>
                                <br>
                                <p id="clock" style="color:green;font-size:25px;"></p>
                                
			</div>

			<div class="footer-center">

				<div>
					<i class="fa fa-map-marker"></i>
					<p><span>Tân Lược</span> Bình Tân,  Vĩnh Long</p>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>+84 1663 550 900</p>
				</div>

				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="#">Votrung017@gmail.com</a></p>
				</div>

			</div>

			<div class="footer-right">

                              <p class="footer-company-about" style="margin-top:5px;">
					<span>Thông tin về cửa hàng</span>
					Thành lập 8/2016. Chuyên cung cấp sỉ, lẻ các mẫu điện thoại di động.
                                        <br>
                                        Giao hàng tận nơi, miễn phí toàn quốc.
                                        
                                        <p style="color:orange;font-style:italic;font-size:20px;margin-top:10px;margin-right:10px;">
                                        <marquee > Khẳng định thương hiệu Việt !</marquee>
                                        </p>
			      </p>

				<div class="footer-icons">

                                    <a href="https://www.facebook.com/trung.voleminhtrung" target="_blank"><i class="fa fa-facebook" style="color:blue"></i></a>
                                        <a href="https://twitter.com/?lang=vi"  target="_blank"><i class="fa fa-twitter" style="color:#58ACFA"></i></a>
                                        <a href="https://www.instagram.com/"  target="_blank"><i class="fa fa-instagram"></i></a>
                                        <a href="https://accounts.google.com/ServiceLogin?hl=vi"  target="_blank"><i class="fa fa-google-plus"style="color:orangered"></i></a>

				</div>

			</div>
                                            
                          <script>
                                    function startTime() {
                                        var today = new Date();
                                        var h = today.getHours();
                                        var m = today.getMinutes();
                                        var s = today.getSeconds();
                                        m = checkTime(m);
                                        s = checkTime(s);
                                        document.getElementById('clock').innerHTML =
                                        h + ":" + m + ":" + s;
                                        var t = setTimeout(startTime, 500);
                                    }
                                    function checkTime(i) {
                                        if (i < 10) {i == "0" + i};  // add zero in front of numbers < 10
                                        return i;
                                    }
                                   </script>

		</footer>