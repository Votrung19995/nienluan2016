<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="dao.*" %>
<%@page import="model.*" %>
<%@page session="true" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Website bán hàng di động</title>
       
        <script src="<c:url value="/resources/js/jquery-2.2.4.min.js"></c:url>"></script>
        <!--Them vao cokie jqury-->
        <script src="<c:url value="/resources/js/jquery.cookie.js"></c:url>"></script>
        <script src="<c:url value="/resources/js/jquery.funtext.js"></c:url>"></script>
<!--        Them vao Md
        <link rel="stylesheet" href="<c:url value="/resources/css/mdb.min.css"></c:url>">
        <script src="<c:url value="/resources/js/mdb.min.js"></c:url>"></script>
        -->
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
       
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
        <link rel="stylesheet" href="<c:url value="/resources/css/custom.css"></c:url>">
        <!--Them vao cac custom footer:-->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/css/demo.css"></c:url>">
        <link rel="stylesheet" href="<c:url value="/resources/css/footer-distributed-with-address-and-phones.css"></c:url>">
        
        <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
        
        <style>
           .p{
                margin-top:2px;
                margin-left:5px;
                margin-bottom:4px;
            }
            i{
                margin-top:7px;
            }
          
                .cs{
                     border-radius: 0px;
                 }
                 
                 .ct{
                        
                        width:194px;
                        display: block;
                        position:absolute;
                        z-index:1000;
                        background-color:green;
                        background: -webkit-linear-gradient(top,rgba(0,0,0,3), rgba(0,0,0,0.8));
			background: -moz-linear-gradient(top,rgba(0,0,0,3), rgba(0,0,0,0.7));
			background: -o-linear-gradient(top,rgba(0,0,0,3), rgba(0,0,0,0.7));
			background: -ms-linear-gradient(top,rgba(0,0,0,3), rgba(0,0,0,0.8));
                 }
                 
                @media (min-width: 969px) and (max-width: 1292px) {
                      .btn-responsive {
                        padding:2px 4px;
                        font-size:85%;
                        line-height:1.8;
                      }
                    }
                    .ngang{
                        display:inline;
                    }
        </style>
        
    </head>

    <body id="myStore" onload="startTime()">
       
            <div class="row">
                 <!--import tran gdieu huong vao:-->
                <jsp:include page="narbar.jsp"></jsp:include>  
           
            </div>
                <div class="container" style="width:100%">
                <br><br><br>
                
                <div class="row" style="margin-bottom:15px;">
                    <div class="col-xs-2">
                        <form role="search" action="trangchu.html?st=0&en=12&sx=asc" method="post">
                        <div class="input-group">
                            <input type="text" class="form-control" id="mySearch"  placeholder="Bạn tìm gì..." name="mySearch" style="height:40px;border-radius:0px;border-color:green;">
                        <div class="input-group-btn">
                            <button class="btn btn-default btn-lg" style="border-color:green;border-radius:0px;" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                        </div>
                        </div>
<!--                        <div class="cs" style="border-radius:0px;height:60px;overflow:auto"id="ht">
                           
                        </div>-->
                      </form>
                     
                      <div id="mys" class="ct " style="">
                      </div>
                       
                        
                    </div>
                    
<!--                Test thu su kien tim kiem onkeyup-->
                    <script>
                   
                    $("#mys").hide();
                    $(document).ready(function(){
                         $("#mySearch").keyup(function(){ 
                             //dua gia tri qua Controller:
                             var html="";
                             $("mys").html("");
                             //
                             if($("#mySearch").val().length===0){
                                 $("#mys").hide();
                             }
                             
                             //gui qua Ajax:
                             $.ajax({
                             type: "post",
                             url: "getSearch.html",
                             data:{
                             gt:$(this).val()
                             },
                             success: function (kq) {
                             var ob=$.parseJSON(kq);
                             for(var i=0;i<=ob.length;i++){
                       
                                html+='<p style="margin-left:10px;margin-top:10px;margin-bottom:10px;font-size:16px;">'+'<a href="goDetailInventory.html?id='+ob[i].inventoryId+'&name='+ob[i].name+'" style="color:whitesmoke" title="'+ob[i].name+'">'+ob[i].name+'</a>'+'</p>';
                              
                                $("#mys").html(html);
                                $("#mys").show();
                                
                             }
                             
                             
                            }
                                  });   
                       });
                    });
                    </script>
                    
                    
                    <div class="col-xs-2">
                   
    
                          
                                <div class="dropdown " style="height:40px;background-color:#E0F8F1;text-align:center;;border-color:yellow;border-radius:0px;">
                                <%
                                    String gt=(String)request.getAttribute("gtsx");
                                    if(gt!=null){
                                        if("asc".equals(gt)){
                                            %>
                                            <a href="#" class="btn" data-toggle="dropdown" title="Các loại điện thoại được bán" style="margin-top:2px;border-radius:0px;color:black;">Giá thấp đến cao <span class="caret" style="color:black;"></span></a>
                                            <%
                                        }
                                        else{
                                             %>
                                               <a href="#" class="btn" data-toggle="dropdown" title="Các loại điện thoại được bán" style="margin-top:2px;border-radius:0px;color:black;">Giá từ cao đến thấp <span class="caret" style="color:black;"></span></a>
                                            <%
                                        }
                                    }
                                %>
                                
                           
                                    <!-- Tao menu: -->
                                    <ul class="dropdown-menu" id="menuchon" style="border-radius:0px">
                                        <li><a class="btn" style="color:black;font-size:15px;font-style:initial">Giá thấp đến cao</a></li>
                                        <li><a class="btn" style="color:black;font-size:15px;font-style:initial">Giá cao đến thấp</a></li>
                                    </ul>

                               </div>
                    </div>
                                
                            <!--Ham sap xep mat hang-->
                            <script>
                                    $('#menuchon li').on('click', function(){
                                          //Lay gia tri bien tra qua:
                                          var gt="${ms}";
                                          <%
                                              String tv=(String)request.getAttribute("gtsp");
                                              String sr=(String)request.getAttribute("sr");
                                          %>
                                          var kq=$(this).text();
                                          if(kq === "Giá thấp đến cao" ){
                                             //Reset lại trang:
                                             $("#sx").val("asc");
                                             
                                             if(gt==="rong"){
                                             window.location.href="trangchu.html?st=0&en=12&sx=asc";
                                             }
                                             if(gt==="khong rong"){
                                                 window.location.href="trangchu.html?st=0&en=12&sx=asc&sp=<%= tv %>";
                                             }
                                             if(gt==="search"){
                                                 window.location.href="trangchu.html?st=0&en=12&sx=asc&mySearch=<%= sr %>";
                                             }
                                          }
                                          else{
                                             $("#sx").val("desc");
                                             if(gt==="rong"){
                                             window.location.href="trangchu.html?st=0&en=12&sx=desc";
                                             }
                                             if(gt==="khong rong"){
                                               window.location.href="trangchu.html?st=0&en=12&sx=desc&sp=<%= tv %>";
                                             }
                                             if(gt==="search"){
                                               window.location.href="trangchu.html?st=0&en=12&sx=desc&mySearch=<%= sr %>";
                                             }
                                          }
                                    });
                            </script>
                            <div class="col-xs-3">
                               <div class="pull-left" style=" padding-top:10px;height:40px;width:200px;background-color:#E0F8F1;text-align:center;margin-left:10px;border-radius:0px;">
                                    <b style="color:red"><span class="fa fa-phone" style="margin-right:2px;"></span> Hotline:19008198</b>
                               </div>
                            </div>
                            

                        
                   
                       
                   
                          
                       
                    <div class="col-xs-5">
                            <div class="pull-right" style="margin-top:8px;">
                            <p style="margin-right:5px;" id="log" class="pull-right"><a href="goLogout.html" class="text-muted"><span class="glyphicon glyphicon-log-out text-muted"></span>   Đăng xuất</a></p>
                            <p style="margin-right:10px;margin-left:15px;" class="pull-right text-muted" id="g">|</p>
                            <p style="" id="user" class="pull-right text-muted"><a href="goProfile.html?tk=${kh.user}" class="text-muted"> <span  class="glyphicon glyphicon-user"></span> ${kh.name}</a> </p>
                            </div> 
                    </div>
       
                                 
                </div>
               
                 <script>
                            $('#log').hide();
                            $('#user').hide();
                            $('#g').hide();
                 </script>
                         
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
                            <form action="goDN.html" role="form" action="" method="post" id="myForm" >

                                <div class="form-group">

                                    <label><span class="glyphicon glyphicon-user"></span> Người dùng</label>
                                    <input type="text" class="form-control" placeholder="Nhập tên người dùng" id="username" name="user" required/>
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
            
          <div class="row">
                  
              
  
            <div class="col-xs-2">
                
                <div class="list-group">
                <span class="pull-right glyphicon glyphicon-chevron-right" style="color:white;margin-top:14px;margin-right:5px;"></span>
                <a href="trangchu.html?st=0&en=12&sx=asc&sp=Apple" class="btn-block btn-warning btn btn-lg" data-placement="top" data-toggle="tooltip" title="Sản phẩm Apple" style=" border-radius: 0px;">Apple</a><span class="pull-right glyphicon glyphicon-chevron-right" style="color:white;margin-top:14px;margin-right:5px;"></span>
                <a href="trangchu.html?st=0&en=12&sx=asc&sp=Samsung" class="btn-block btn btn-info btn-lg"  data-placement="top" data-toggle="tooltip" title="Sản phẩm Samsung" style=" border-radius: 0px;" >Samsung</a><span class="pull-right glyphicon glyphicon-chevron-right" style="color:white;margin-top:14px;margin-right:5px;"></span>
                <a href="trangchu.html?st=0&en=12&sx=asc&sp=HTC" class="btn btn-block btn-danger btn-lg"  data-placement="top" data-toggle="tooltip" title="Sản phẩm HTC" style=" border-radius: 0px;" >HTC</a><span class="pull-right glyphicon glyphicon-chevron-right" style="color:white;margin-top:14px;margin-right:5px;"></span>
                <a href="trangchu.html?st=0&en=12&sx=asc&sp=Nokia" class="btn btn-block btn-success btn-lg"  data-placement="top" data-toggle="tooltip" title="Sản phẩm Nokia Lumia" style=" border-radius: 0px;" >Nokia Lumia</a><span class="pull-right glyphicon glyphicon-chevron-right" style="color:white;margin-top:14px;margin-right:5px;"></span>
                <a href="trangchu.html?st=0&en=12&sx=asc&sp=Oppo" class="btn btn-block btn-primary btn-lg"  data-placement="top" data-toggle="tooltip" title="Sản phẩm Oppo" style=" border-radius: 0px;" >Oppo</a><span class="pull-right glyphicon glyphicon-chevron-right" style="color:white;margin-top:14px;margin-right:5px;"></span>
               
               
                
                <script>
                $(document).ready(function(){
                    $('[data-toggle="tooltip"]').tooltip();
                });
                </script>
               </div>
<!--                Danh cho quang cao
                <div class="row">
                    
                        <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2F4rvnzoom%2F%3Ffref%3Dts&tabs=timeline&width=340&height=500&small_header=false&adapt_container_width=false&hide_cover=false&show_facepile=false&appId"
                        width="215" height="350" style="border:none;overflow:hidden"
                        scrolling="no" frameborder="0" allowTransparency="true" class="thumbnail"></iframe>
                    
                </div>-->
                <br><br>
                
                    <a style="float:right" id="cl">Tắt quảng cáo [x]</a>
                    <a style="float:right" id="on">Bật lại</a>
                    
                    <a href="https://www.vinamilk.com.vn/" target="_blank">
                         <div class="thumbnail cs" id="qc">
                        <img src="<c:url value="img/Vinamilk.jpg"></c:url>" alt="Flowers" class="img-responsive">
                         </div>
                    </a>
                   
                
                <br>
               
                    <a style="float:right" id="cl1">Tắt quảng cáo [x]</a>
                    <a style="float:right" id="on1">Bật lại</a>
                    
                    <a href="https://www.omovietnam.com/" target="_blank">
                         <div class="thumbnail cs" id="qc1">
                        <img src="<c:url value="img/omo.jpg"></c:url>" alt="Flowers" class="img-responsive">
                         </div>
                    </a>
                   
                
                 <br>
                
                    <a style="float:right" id="cl2">Tắt quảng cáo [x]</a>
                    <a style="float:right" id="on2">Bật lại</a>
                    
                    <a href="http://myhao.vn/" target="_blank">
                        <div class="thumbnail cs" id="qc2">
                        <img src="<c:url value="img/myhao.jpg"></c:url>" alt="Flowers" class="img-responsive">
                        </div>
                    </a>
                    <br>
                    
                    <a style="float:right" id="cl3">Tắt quảng cáo [x]</a>
                    <a style="float:right" id="on3">Bật lại</a>
                    
                    <a href="#">
                         <div class="thumbnail cs" id="qc3">
                        <img src="<c:url value="img/qc.gif"></c:url>" alt="Flowers" class="img-responsive">
                        </div>
                    </a>
                   
             
                    
                     <!--Su dung quang cao-->
                    
                    <script>
                        $('#on').hide();
                        $("#cl").click(function(){
                            $('#qc').fadeOut();
                            $('#cl').fadeOut();
                            $('#on').fadeIn();
                        });
                        $("#on").click(function(){
                            $('#qc').fadeIn();
                            $('#cl').fadeIn();
                            $('#on').fadeOut();
                        });
                        
                        
                        $('#on1').hide();
                        $("#cl1").click(function(){
                            $('#qc1').fadeOut();
                            $('#cl1').fadeOut();
                            $('#on1').fadeIn();
                        });
                        $("#on1").click(function(){
                            $('#qc1').fadeIn();
                            $('#cl1').fadeIn();
                            $('#on1').fadeOut();
                        });
                         
                        $('#on2').hide();
                        $("#cl2").click(function(){
                            $('#qc2').fadeOut();
                            $('#cl2').fadeOut();
                            $('#on2').fadeIn();
                        });
                        $("#on2").click(function(){
                            $('#qc2').fadeIn();
                            $('#cl2').fadeIn();
                            $('#on2').fadeOut();
                        });
                        
                        $('#on3').hide();
                        $("#cl3").click(function(){
                            $('#qc3').fadeOut();
                            $('#cl3').fadeOut();
                            $('#on3').fadeIn();
                        });
                        $("#on3").click(function(){
                            $('#qc3').fadeIn();
                            $('#cl3').fadeIn();
                            $('#on3').fadeOut();
                        });
                    </script>
            </div>
                    
                                
          <div class="col-xs-10">
  
            <!--Them vao carousel-->
            <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2500">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <%
                        Integer d=(Integer)request.getAttribute("d");
                        for(int i=0;i<d;i++){
                            %>
                           <li data-target="#myCarousel" data-slide-to="<%= i %>"></li>
                            <%
                        }
                    %>
                    
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <a href="#">
                             <img src="<c:url value="ad/giasoc.jpg"></c:url>" alt="Flowers">
                            <div class="carousel-caption">
                                <h2>Chương trình ưu đãi khủng dành cho khách hàng.Nhanh lên nào...</h2>
                            </div>
                        </a>
                       
                    </div>


                    <!--Them vao cac quang cao-->
                    
                <c:forEach items="${ad}" var="a">
                    <div class="item">
                        <a href="adDetail.html?id=${kh.user}&ad=${a.id}">
                                <img src="<c:url value="ad/${a.path}"></c:url>" alt="Flowers">
                                <div class="carousel-caption">
                                    <h2>${a.tieude}</h2>
                                </div>
                        </a>
                    </div>
                </c:forEach>
                    
                </div>

                <a class="left carousel-control" href="#myCarousel"  data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel"  data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                
            </div>
            <hr>         
              
                            <div class="row" style="height:1150px;">
                                
                                <!--Xac dinh san pham rong hay khong:-->
                                    <div class="row" id="ct" style="padding-left:15px;">

                                    </div>

                                    <script>
                                           var a="${ms}";
                                           var tt='<h3 id="tt" class="text-muted" style="margin-left:12px;">Tất cả sản phẩm <i style="color:green">"${gtsp}"</i></h3>';
                                           var sr='<h3 id="sr" class="text-muted" style="margin-left:12px;"> Kết quả tìm kiếm <b style="color:red">${dem}</b> cho <i style="color:green">"${sr}"</i></h3>';

                                           if(a === "khong rong"){
                                               $("#ct").append(tt);
                                           }
                                           if(a === "search"){
                                               $("#ct").append(sr);
                                           }

                                    </script>
                                <br>
                                
                               
                                                 <!-- Ngan cach cac thanh phan them vao cac mat hang: -->
          
                                    <!--Dung vong lap c foech:-->
                                    <c:forEach items="${sp}" var="inventory" varStatus="i">
                                        <div class="col-xs-3 col-lg-3 col-sm-3">

                                                   <div class="thumbnail cs">
                                                        
                                                    <div class="product-box">
                                                        
                                                        <a href="goDetailInventory.html?id=${inventory.inventoryId}&name=${inventory.name}"> <img src="<c:url value="/img/${inventory.path}"></c:url>" class="img-responsive" style="height:190px">
                                                        <div class="product-detail">
                                                            
                                                            <!--them chi tiet cho an pham-->
                                                            <p class="p">Màn hình: ${inventory.sreen}</p>
                                                            <p class="p">Hệ điều hành: ${inventory.hdh}</p>
                                                            <p class="p">Ram: ${inventory.ram}</p>
                                                            <p class="p">CPU:${inventory.cpu}</p>
                                                            <p class="p">Camera: ${inventory.camera}</p>
                                                            <p class="p">Dung lượng pin: ${inventory.pin}</p>
                                                            <p class="p">Màu: ${inventory.color}</p>
                                                            <!--Them vao dieu kien-->
                                                            <c:choose>
                                                                <c:when test="${inventory.sale>0}">
                                                                   <p style="color:yellow;font-size:17px;text-align:center">Giá mới: ${inventory.gia-(inventory.gia*(inventory.sale/100))} VNĐ</p>
                                                                   <p style="color:orange;font-size:17px;text-align:center"><strike>Giá cũ: ${inventory.gia} VNĐ</strike></p> 
                                                                </c:when>
                                                                <c:otherwise>
                                                                   <p style="color:yellow;font-size:18px;text-align:center">Giá bán: ${inventory.gia} VNĐ</p>  
                                                                </c:otherwise>
                                                            </c:choose>
                                                           

                                                        </div>

                                                        </a>

                                                        <div class="row">
                                                            <br>
                                                            <c:if test="${inventory.sale>0}">
                                                                <h6 id="sl" style="text-align:center;color:red">
                                                               <img src="<c:out value="img/hot.gif"></c:out>">
                                                                <c:out value="${inventory.sale}% SALE OFF"></c:out></h6>
                                                            </c:if>


                                                            <h4 style="text-align:center;color:blue;margin-bottom:50px;">${inventory.name}</h4>
                                                        </div>

                                                    </div>


                                                        <center>
                                                       <div class="row">
                                                           <br>
                                                           <input id="slh${i.index}" value="${inventory.count}" type="hidden">
                                                           <a href="goDetailInventory.html?id=${inventory.inventoryId}&name=${inventory.name}" class="btn btn-default btn-responsive" style=" background-color: #E1F5A9;margin-right:15px;" title="Xem chi tiết sản phẩm cần mua"><i class="fa fa-expand" style="margin-right:0px;"> </i> Chi tiết</a>
                                                      
                                                           <a href="addToCart.html?id=${inventory.inventoryId}&name=${inventory.name}&path=${inventory.path}&price=${inventory.gia}&sale=${inventory.sale}&color=${inventory.color}" id="${i.index}" class="btn btn-primary btn-responsive" style="" title="Thêm sản phẩm vào giỏ hàng"><i class="fa fa-shopping-cart" >  </i> Thêm hàng</a>
                                                          
                                                       
                                                          
                                                       </div>
                                                        </center>
                                                  
                                                        
                                                    </div>     
                                        </div>
                                                           
                                                           <script>
                                                                
                                                                $( "#${i.index}" ).click(function( event ) {
                                                                  var gth = $("#slh${i.index}").val();
                       
                                                                  if(gth == 0){
                                                                      
                                                                    alert("Xin lỗi đã hết hàng!");
                                                                     event.preventDefault();
                                                                  }
                                                                  
                                                                  else{
                                                                      
                                                                       if(confirm("Bạn có muốn add vào giỏ hàng??")){
                                                                        var ten="${kh.user}";
                                                                        if(ten===""){
                                                                           alert("Trước tiên bạn cần đăng nhập!");
                                                                           event.preventDefault();
                                                                        }
                                                                       }
                                                                       else{
                                                                           event.preventDefault();
                                                                       }

                                                                  }
                                                                 
                                                                });
                                                            
                                                           </script>  
                                                           
                                    </c:forEach>
                                    
                                           
                            </div>
                            
                            <hr>
            <!--Tao phan trang cac mat hang:-->
            <div class="row" style="text-align:center">
            
            <ul class="pagination" style="float:bottom;" id="pr">
            <li><a href="#"><<</a></li>
            <%
            String sp=(String)request.getAttribute("ms");
            ArrayList<Inventory> list=(ArrayList<Inventory>)request.getAttribute("sp");
            int dem =(Integer)request.getAttribute("dem");
            int a, b;
            int limit =dem/12;
            if (limit*12 < dem) {
            limit += 1;
            }
            for (int i=1;i<=limit; i++) {
            a=(i-1)*12;
            if(a!=0&&a%2!=0){
                a=a+1;
            }
                if("rong".equals(sp)){
                    %>
                    <li id="pr"><a href="trangchu.html?st=<%=a%>&en=12&sx=${gtsx}" id="pr" ><%= i %></a></li>
                    <%
                }
                if("khong rong".equals(sp)){
                    %>
                    <li><a href="trangchu.html?st=<%=a%>&en=12&sx=${gtsx}&sp=${gtsp}" id="pr"><%= i %></a></li>
                    <%
                }
                if("search".equals(sp)){
                    %>
                    <li><a href="trangchu.html?st=<%=a%>&en=12&sx=${gtsx}&mySearch=${sr}" id="pr"><%= i %></a></li>
                    <%
                }
            }
            %>
            <li><a href="#">>></a></li>
            </ul>
            
            <script>
//              Tao su kien click
                var er="${loi}";
                if(er!==""){
                    alert(er);
                }

            </script>
                
            </div>
          </div>
                    
       </div>
        
            
            
                
             
            </div>
            <div class="row">
            <jsp:include page="footer.jsp"></jsp:include>
            </div>
           
                                    <%
                                          //Lay ten dang nhap nguoi dung.
                                          //Neu co nguoi dung dang nhap thi APPEND CAI HTML VO, đặt cái div id="ghh",
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
                                                $('#u').html('<a href="goProfile.html?tk=<%= lv %>" id="tk" class="pull-left" style="margin-left:220px;margin-top:6px;color:red;"> <b name="tv"> <%= lv %></b> <p style="color:black;margin-left:10px;" class="pull-right">||</p></a>');
                                                $('#thoat').html('<a id="dangxuat" class="pull-right btn"><span class="glyphicon glyphicon-log-out"> Đăng xuất</span></a>');
                                                
                                                //ham xu ly khi click vao dang xuat:
                                                
                                                $( '#dangxuat' ).click(function( event ) {
                                                   
                                                            window.location.href="goLogout.html";
                            
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
                                                        html2='<a id="giohang" href="goCart.html?id=${kh.user}" class="btn btn-success pull-right" style="height:38px;width:105px;margin-top:5px;margin-right:5px;padding-top:10px;" title="Giỏ hàng"><i>Giỏ hàng</i> <span class="badge">0</span></a>';
                                                        $('#tgh').append(html2);
                                                        $('#tdk').append(html);
                                                        $('#tdn').append(html1);
//                                                        $( '#giohang' ).click(function( event ) {
//
//                                                             alert("Bạn chưa đăng nhập.");
//
//                                                         });
                                                  </script>
                                                  <%
                                              }
                                           
                                             //Ham gui du lieu dang nhap:
                                             
                                            %>
                                            <script>
                                           
                                            //ham gui du lieu qua Controller dang nhap:
                                           function testThu() {
                                                var user = $('#username').val();
                                                var pass = $('#password').val();
                                                //kiem tra gia tri check:
                                                if($("#ghinho").is(":checked")){
                                                    $.cookie('username',user, { expires: 1 });
                                                    $.cookie('password',pass, { expires: 1 });
                                                    $.cookie('remember',"ok", { expires: 1 });
                                                 }
                                                 else {
                                                    // reset cookies
                                                    $.cookie('username', null);
                                                    $.cookie('password', null);
                                                    $.cookie('remember', null);
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
                                            <%
                                    %>
                               
                                    <script>
//                                      //Ham nhan ve cookie:
                                        var re = $.cookie('remember');
                                        if(re==="ok"){
                                        var ten = $.cookie('username');
                                        var matkhau = $.cookie('password');
                                        
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
<!--            Them mat hang:
            <script>

                var i = 0;
                $(document).ready(function () {

                    $("#sp").click(function () {
                        i = i + 1;
                        var html = '';
                        html += '<div class="col-sm-4" id="sp' + i + '">';
                        html += '<div class="panel panel-success">';
                        html += '<div class="panel-heading"><b>Nokia lumia 620 rẻ mà chất</b><div class="pull-right"><a onclick="xoaa(\'sp' + i + '\')">xoa</a></div></div>';
                        html += '<div class="panel-body" style="height:250">';
                        html += '<img src="<c:url value="img/lumia620.png"></c:url>" class="img-responsive">';
                        html += '</div>';
                        html += '<div class="panel-footer">';
                        html += '<a href="#"> <span class="glyphicon glyphicon-shopping-cart"> <b style="color:blue;font-size:20px;"> Mua hàng ngay!</b> </span></a>';
                        html += '</div>';
                        html += '</div>';
                        html += '</div>';
                        $('#add').append(html);

                    });



                });

                function xoaa(id) {
                    // alert("sdf");
                    $('#' + id).fadeOut();
                }
        </script>-->
    </body>
</html>
