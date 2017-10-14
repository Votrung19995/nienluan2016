<%-- 
    Document   : qlhh
    Created on : Aug 28, 2016, 9:26:09 PM
    Author     : Vo
--%>

<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>Trang quản lý hàng hóa</title>
        <script src="<c:url value="/resources/js/jquery-2.2.4.min.js"></c:url>"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
        <!--The vao table-->
        <link rel="stylesheet" href="<c:url value="/resources/css/dataTables.bootstrap.min.css"></c:url>">
        
        <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
        <script src="<c:url value="/resources/js/jquery.dataTables.min.js"></c:url>"></script>
        <script src="<c:url value="/resources/js/dataTables.bootstrap.min.js"></c:url>"></script>
        
        <style>
            
            .dataTables_filter{
                margin-left:6px;
            }
            .dataTables_paginate {
                margin-right:30px;
            }
            .troi{
                position:fixed;
                z-index:620;
            }
            .sd{
                box-shadow: 0px 2px 2px 1px rgba(0, 0, 0, 0.1), 2px 0px 10px 2px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body> 
<!--        <div class="container">
	<div class="row">
	   <div class="col-lg-6">
               <form class="form-horizontal" action="addInventory.html" method="post">
			<div class="form-group">
				<label class=" control-label col-sm-4">Tên mặt hàng</label>
                                <div class="col-sm-4"><input type="text" name="name" class="form-control"></div>
			</div>

			<div class="form-group">
			        <label class="label control-label col-sm-4">Mời chọn hình</label>
                                <div class="col-sm-4"><input id="fi" name="fi" type="file" accept="image/*" onchange="loadFile(event)"></div>
				
			</div>
                        <div class="form-group">
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4"><button type="submit">OK</button></div>
                            <input type="hidden" id="gt" name="gt">
			</div>

		</form>
	</div>

		<div class="col-lg-4">
			 <img id="output" class="img-responsive img-thumbnail" />
		</div>
	</div>
	
        <script>
        $("#output").fadeOut();
        var loadFile = function(event) {
        var reader = new FileReader();
        reader.onload = function(){
          $("#output").fadeIn();
          var output = document.getElementById('output');
          output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
        var filename = $('#fi').val().replace(/.*(\/|\\)/, '');
        $("#gt").val(filename);
        };
    </script>
        </div>-->
<div class="container" style="width:97%">
    
    
                        
    <div class="row">
                
                <div class="row">
                    <hr>
                    
                    <div class="col-xs-8 pull-left">
                        
                    <div class="row" style="margin-top:8px;">  
                        <p style="margin-left:5px;" class="pull-left"><a href="<%= request.getContextPath() %>">Trang chủ</a></p>
                        <p  style="margin-left:10px;color:blue" class="pull-left">></p>
                        <p style="margin-left:10px;" class="pull-left"><a href="goQuanly.html?tk=${tk.user}">quản lý</a></p>
                         <p  style="margin-left:10px;color:blue" class="pull-left">></p>
                        <p style="margin-left:10px;" class="pull-left"><a href="goQlhh.html">quản lý hàng hóa</a></p>
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
                        
                <div class="row">
                    <hr>
                    
<!--                  <div class="col-xs-3 pull-right">

                             <form role="search" style="width:300px;margin-top:20px;" action="goQlhh.html" method="get">
                                <div class="input-group" style="margin-right:30px;">
                                <input type="text" class="form-control" id="mySearch"  placeholder="Tìm nhanh..." name="mySearch" style="height:34px;border-radius:0px;border-color:green;">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" style="border-color:green;border-radius:0px" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                                </div>
                                </div>
                                <div class="cs" style="border-radius:0px;height:60px;overflow:auto"id="ht">

                                </div>
                             </form>
                  </div>-->
   
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
         
        
        <div class="row sd" style="padding:30px;display:none" id="in">  
        <h2  class="text-muted" style="text-align:center;color: white;
                    text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;">Các mặt hàng đã thêm</h2> 
         
        <div class="row">
           
        <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%" style="padding-right:5px;padding-left:5px;">
            <thead>
                <tr class="info">
                    <th>Mã hàng</th>
                    <th>Tên hàng</th>
                    <th>Màn hình</th>
                    <th>HĐH</th>
                    <th>CPU</th>
                    <th>Ram</th>
                    <th>Camera</th>
                    <th>Pin</th>
                    <th>Màu</th>
                    <th>Còn lại</th>
                    <th>Giá bán</th>
                    <th>Cập nhật</th>
                    <th>Xóa</th>
                </tr>
            </thead> 
            <tbody>
                <c:forEach items="${list}" var="invt">
                    <tr>
                        <td><c:out value="${invt.inventoryId}"/></td>
                        <td><c:out value="${invt.name}"/></td>
                        <td><c:out value="${invt.sreen}"/></td>
                        <td><c:out value="${invt.hdh}"/></td>
                        <td><c:out value="${invt.cpu}"/></td>
                        <td><c:out value="${invt.ram}"/></td>
                        <td><c:out value="${invt.camera}"/></td>
                        <td><c:out value="${invt.pin}"/></td>
                        <td><c:out value="${invt.color}"/></td>
                        <td><c:out value="${invt.count}"/></td>
                        <td><c:out value="${invt.gia}"/></td>
                        
                        <td>
                            <a class="btn btn-warning" href="goUpdate.html?id=${invt.inventoryId}"><span class="glyphicon glyphicon-pencil"></span></a>
                        </td>
                        <td>
                            <a class="btn btn-danger" href="goDelete.html?id=${invt.inventoryId}" onclick="return confirm('Bạn có chắc muốn xóa: ${invt.name} ?')"><span class="glyphicon glyphicon-remove"></span></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
            
            </table>
        </div>
    
        <script>
               $(document).ready(function() {
               $('#example').DataTable();
               $("#in").fadeIn(1500);
        } );
        </script>
        
    <div class="row">
        <button type="button" class="btn btn-success center-block" data-toggle="collapse" data-target="#update"><span class="glyphicon glyphicon-plus"></span>Thêm mặt hàng</button>
        <br>
         <div class="col col-sm-offset-3 col-sm-6 collapse" id="update">
            <div class="panel panel-info">
                <div class="panel-heading"><h4 class="text-muted">Thêm hàng hóa</h4></div>
                <div class="panel-body">
                    <form class="form-horizontal col-sm-offset-1" role="form" method="post" action="addInventory.html" id="addForm">
                        <div class="form-group">
                            <label class="control-label col-sm-4">Mã hàng</label>
                            <div class="col-sm-8">
                                <input type="text" name="invtid" id="invtid" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Tên hàng</label>
                            <div class="col-sm-8">
                                <input id="invtname" type="text" name="invtname" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Load ảnh</label>
                            <div class="col-sm-8">
                                <input id="fi" name="fi" type="file" accept="image/*" onchange="loadFile(event)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Màn hình</label>
                            <div class="col-sm-8">
                                <input id="sreen" type="text" name="sreen" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Hệ điều hành</label>
                            <div class="col-sm-8">
                                <input id="hdh" type="text" name="hdh" required=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">CPU</label>
                            <div class="col-sm-8">
                                <input id="cpu" type="text" name="cpu" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Ram</label>
                            <div class="col-sm-8">
                                <input id="ram" type="text" name="ram" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Camera</label>
                            <div class="col-sm-8">
                                <input id="camera" type="text" name="camera" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Dung lượng pin</label>
                            <div class="col-sm-8">
                                <input id="pin" type="text" name="pin" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Màu sắc</label>
                            <div class="col-sm-8">
                                <input id="color" type="text" name="color" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Số lượng nhập kho</label>
                            <div class="col-sm-8">
                                <input id="count" type="text" name="count" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Giá bán</label>
                            <div class="col-sm-8">
                                <input id="gia" type="text" name="gia" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <button class="btn btn-info" type="submit" name="submit" value="add">Thêm</button>
                                <input type="hidden" id="gt" name="gt">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
             
            </div>
        
            <script>
            //Ham tim id trung:
             //ham gui json qua:
            $('#invtid').change(
                    function(){
                    $.ajax({
                    type:"post",
                    url:"goKTinvt.html",
                    data:{
                        invtid:$(this).val()
                    },
                    success: function (data) { 
                        if(data==="1")
                        {
                        alert("Đã tồn tại Mã mặt hàng!");
                        $('#invtid').val('');
                        }
                    }
                }); 
                  
                    });
            </script>
        <!--Them vao anh trinh chieu-->
        <div class="col-sm-3 pull-right">
            <h3 id="img">Image Preview</h3>
          <img id="output" class="img-responsive img-thumbnail" />  
        </div>
        
    </div>
    </div>
                   
    <div class="row">
        <hr>
        <a href="<%= request.getContextPath() %>" class="btn-sm pull-right">
        <span class="glyphicon glyphicon-home"></span>  Trang chủ
        </a>
                    
        <a href="goQuanly.html?tk=${tk.user}" class="btn-sm pull-left">
        <span class="glyphicon glyphicon-chevron-left"></span>  Về trang quản lý
        </a>
    </div>
</div>
     <!--javasript-->
     <script>
        $("#img").hide();
        $("#output").fadeOut();
        var loadFile = function(event) {
        var reader = new FileReader();
        reader.onload = function(){
          $("#img").fadeIn();
          $("#output").fadeIn();
          var output = document.getElementById('output');
          output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
        var filename = $('#fi').val().replace(/.*(\/|\\)/, '');
        $("#gt").val(filename);
        };
    </script>
</div>
    </body>
</html>
