/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Vo
 */
import dao.*;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
import model.*;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
@RequestMapping(value = "/")
public class KhController {
   //Ham update form:
   @RequestMapping(value = "/goUpdateKh",method = RequestMethod.POST)
   public String goUpdateKh(HttpServletRequest request,ModelMap mm){
       String tk=request.getParameter("tk");
       KhDao kd=new KhDao();
       //tim kiem TK co user:
       Kh kh=new Kh(kd.find(tk));
       //Gui qua cac gia tri:
       String name=request.getParameter("name");
       String phone=request.getParameter("phone");
       String address=request.getParameter("address");
       String note=request.getParameter("note");
       
       
           
           //dua vao cac gia tri:
            if(name!=""){
                kh.setName(name);
            }
            if(address!=""){
               kh.setAddress(address);
            }
            if(phone!=""){
               kh.setPhone(phone);
            }
            if(note!=""){
               kh.setNote(note);
            }
            
            //
            if(kd.updateCust(kh)){
                 mm.put("ms","Ukhtc");
                 mm.put("kh",kd.find(tk));
                 }
                 else{
                     mm.put("ms","Ukhtb");
                     mm.put("kh",kd.find(tk));
                 }
            
       
       return "flash";
   }
      //Ham dang nhap;
    @RequestMapping(value = "/goDN",method = RequestMethod.POST)
    public @ResponseBody String goDN(@RequestParam String user,@RequestParam String pass,HttpServletRequest request,ModelMap mm,HttpSession session) throws SQLException{
        int kt=0;
        String username=user;
        String password=pass;
        //Tao class ket noi csdl:
        ConectJDBC cjdbc=new ConectJDBC();
        String tv=null;
        String ten=null;
        //Khai bao KH dao:
        KhDao kd=new KhDao();
        if(cjdbc.Kn()){
        //Truy van tu co so du lieu:
                String sql="select user,password from Kh where user = ? and password = ?";
                cjdbc.ps=cjdbc.cnn.prepareStatement(sql);
                cjdbc.ps.setString(1,username);
                cjdbc.ps.setString(2,password);
                cjdbc.rs=cjdbc.ps.executeQuery();
                while(cjdbc.rs.next()){
                    kt=1;
                    ten=cjdbc.rs.getString("user");
                }
                if(kt!=0){
                  if(ten!=null){
                      if("admin".equals(ten)){
                         session.setAttribute("ten",kd.find(ten).getUser());
                         tv="1";
                      }
                      else{
                          session.setAttribute("ten",kd.find(ten).getUser());
                          tv="2";
                      }
                  }
                  
                }
                else{
                  tv="0";
                }

        }
        else{
            mm.put("ms","Ket noi csdl that bai!");
        }
        cjdbc.closeConect();
        return tv;
    }
    
    //Ham dang ky thanh vien
    @RequestMapping(value = "/goDK",method = RequestMethod.POST)
    public String goDK(HttpServletRequest request,ModelMap mm){
        String user=request.getParameter("user");
        String password=request.getParameter("password");
        String repassword=request.getParameter("repassword");
        String name=request.getParameter("name");
        String phone=request.getParameter("phone");
        String address=request.getParameter("address");
        String gioitinh=request.getParameter("gt");
        //Khai bao lop Dao:
        KhDao kd=new KhDao();
        Kh k=new Kh(user, password, repassword, name,phone,address, gioitinh,"","");
        try{
            kd.addCust(k);
            mm.put("ms","dk");
        }
        catch(Exception e){
            mm.put("ms","tb");
        }
        //
        
        return "flash";
    }

    //Ham quan ly cua Admin:
    @RequestMapping(value = "/goQuanly",method = RequestMethod.GET)
    public String goQuanLy(ModelMap mm,HttpSession session){
        String rs=(String)session.getAttribute("ten");
        if(rs!=null){
        KhDao kd=new KhDao();
        mm.put("tk",kd.find(rs));
        }
        return "admin";
    }
   //Ham logout:
    @RequestMapping(value = "/goLogout",method = RequestMethod.GET)
    public String goLogout(HttpServletRequest request,ModelMap mm){
        String de=request.getParameter("de");
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        HttpSession session=request.getSession(false);
        session.invalidate();
        if(de!=null){
             mm.put("ms","de");
             mm.put("id",id);
             mm.put("name",name);
        }
        else{
             mm.put("ms","lo");
        }
        return "flash";
    }
//       @RequestMapping(value = "/toAjax",method = RequestMethod.POST)
//   //ham get Ajax:
//   public  @ResponseBody String toAjax(@RequestParam String id,ModelMap mm,HttpServletRequest request) throws JsonProcessingException {
//        ObjectMapper objectMapper=new ObjectMapper();
//        AdDao adDao=new AdDao();
//        Integer i=Integer.parseInt(id);
//        Ad ad=new Ad();        ad=adDao.find(id);
//        String json=objectMapper.writeValueAsString(ad);
//        return json;   }
    
    //Ham dk:
    @RequestMapping(value = "/Dangky",method = RequestMethod.GET)
    public String Dangky(){
        return "trangDk";
    }
    //
    @RequestMapping(value = "/goKTuser",method = RequestMethod.POST)
    //Ham kiem tra id mat hang:
    public @ResponseBody String goKTinvt(@RequestParam String userid,ModelMap mm){
        KhDao kd=new KhDao();
        Kh kh=new Kh();
        kh=kd.find(userid);
        String kq="";
        if(kh!=null){
            kq="1";
        }
        else{
            kq="0";
        }
        return kq;
    }
}
