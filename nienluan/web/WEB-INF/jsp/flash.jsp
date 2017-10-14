<%-- 
    Document   : flash
    Created on : Aug 27, 2016, 9:21:48 PM
    Author     : Vo
--%>

<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page Flash</title>
    </head>
    <body>
        <script>
            var lv="${ms}";
            setTimeout(function (){
                
               if(lv==="lh") {
                   alert("Cám ơn bạn đã phản hồi cho chúng tôi.");
                   window.location.href="goLH.html";
               }
               
               if(lv==="lo") {
                   alert("Đã đăng xuất!");
                   window.location.href="<%= request.getContextPath() %>";
               }
               
               if(lv==="dk"){
                   alert("Bạn đã đăng ký thành công!\n\
                   Quay về đăng nhập.");
                   window.location.href="<%= request.getContextPath() %>";
               }
               
               if(lv==="tb"){
                   alert("Đăng ký thất bại.");
                   window.location.href="<%= request.getContextPath() %>";
               }
               if(lv==="tc"){
                   alert("Thêm mặt hàng thành công!");
                   window.location.href="goQlhh.html";
               }
               if(lv==="thatbai"){
                   alert("Thêm thất bại!");
                   window.location.href="goQlhh.html";
               }
               if(lv==="Utc"){
                   alert("Update mặt hàng thành công!");
                   window.location.href="goQlhh.html";
               }
               if(lv==="Utb"){
                   alert("Update không thành công!");
                   window.location.href="goQlhh.html";
               }
               if(lv==="Dtc"){
                   alert("Xóa mặt hàng thành công!");
                   window.location.href="goQlhh.html";
               }
               if(lv==="Dtb"){
                   alert("Xóa không thành công!");
                   window.location.href="goQlhh.html";
               }
               if(lv==="Ukhtc"){
                    alert("Cập nhật thông tin thành công!");
                    window.location.href="goProfile.html?tk=${kh.user}";
               }
               if(lv==="Ukhtb"){
                    alert("Cập nhật thất bại!");
                    window.location.href="goProfile.html?tk=${kh.user}";
               }
               if(lv==="de"){
                    alert("Đã đăng xuất!");
                    window.location.href="goDetailInventory.html?id=${id}&name=${name}";
               }
               if(lv==="stc"){
                    alert("Giảm giá thành công!");
                    window.location.href="goSafeOff.html";
               }
               if(lv==="stb"){
                    alert("Giảm giá that bai!");
                    window.location.href="goSafeOff.html";
               }
               if(lv==="adtc"){
                    alert("Đã đăng tin");
                    window.location.href="goSafeOff.html";
               }
               if(lv==="adtb"){
                    alert("Lỗi đăng tin");
                    window.location.href="goSafeOff.html";
               }
               if(lv==="gtc"){
                    alert("Add thanh cong");
                    window.location.href="<%= request.getContextPath() %>";
               }
               if(lv==="adxtc"){
                    alert("Xóa tin thành công!");
                    window.location.href="goSafeOff.html";
               }
               if(lv==="adxtb"){
                   alert("Xóa tin thất bại!");
                   window.location.href="goSafeOff.html";
               }
               if(lv==="cttc"){
                   alert("Chúng tôi đã nhận phản hồi!");
                   window.location.href="goLH.html?tk=${t}";
               }
               if(lv==="cttb"){
                   alert("Chưa nhận được phản hồi!");
                   window.location.href="goLH.html?tk=${t}";
               }
               
               if(lv==="go"){
                   window.location.href="goDetailInventory.html?id=${id}&name=${name}";
               }
                if(lv==="upc"){
                   window.location.href="goCart.html?id=${id}";
               }
                if(lv==="purt"){
                   window.location.href="goCart.html?id=${puru}";
               }
                if(lv==="fbok"){
                   window.location.href="goFeeback.html?tk=${tk}";
               }
               
               if(lv==="duyet"){
                   window.location.href="gopurchaseManager.html?tk=${tk}";
               }
               
               if(lv==="give"){
                   window.location.href="goPurchaseHistory.html?tk=${tk}";
               }
            },1000);
        </script>
    </body>
</html>
