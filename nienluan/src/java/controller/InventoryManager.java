/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dao.*;
import java.io.IOException;
import java.io.StringWriter;
import java.math.BigDecimal;
import model.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Inventory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import email.*;
import java.io.UnsupportedEncodingException;
/**
 *
 * @author Vo
 */
@Controller
@RequestMapping(value = "/")
public class InventoryManager {
     
    //Ham quan ly cac mat hang:
    @RequestMapping(value = "/goQlhh",method = RequestMethod.GET)
    public  String goQlhh(ModelMap mm,HttpServletRequest request,HttpSession session){
       //String sr=request.getParameter("mySearch");
        InventorDao inventorDao=new InventorDao();
        List<Inventory> list=new ArrayList<Inventory>();
        //Lay giatri ten:
        String name=(String)session.getAttribute("ten");
        //Tim kiem phan tu:
        KhDao khDao=new KhDao();
        Kh kh=new Kh();
        kh=khDao.find(name);
        mm.put("tk",kh);
        //dua vao list hang hoa:
        list=inventorDao.list();
        mm.put("list", list);
        return "qlhh";
    }
    //Ham add mat hàng san pham:
    @RequestMapping(value = "/addInventory",method = RequestMethod.POST)
    public String addInventory(HttpServletRequest request,ModelMap mm){ 
       
        //Lay gia tri ve:
        String invtId=String.valueOf(request.getParameter("invtid"));
        String invtname=String.valueOf(request.getParameter("invtname"));
        String path=String.valueOf(request.getParameter("gt"));
        String sreen=String.valueOf(request.getParameter("sreen"));
        String hdh=String.valueOf(request.getParameter("hdh"));
        String cpu=String.valueOf(request.getParameter("cpu"));
        String ram=String.valueOf(request.getParameter("ram"));
        String camera=String.valueOf(request.getParameter("camera"));
        String pin=String.valueOf(request.getParameter("pin"));
        long gia=Long.parseLong(request.getParameter("gia"));
        int count=Integer.parseInt(request.getParameter("count"));
        String color=String.valueOf(request.getParameter("color"));
        InventorDao inventorDao=new InventorDao();
        Inventory inventory=new Inventory(invtId,invtname, path, sreen, hdh, cpu, ram, camera, pin, gia,count,color);
        if(inventorDao.addInventor(inventory)){
            mm.put("ms","tc");
        }
        else{
        mm.put("ms","thatbai");
        }
        return "flash";
    }
    @RequestMapping(value = "/goDetailInventory",method = RequestMethod.GET)
    //Ham xem chi tiet hang hoa mua hang:
    public String goDetailInventory(HttpServletRequest request,ModelMap mm,HttpSession session){
         //Lay giai tri Sesion.
        String rs=(String)session.getAttribute("ten");
        if(rs!=null){
            KhDao kd=new KhDao();
            mm.put("kh",kd.find(rs));
        }
        //
        String re=request.getParameter("id");
        String name=request.getParameter("name");
        //tim doi tuong co name:
        InventorDao inventorDao=new InventorDao();
        mm.put("invt",inventorDao.find(re));
        mm.put("id", re);
        //lay danh sách cac doi tuong list ve:
        InventorDao iDa=new InventorDao();
        mm.put("sp",iDa.listID(re));
        
        //gui qua View binh luan ve san pham:
        CommentDao cd=new CommentDao();
        mm.put("cm",cd.listCommet(re));
        //Put gia tri:
        mm.put("count",cd.listCommet(re).size());
        return "detailInventory";
    }
    
    @RequestMapping(value = "/test",method = RequestMethod.POST)
    public @ResponseBody String myTest(@RequestParam String gt){
        return gt;
    }
    //Ham tim kiem ket qua gui qua theo ben Ajax:
    @RequestMapping(value = "getSearch",method = RequestMethod.POST)
    public @ResponseBody String getSearchAjax(@RequestParam  String gt,ModelMap mm) throws JsonProcessingException{
//        thuc hien tim kiem list:
       InventorDao id=new InventorDao();
       List<Inventory> list=new ArrayList<Inventory>();
       if(gt.length()==0||gt==null) {
           return "";
       }
       else{
            list=id.listAjax(gt);
            StringWriter sw =new StringWriter();     
            ObjectMapper mapper = new ObjectMapper();
            String json =  mapper.writeValueAsString(id.listAjax(gt));
            return json;  
       }
    }
    
    //ham cap nhat cho San pham:
    @RequestMapping(value = "/goUpdate",method = RequestMethod.GET)
    public String goUpdate(HttpServletRequest request,ModelMap mm){
          String id=request.getParameter("id");
          InventorDao inventorDao=new InventorDao();
          mm.put("invt",inventorDao.find(id));
          return "update";
    }
    //trang cap nhat mat hang:
    @RequestMapping(value = "/updateInvt",method = RequestMethod.POST)
    public String updateInvt(HttpServletRequest request,ModelMap mm){
        String path="";
        String nhanve=request.getParameter("gd");
        String gt=String.valueOf(request.getParameter("gt"));
        if(gt.length()==0){
           if(nhanve!=null){
              path = nhanve;
           }
        }
        else if(gt.length()!=0&&nhanve.length()!=0){
            path = gt;
        }
        //Lay gia tri ve:
        String invtId=String.valueOf(request.getParameter("invtid"));
        String invtname=String.valueOf(request.getParameter("invtname"));
        
        String sreen=String.valueOf(request.getParameter("sreen"));
        String hdh=String.valueOf(request.getParameter("hdh"));
        String cpu=String.valueOf(request.getParameter("cpu"));
        String ram=String.valueOf(request.getParameter("ram"));
        String camera=String.valueOf(request.getParameter("camera"));
        String pin=String.valueOf(request.getParameter("pin"));
        long gia=Long.parseLong(request.getParameter("gia"));
        int count=Integer.parseInt(request.getParameter("count"));
        String color=String.valueOf(request.getParameter("color"));
        InventorDao inventorDao=new InventorDao();
        Inventory inventory=new Inventory(invtId,invtname, path, sreen, hdh, cpu, ram, camera, pin, gia,count,color);
        if(inventorDao.updateInventor(inventory)){
            mm.put("ms","Utc");
            
        }
        else{
        mm.put("ms","Utb");
        mm.put("id",invtId);
        }
        return "flash";
    }
    @RequestMapping(value = "/goDelete",method = RequestMethod.GET)
    //xoa mat hang :
    public String goDelete(HttpServletRequest request,ModelMap mm){
        String id=request.getParameter("id");
        InventorDao inventorDao=new InventorDao();
        //tim doi tuong thuoc id va xoa:
        if(inventorDao.delete(inventorDao.find(id))){
             mm.put("ms","Dtc");
        }
        else{
            mm.put("ms","Dtb");
        }
        return "flash";
    }
    @RequestMapping(value = "/searchFast",method=RequestMethod.POST)
    //tim san pham theo table:
    public String searchFast(HttpServletRequest request,ModelMap mm){
        return "qlhh";
    }
    //Vao chuc nang quang ly tin tuc hang hoa:
    @RequestMapping(value = "/goSafeOff",method =RequestMethod.GET)
    public String goSafeOff(HttpSession session,HttpServletRequest request,ModelMap mm){
        //Lay giatri ten:
        String name=(String)session.getAttribute("ten");
        //Tim kiem phan tu:
        KhDao khDao=new KhDao();
        Kh kh=new Kh();
        kh=khDao.find(name);
        mm.put("tk",kh);
        //tim kiem tat cac mat hàng:
        InventorDao inventorDao=new InventorDao();
        List<Inventory> list=new ArrayList<Inventory>();
        mm.put("inventory",inventorDao.list());
        //tim mat hang dang tin:
        AdDao adDao=new AdDao();
        mm.put("tin",adDao.listAd());
        return "safeoff";
    }
    @RequestMapping(value = "/getAjax",method = RequestMethod.POST)
    //ham get Ajax:
    public  @ResponseBody String getAjax(@RequestParam String name) throws JsonProcessingException{
        ObjectMapper objectMapper=new ObjectMapper();
        InventorDao inventorDao=new InventorDao();
        Inventory inventory=new Inventory();
        String json=objectMapper.writeValueAsString(inventorDao.find(name));
        return json;
    }
    @RequestMapping(value = "/addSale",method = RequestMethod.POST)
    //Ham add cac mat hang gia gia:
    public String addSale(HttpServletRequest request,ModelMap mm){
        int gt=Integer.parseInt(request.getParameter("gt"));
        int sale;
        String id;
        //dung vong lap de get gt cua cac bien ve:
        InventorDao idao=new InventorDao();
        for(int i=1;i<=gt;i++){
            id=request.getParameter("InvtID"+i);
            sale=Integer.parseInt(request.getParameter("sale"+i));
            Inventory inventory=idao.find(id);
            inventory.setSale(sale);
            //update mat hang:
            if(idao.updateInventor(inventory)){
                mm.put("ms","stc");
            }
            else{
                 mm.put("ms","stb");
            }
            
        }
        return "flash";
    }
    @RequestMapping(value = "/goKTinvt",method = RequestMethod.POST)
    //Ham kiem tra id mat hang:
    public @ResponseBody String goKTinvt(@RequestParam String invtid,ModelMap mm){
        InventorDao inventorDao=new InventorDao();
        Inventory inventory=new Inventory();
        inventory=inventorDao.find(invtid);
        String kq="";
        if(inventory!=null){
            kq="1";
        }
        else{
            kq="0";
        }
        return kq;
    }
   
    //Ham them gio hang:
 @RequestMapping(value = "addToCart", method = RequestMethod.GET)
  public String addToCart(ModelMap mm, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

       String id=request.getParameter("id");
       String name=request.getParameter("name");
       Long gia=Long.parseLong(request.getParameter("price"));
       int sale=Integer.parseInt(request.getParameter("sale"));
       String path=request.getParameter("path");
       String values=request.getParameter("color");
       byte ptext[]=values.getBytes("ISO-8859-1");
       String color = new String(ptext, "UTF-8");
       Cart cart1;
        if (session.getAttribute("carts") == null) {
            List<Cart> cart = new ArrayList<Cart>();
            cart1=new Cart(id,name,path,sale,1,color,gia);
            cart.add(cart1);
            session.setAttribute("carts", cart);
            mm.put("id",id);
            mm.put("name",name);
            mm.put("ms","go");
            session.setAttribute("ts","no");
        } else {
            List<Cart> cart = (List<Cart>) session.getAttribute("carts");
            int index = isExiting(id, session);
            if (index == -1) {
                cart1=new Cart(id,name,path,sale,1,color,gia);
                cart.add(cart1);
                session.setAttribute("ts","no");
            } else {
                int quantity = cart.get(index).getSl() + 1;
                cart.get(index).setSl(quantity);
                session.setAttribute("ts","yes");
            }
            
            session.setAttribute("carts", cart);
            mm.put("id",id);
            mm.put("name",name);
            mm.put("ms","go");
            
            }
            return "flash";
    }
	
	
	private int isExiting(String productId, HttpSession session) {
        List<Cart> cart = (List<Cart>) session.getAttribute("carts");
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getId().equals(productId)) {
                return i;
            }
        }

        return -1;

    }
    @RequestMapping(value = "goCart",method = RequestMethod.GET)
    //Ham den trang gio hang:
    public String goCart(HttpSession session,ModelMap mm,HttpServletRequest request){
        KhDao khDao=new KhDao();
         //Lay giai tri Sesion.
        String rs=(String)session.getAttribute("ten");
        if(rs!=null){
            KhDao kd=new KhDao();
            mm.put("kh",kd.find(rs));
        }
        String id=request.getParameter("id");
        if(id!=""){
            mm.put("kh", khDao.find(id));
        }
        List<Cart> list;
        
             if(session.getAttribute("carts")!=null){
                 list=(List<Cart>)session.getAttribute("carts");
                 mm.put("ct", list);
             }
             else{
                 list=new ArrayList<Cart>();
                 mm.put("ct", list);
             }
       
       
        return "cart";
    }
    @RequestMapping(value = "updateCart",method = RequestMethod.POST)
    public String updateCart(HttpServletRequest request,ModelMap mm,HttpSession session){
       //Lay gia tri ben seesion ve:
       session=request.getSession();
       String tk=request.getParameter("tk");
       List<Cart> carts=(List<Cart>)session.getAttribute("carts");
       //update mat hang()
       for(int i=0;i<carts.size();i++){
           carts.get(i).setSl(Integer.parseInt(request.getParameter("sl"+(i+1))));
       }
       session.setAttribute("carts", carts);
       mm.put("ms","upc");
       mm.put("id",tk);
       return "flash";
    }
    
    //Xoa gio hang:
    
    @RequestMapping(value = "deleteCart",method = RequestMethod.GET)
    public String deleteCart(HttpServletRequest request,ModelMap mm,HttpSession session){
       //Lay gia tri ben seesion ve:
       session=request.getSession();
       String tk=request.getParameter("tk");
       List<Cart> carts=(List<Cart>)session.getAttribute("carts");
       carts.remove(Integer.parseInt(request.getParameter("id"))-1);
       session.setAttribute("carts", carts);
       mm.put("ms","upc");
       mm.put("id",tk);
       return "flash";
    }
//    public String addToCart(HttpServletRequest request,HttpSession session,ModelMap mm){
//         String name=request.getParameter("name");
       
//       int index=0;
//       int dem=1;
//       String id=request.getParameter("id");
//       //Tim san pham theo mat hàng:
//       InventorDao inventorDao=new InventorDao();
//       session=request.getSession();
//       Inventory inventory=new Inventory();
//       List<Cart> carts=new ArrayList<Cart>();
//       if(session.getAttribute("ten")!=null){
//                
//               try{
//                    if((List<Cart>)session.getAttribute("carts")==null){
//                   Cart cart=new Cart();
//                   inventory=inventorDao.find(id);
//                   cart.setInvtname(inventory.getName());
//                   cart.setPath(inventory.getPath());
//                   cart.setGia(inventory.getGia());
//                   cart.setId(inventory.getInventoryId());
//                   cart.setSl(1);
//                   carts.add(cart);
//                   session.setAttribute("carts", carts);
//                   //
//                    mm.put("id",id);
//                    mm.put("name",name);
//                    mm.put("ms","go");
//                    session.setAttribute("ts","no");
//                }
//                else{
//                      
//                       carts=(List<Cart>)session.getAttribute("carts");
//                       if (!isExiting(id,carts)) {
//                            Cart cart=new Cart();
//                            inventory=inventorDao.find(id);
//                            cart.setInvtname(inventory.getName());
//                            cart.setPath(inventory.getPath());
//                            cart.setGia(inventory.getGia());
//                            cart.setSl(1);
//                            carts.add(cart);
//                            //
//                            mm.put("id",id);
//                            mm.put("name",name);
//                            mm.put("ms","go");
//                            session.setAttribute("ts","no");
//                            session.setAttribute("carts", carts);
//                       } 
//                       else {
////                           int quantity = carts.get(index).getSl()+1;
////                           carts.get(index).setSl(quantity);
//                             mm.put("id",id);
//                             mm.put("name",name);
//                             mm.put("ms","go");
//                             session.setAttribute("ts","yes");
//                            
//                        }
//                   
//                }
//               }
//               catch(Exception e){
//                   
//               }
//       }
//               
//       session.setAttribute("carts", carts);
//       return "flash";
//    }
//    
//    public boolean isExiting(String id,List<Cart>carts) {
//        int dem;
//        for (int i = 0; i < carts.size(); i++) {
//            if (carts.get(i).getId().equals(id)) {
//                return true;
//            }
//        }
//        return false;
//    }
      
      @RequestMapping(value = "/addPurchase",method = RequestMethod.POST)
      public String addPurchase(HttpServletRequest request,HttpSession session,ModelMap mm){
          String user=request.getParameter("user");
          String name=(String)request.getParameter("name");
          //Lay ve dia chi email:
          String email=(String)request.getParameter("email");
          String address=(String)request.getParameter("address");
          String t=(String)request.getParameter("total");
          Double tt=Double.parseDouble(request.getParameter("total"));
          BigDecimal total=BigDecimal.valueOf(tt);
          String date=request.getParameter("date");
          //Tao va inport vao doi tuong KH:
          PurchaseDao purchaseDao=new PurchaseDao();
          KhDao khDao=new KhDao();
          Kh kh=new Kh(user, name);
          //
          khDao.addCust(kh);
             
         //Khai bao cai Purchase:
         Purchaseorder purchase=new Purchaseorder(kh,name,date,total,0,0);
         //Lay carts:
         List<Cart> list=(List<Cart>)session.getAttribute("carts");
         Purchaseorderdetail pur =new Purchaseorderdetail();
         PurchaseDetail pd=new PurchaseDetail();
         Inventory inventory;
         Inventory inventory1=new Inventory();
         InventorDao gDao=new InventorDao();
         if(purchaseDao.addAd(purchase)){
             //Lay qua tung phan tu cua carst:
             for(int i=0;i<list.size();i++){
                pur.setInventory(new Inventory(list.get(i).getId()));
                pur.setPurchaseorder(purchase);
                double cost=(double)list.get(i).getGia()*list.get(i).getSale()*list.get(i).getSl()/100;
                pur.setCost(list.get(i).getGia()*list.get(i).getSl()-cost);
                pur.setCount(list.get(i).getSl());
                pur.setColor(list.get(i).getColor());
                //add vao csdl:
                pd.addAd(pur);
                
                //Khi da tem mat hang vao roi thi lan luot giam gia cac san pham mua duoc:
                inventory=gDao.find(list.get(i).getId());
                inventory.setCount(inventory.getCount()-list.get(i).getSl());
                gDao.addInventor(inventory);
             }
             //gui mail ve cho nguoi biet la da dat hang thanh cong:
             SendMail sendMail=new SendMail();
             sendMail.sendMail(email,"Thong tin dat hang","Xin chao: "+name+"\n"+ "Chung toi da nhan thong tin dat hang cua ban!"
             +"\n"+"Chung toi se giao hang tai dia chi:"+address+"\n"+"Tong tien thanh toan la: "+t+"\n"+"Tran trong kinh chao, va chuc suc khoe.");
            
             session.setAttribute("pur","ok");
             mm.put("ms","purt");
             mm.put("puru",user);
         }
         else{
             session.setAttribute("pur","");
             mm.put("puru",user);
             mm.put("ms","purt");
         }     
          
          return "flash";
      }
      @RequestMapping(value = "/goPurchaseHistory",method = RequestMethod.GET)
      public  String goPurchaseHistory(HttpServletRequest request,ModelMap mm){
          KhDao khDao=new KhDao();
          Kh kh=new Kh();
          String tk=request.getParameter("tk");
          kh=new Kh(khDao.find(tk));
          mm.put("kh",kh);
          //dua vao nguyen list:
          PurchaseDao purchaseDao=new PurchaseDao();
          mm.put("pur",purchaseDao.list(tk));
//          //tim kiem tat ca cac list chi tiet hoa don:
//          PurchaseDetail pd=new PurchaseDetail();
//          mm.put("purd", pd.listPurchasaDetail());
          return "history";
      }
      
      @RequestMapping(value = "/goHistoryDetail",method = RequestMethod.GET)
      public String goHistoryDetail(HttpServletRequest request,ModelMap mm){
          String id = request.getParameter("tk");
          KhDao khDao=new KhDao();
          mm.put("kh", khDao.find(id));
          //tim theo ma hóa don:
          Integer idp = Integer.parseInt(request.getParameter("id"));
          PurchaseDetail pd=new PurchaseDetail();
          mm.put("purd",pd.list(idp));
          mm.put("so",idp);
          return "historydetail";
      }
      @RequestMapping(value = "gopurchaseManager",method = RequestMethod.GET)
      //Ham quan ly hoa don cua ADmin:
      public String goPurchaseManager(HttpServletRequest request,ModelMap mm){
          String tk=request.getParameter("tk");
          KhDao khDao=new KhDao();
          mm.put("kh", khDao.find(tk));
          ///
          PurchaseDao purchaseDao=new PurchaseDao();
          mm.put("lpur",purchaseDao.listPur());
          return "purchaseManager";
      }
      
      @RequestMapping(value = "/duyetPur",method = RequestMethod.GET)
      //duyet hóa dơn của khách hàng:
      public String duyetPur( HttpServletRequest request,ModelMap mm,HttpSession session){
          String tk=request.getParameter("tk");
          String name=request.getParameter("name");
          //gui ten di:
          mm.put("tk", tk);
          //lay id cua hoa don:
          Integer id=Integer.parseInt(request.getParameter("id"));
          //tien hanh tim kiem hoa don:
          Purchaseorder purchaseorder=new Purchaseorder();
          PurchaseDao pd=new PurchaseDao();
          purchaseorder=pd.find(id);
          purchaseorder.setStatus(1);
          //sau do upadte lai hoa  don:
          pd.addPur(purchaseorder);
          //tao seesion thong bao thanh cong:
//          session.setAttribute("tbpur",name);
          mm.put("ms","duyet");
          return "flash";
      }
      
       @RequestMapping(value = "/give",method = RequestMethod.GET)
      //duyet hóa dơn của khách hàng:
      public String give( HttpServletRequest request,ModelMap mm,HttpSession session){
          String tk=request.getParameter("tk");
          //gui ten di:
          mm.put("tk", tk);
          //lay id cua hoa don:
          Integer id=Integer.parseInt(request.getParameter("id"));
          //tien hanh tim kiem hoa don:
          Purchaseorder purchaseorder=new Purchaseorder();
          PurchaseDao pd=new PurchaseDao();
          purchaseorder=pd.find(id);
          purchaseorder.setGive(1);
          //sau do upadte lai hoa  don:
          pd.addPur(purchaseorder);
          //tao seesion thong bao thanh cong:
//          session.setAttribute("tbpur",name);
          mm.put("ms","give");
          return "flash";
      }
      
      //ham tim list thao quan ly:
      
      @RequestMapping(value = "/golistPur",method = RequestMethod.GET)
      public String listPur(HttpServletRequest request,ModelMap mm){
          String id = request.getParameter("tk");
          KhDao khDao=new KhDao();
          mm.put("kh", khDao.find(id));
          //tim theo ma hóa don:
          Integer idp = Integer.parseInt(request.getParameter("id"));
          //tim ra Purchase:
          Purchaseorder p=new Purchaseorder();
          PurchaseDao pd1=new PurchaseDao();
          p=pd1.find(idp);
          mm.put("name",p.getPurchaseName());
          //
          PurchaseDetail pd=new PurchaseDetail();
          mm.put("purd",pd.list(idp));
          mm.put("so",idp);
          return "listPur";
      }
      
}
