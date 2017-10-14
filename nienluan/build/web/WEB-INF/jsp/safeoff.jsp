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
        <title>Trang Tin Tức - Giảm Giá</title>
        <script src="<c:url value="/resources/js/jquery-2.2.4.min.js"></c:url>"></script>
        
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
        
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
         <!--Them vao cac custom footer:-->
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/css/demo.css"></c:url>">
        <link rel="stylesheet" href="<c:url value="/resources/css/footer-distributed.css"></c:url>">
        
        <script src="//cdn.ckeditor.com/4.5.11/full/ckeditor.js"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
       
        <!--Them hieu ung khi click vao hinh anh:-->
        <style>
            p{
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
    <body>
    <div class="container" style="width:99%">
         
       
       
        <div class="row">
                    <hr>   
                    <div class="col-xs-8 pull-left">
                        
                    <div class="row" style="margin-top:8px;">  
                        <p style="margin-left:2px;" class="pull-left"><a href="<%= request.getContextPath() %>">Trang chủ</a></p>
                        <p  style="margin-left:10px;color:blue" class="pull-left">></p>
                        <p style="margin-left:10px;" class="pull-left"><a href="goQuanly.html?tk=${tk.user}">quản lý</a></p>
                         <p  style="margin-left:10px;color:blue" class="pull-left">></p>
                        <p style="margin-left:10px;" class="pull-left"><a href="goSafeOff.html">quản lý tin tức - giảm giá</a></p>
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
      
        
      
            <!--Xu ly dang nhap:-->
            
             <%
                                          //Lay ten ang nhap nguoi dung.
                                           String lv=(String)session.getAttribute("ten");
                                           if(lv!=null){
                                           %>
                                           <script>
                                                
                                                
                                                $('#user').show();
                                                $('#log').show();
                                                $('#g').show();
                                                $('#tc').html('<a class="pull-left" href="<%= request.getContextPath() %>"><b>Trang chủ<b style="color:black;margin-left:5px;" >></b><b></a>');
                                                $('#ql').html('<a class="pull-left" href="goQuanly.html"><b style="margin-right:20px;">quản lý</b></a>');
                                                $('#thoat').html('<a id="dangxuat" class="pull-right btn"><span class="glyphicon glyphicon-log-out"> Đăng xuất</span></a>');
                                                $('#u').html('<a href="goProfile.html?tk=<%= lv %>" id="tk" class="pull-left" style="margin-left:220px;margin-top:6px;color:red;"> <b name="tv"> <%= lv %></b> <p style="color:black;margin-left:10px;" class="pull-right">||</p></a>');
                                                $('#thoat').html('<a id="dangxuat" class="pull-right btn"><span class="glyphicon glyphicon-log-out"> Đăng xuất</span></a>');
                                                //ham xu ly khi click vao dang xuat:
                                                
                                                $( '#dangxuat' ).click(function( event ) {
                                                   
                                                            window.location.href="goLogout.html";
                            
                                                 });
                              
                                           </script>
                                           <% }
                                           
                                        
                   %>
                   
        <div class="row" style="height:1020px;">
        <hr> 
        
        <div class="row">
            <div class="col-xs-3">
                <div class="list-group">
                <a href="#" class="list-group-item active disabled" style="text-align:center">Chọn chức năng</a>
                <a href="#menu" data-toggle="tab" class="list-group-item text-muted"><i class="fa fa-cc-visa" style="font-size:20px;"></i>  Giảm giá các mặt hàng</a>
                <a href="#menu1" data-toggle="tab" class="list-group-item text-muted"><i class="fa fa-audio-description" style="font-size:20px;"></i>   Đăng tin tức các mặt hàng</a>
                </div>
            </div>
            <div class="col-xs-1"></div>
            <!--Them vao các tab chuc nang-->
            <div class="col-xs-8">
                <div  class="row ">
                    <div id="menu" class="row tab-pane fade in active sd" style="padding:20px;width:880px;">
                        
                        <div class="row">
                            <div class="col-xs-4">
                            <h4 class="text-muted">Vui lòng chọn mặt hàng giảm giá</h4>
                            </div>
                            <div class="col-xs-4">
                                <select style="width:320px;height:36px;">
                                    <c:forEach items="${inventory}" var="mh">
                                        <option value="${mh.inventoryId}">${mh.name}</option>
                                    </c:forEach>
                                </select>
                                <input id="dh" type="hidden">
                            </div>
                            <!--lay su kien click vao button-->
                            <script>
                               var i=0;
                               function addMH(){
                                    var sl=$("select").val();
                                    i++;
                                    //
                                    //Lay gia tri gui lại:
                                    var html='';
                                    html+='<tr>';
                                    html+='<td>';
                                    html+='<input type="text" id="InvtID'+i+'" name="InvtID'+i+'" placeholder="Mã hàng"class="form-control">';
                                    html+='</td>';
                                    html+='<td>';
                                    html+='<input type="text" id="InvtName'+i+'" name="InvtName'+i+'" placeholder="Tên hàng"class="form-control">';
                                    html+='</td>';
                                   
                                    
                                    html+='<td>';
                                    html+='<input type="text" id="sale'+i+'" name="sale'+i+'" placeholder="Giảm giá"class="form-control">';
                                    html+='</td>';
                                    html+='</tr>';
                                    $('#hienthi').append(html);
                                    //
                                    $("#gt").val(i);
                                    //Gui Ajax qua controller:
                                    $.ajax({
                                    type : "post",
                                    url : "getAjax.html",
                                    data:{
                                        name:sl
                                    },
                                    success : function(response) {

                                   //Nhan gia tri tra ve khi ket qua la dung:
                                    var ob = $.parseJSON(response);
                                    var invtId=ob.inventoryId;
                                    var invtName=ob.name;
                                    
                                     //set vao cac truong:
                                     $('#InvtID'+i+'').val(invtId);
                                     $('#InvtName'+i+'').val(invtName);
                                     $('#dh').val("ok");
                                  }
                    
                                  });
                               }
                            </script>
                            
                            <div class="col-xs-1"></div>
                            <div class="col-xs-3">
                                <a class="btn btn-warning pull-left" onclick="addMH()">+ Thêm mặt hàng</a>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <h4 class="text-muted" style="color:green;margin-left:15px;">Các mặt hàng được thêm</h4>
                            <form action="addSale.html" method="post" id="gg">
                            <table class="table table-bordered" style="width:89%;margin-left:15px;">
                            <thead>
                                <tr class="info" style="text-align:center">
                                <th><label class="text-muted">Mã mặt hàng</label></th>
                                <th><label class="text-muted">Tên mặt hàng</label></th>
                                <th><label class="text-muted">Giảm giá (%)</label></th>
                                </tr>
                           </thead>
               
                            <tbody id="hienthi">
                            </tbody>
              
                           </table>
                            
                                <button type="button" class="btn btn-success" style="margin-left:15px;" onclick="guiform()">Giảm giá</button>
                                <input id="gt" name="gt" type="hidden">
                            </form>
                            
                            <script>
                                function guiform(){
                                    var gt=$("#dh").val();
                                    var cf=confirm('Bạn muốn giảm giá các mặt hàng này?');
                                    if(cf){
                                        if(gt!=="ok"){
                                            alert('Bạn chưa thêm mặt hàng');
                                        }
                                        else{
                                            $("#gg").submit();
                                    }
                                }
                            }
                            </script>
                        </div>

                    </div>
                    
                    <div id="menu1" class="row tab-pane fade">
                        <div class="row  sd" style="padding:30px;width:890px;">
                            <h3 class="text-muted" style="text-align:center">Đăng tin tức - giảm giá</h3>
                            
                            <form action="adAd.html" method="post">
                                
                            <div class="form-group">
                              <label for="head" class="text-muted">Tiêu đề</label>
                              <input type="text" class="form-control" id="head" name="head" style="height:40px;border-radius:0px;" required>
                            </div>
                                
                            <div class="form-group">
                              <label for="tomtat" class="text-muted">Tóm tắt</label>
                              <input type="text" class="form-control" id="tomtat" name="tomtat" style="height:40px;border-radius:0px;" required>
                            </div>
                                
                            <div class="form-group">
                               <label for="tomtat" class="text-muted">Nội dung</label>
                               <textarea name="noidung" id="noidung" rows="10" cols="80">
                              
                               </textarea>
                            </div>
                            <div class="form-group">
                                <label for="tomtat" class="text-muted">Upload ảnh</label>
                                <input id="fi" name="fi" type="file" accept="image/*" onchange="xngt()">
                                <input type="hidden" id="path" name="path" required>
                            </div>
                                <button type="submit" id="bt" class="btn btn-primary" onclick="return confirm('Bạn muốn đăng tin ?')">Đăng tin</button>
                           <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'noidung' );
                           </script>
                           </form>
                            
                        </div>
                        <script>
                                 CKEDITOR.replace( '#ct' );
                        </script>
                        <div class="row" style="padding-left:30px;">
                            <h4 class="text-muted"><span class="glyphicon glyphicon-list"></span> Danh sách các tin đã đăng</h4>
                            <c:forEach items="${tin}" var="t">
                                <ul>
                                    <li>
                                        <a><i class="fa fa-chain"></i> ${t.tieude}<input value="1" type="hidden"></a><a title="xóa tin tức" href="delAd.html?id=${t.id}" class="btn" style="color:red" onclick="return  confirm('Bạn có chắc muốn xóa tin này?')"><span class="glyphicon glyphicon-remove"></span></a>
                                    </li>
                                </ul>
                               
                            </c:forEach>
                        </div>
                        
                        <script>
                            function xngt(){
                                 var filename = $('#fi').val().replace(/.*(\/|\\)/, '');
                                 $("#path").val(filename);
                            }
                            
                            
                        </script>
                       
                    </div>
                </div>
                
   
                
            </div>
            
        </div>
        
        </div>
                  
       <div class="row">
        <hr><hr>    
        <a href="<%= request.getContextPath() %>" class="btn-sm pull-right">
        <span class="glyphicon glyphicon-home"></span>  Trang chủ
        </a>
                    
        <a href="goQuanly.html" class="btn-sm pull-left">
        <span class="glyphicon glyphicon-chevron-left"></span>  Về trang quản lý
        </a>
       </div>
        
   
    
    </div>
     </body>
</html>
