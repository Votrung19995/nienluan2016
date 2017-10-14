/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import model.*;
import dao.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Vo
 */
@Controller
@RequestMapping(value = "/")
public class ManagerController {
    @RequestMapping(value = "/trangchu")
    public String goIndex(ModelMap mm,HttpServletRequest request,HttpSession session){
        AdDao adDao=new AdDao();
        String rs=(String)session.getAttribute("ten");
        if(rs!=null){
        KhDao kd=new KhDao();
        mm.put("kh",kd.find(rs));
        }
        //nhan gia tri tu bien san pham:
        String gtsp=(String)request.getParameter("sp");
        String sr=request.getParameter("mySearch");
        //
        String gtsx=request.getParameter("sx");
        int st=Integer.parseInt(request.getParameter("st"));
        int en=Integer.parseInt(request.getParameter("en"));
        InventorDao inventorDao=new InventorDao();
        List<Inventory> list=new ArrayList<Inventory>();
        //neu gtsp ma rong thi thuc hien dua tat ca list len,nguoc lai la ton tai gia tri thi thuc hien thao San pham:
        
        if(gtsp==null){
        //dua danh sach mat dinh la 12 san pham len trang chu:
        list=inventorDao.listInventory(st,en,gtsx);
        mm.put("sp",list);
        //lay gia tri size ve:
        int dem=inventorDao.getSize();
        mm.addAttribute("dem", dem);
        mm.put("gtsx",gtsx);
        mm.put("gtsp",gtsp);
        //gui gia tri ms qua cho jsp biet:
        mm.put("ms","rong");
        
        //cap nhat danh sach cac tin tuc:
        
        }
        else{
        //dua danh sach mat dinh la 12 san pham len trang chu theo san pham
        list=inventorDao.listSP(st, en, gtsx,gtsp);
        mm.put("sp",list);
        //lay gia tri size ve:
        mm.addAttribute("dem",list.size());
        mm.put("gtsx",gtsx);
        mm.put("gtsp",gtsp);
        //gui gia tri ms qua cho jsp biet:
        mm.put("ms","khong rong");
        
        }
        //tim kiem theo search:
        if(sr!=null){
            
        list=inventorDao.listSearch(st, en, gtsx,sr);
        mm.put("sp",list);
        //lay gia tri size ve:
        mm.addAttribute("dem",list.size());
        mm.put("gtsx",gtsx);
        
        mm.put("sr",sr);
        //gui gia tri ms qua cho jsp biet:
        mm.put("ms","search");
        
        }
        mm.put("ad",adDao.listAd());
        //
        mm.put("d",adDao.listAd().size());
//        //set vao gio hang:
//        ArrayList<Integer> list1=new ArrayList<Integer>();
//        session=request.getSession();
//        session.setAttribute("gio", list1);
//        mm.put("gio", list1.size());
        return "nienluan";
    }
    //ham dan toi trang Profile User:
    @RequestMapping(value = "/goProfile",method = RequestMethod.GET)
    public String goProfile(HttpServletRequest request,ModelMap mm,HttpSession session){
        //
        String rs=(String)session.getAttribute("ten");
        if(rs!=null){
        KhDao kd=new KhDao();
        mm.put("kh",kd.find(rs));
        }
        //lay gt kiem tra ve:
        String ck=request.getParameter("gt");
        if(ck!=null&&ck!=""){
            String user=request.getParameter("tk");
            String path = ck;
            //tim doi tuong kh co id:
            KhDao kd=new KhDao();
            Kh k=new Kh(kd.find(user));
            k.setPath(path);
            //sao do upadte mat hang
            if(kd.updateCust(k)){
                mm.put("tv",k);
            }
        }
        else{
             //tim kiem user khi truy van
            String tk=request.getParameter("tk");
            //truy van tim doi tuong tron CSDL:
            KhDao kd=new KhDao();
            Kh kh=new Kh(kd.find(tk));
            mm.put("tv",kh);
        
        }
        String user=request.getParameter("tk");
        //Dua tin nhan len:
        ContactDao cd=new ContactDao();
        mm.put("sotn",cd.list(user).size());
        return "profile";
    }
    
    //Ham toi trang lien he:
    @RequestMapping(value = "goLH",method = RequestMethod.GET)
    public String goLH(HttpServletRequest request,ModelMap mm,HttpSession session){
         //tim kiem user khi truy van
        try{
        String tk=request.getParameter("tk");
        //truy van tim doi tuong tron CSDL:
        KhDao kd=new KhDao();
        Kh kh=new Kh(kd.find(tk));
        mm.put("ten",tk);
        }
        catch(Exception e){
            mm.put("tv","loi lay ten!");
        }
         //Lay giai tri Sesion.
        String rs=(String)session.getAttribute("ten");
        if(rs!=null){
            KhDao kd=new KhDao();
            mm.put("kh",kd.find(rs));
        }
        return "contact";
    }
    @RequestMapping(value = "loi",method = RequestMethod.GET)
    public String loi(){
        return "error";
    }
}
