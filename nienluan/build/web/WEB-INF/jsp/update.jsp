<%-- 
    Document   : qlhh
    Created on : Aug 28, 2016, 9:26:09 PM
    Author     : Vo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang cập nhật sản phẩm</title>
        <script src="<c:url value="/resources/js/jquery-2.2.4.min.js"></c:url>"></script>
        <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
        <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
        
    </head>
    <body> 

<div class="container" style="width:99%">
    
    <div class="row">
        <div class="page-header">
            <h2 class="text-muted">Cập nhật dành cho mặt hàng <b style="color:blue">"${invt.name}"</b></h2> 
        </div>
        
    </div>
    
    <div class="row">
         <br>
         <div class="col col-sm-offset-3 col-sm-6" id="update">
            <div class="panel panel-success">
                <div class="panel-heading"><h4 class="text-muted">Cập nhật hàng hóa</h4></div>
                <div class="panel-body">
                    <form class="form-horizontal col-sm-offset-1" role="form" method="post" action="updateInvt.html" id="addForm">
                        <div class="form-group">
                           
                           
                            <input type="hidden" name="invtid" id="invtid" value="${invt.inventoryId}" required/>
                           
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Tên hàng</label>
                            <div class="col-sm-8">
                                <input id="invtname" type="text" name="invtname" value="${invt.name}" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Load ảnh</label>
                            <div class="col-sm-8">
                                <input id="fi" name="fi" type="file" value="${invt.path}" accept="image/*" onchange="loadFile(event)">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Màn hình</label>
                            <div class="col-sm-8">
                                <input id="sreen" type="text" name="sreen" value="${invt.sreen}" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Hệ điều hành</label>
                            <div class="col-sm-8">
                                <input id="hdh" type="text" name="hdh" value="${invt.hdh}" required=""/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">CPU</label>
                            <div class="col-sm-8">
                                <input id="cpu" type="text" name="cpu" value="${invt.cpu}" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Ram</label>
                            <div class="col-sm-8">
                                <input id="ram" type="text" name="ram" value="${invt.ram}" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Camera</label>
                            <div class="col-sm-8">
                                <input id="camera" type="text" name="camera" value="${invt.camera}" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Dung lượng pin</label>
                            <div class="col-sm-8">
                                <input id="pin" type="text" name="pin" value="${invt.pin}" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Màu sắc</label>
                            <div class="col-sm-8">
                                <input id="color" type="text" name="color" value="${invt.color}" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Số lượng nhập kho</label>
                            <div class="col-sm-8">
                                <input id="count" type="text" name="count" value="${invt.count}" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4">Giá bán</label>
                            <div class="col-sm-8">
                                <input id="gia" type="text" name="gia" value="${invt.gia}" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-8">
                                <button class="btn btn-success" type="submit" name="submit" value="add" onclick="return confirm('Bạn có muốn cập nhật ?')">Cập nhật</button>
                                <input type="hidden" id="gt" name="gt">
                            </div>
                        </div>
                            <!--Gia tri nhan dang-->
                            <input name="gd" type="hidden" value="${invt.path}">
                    </form>
                </div>
            </div>
             
            </div>
        <!--Them vao anh trinh chieu-->
        <div class="col-sm-3 pull-right">
            <h3 id="img" class="text-muted">Image Preview</h3>
            
            <img id="output" class="img-responsive img-thumbnail" />  
        </div>
        
    </div>
    
    <div class="row">
        <hr>
        <a href="<%= request.getContextPath() %>" class="btn-sm pull-right">
        <span class="glyphicon glyphicon-home"></span>  Trang chủ
        </a>
                    
        <a href="goQlhh.html" class="btn-sm pull-left">
        <span class="glyphicon glyphicon-chevron-left"></span>  Về trang quản lý hàng hóa
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
    
    <!--Load file truc tiep-->
    <script>
        var reader = new FileReader();
        $("#img").fadeIn();
        $("#output").fadeIn();
        $("#output").attr('src','img/${invt.path}');
    </script>
    
    </body>
</html>
