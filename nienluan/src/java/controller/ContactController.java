/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import dao.*;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import model.*;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import email.SendMail;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Vo
 */
@Controller
@RequestMapping(value = "/")
public class ContactController {
    @RequestMapping(value = "/addContact",method = RequestMethod.POST)
    public String addContact(HttpServletRequest request,ModelMap mm){
        //lay gia tri sang:
        String user=request.getParameter("ten");
        String email=request.getParameter("email");
        String cauhoi=request.getParameter("cauhoi");
        String tinhtrang="no";
        
        ContactDao contactDao=new ContactDao();
        Contact contact=new Contact();
        contact.setTinhtrang(tinhtrang);
        contact.setCauhoi(cauhoi);
        contact.setEmail(email);
        contact.setUser(user);
        try{
            if(contactDao.addAd(contact)){
                mm.put("ms","cttc");
                mm.put("t",user);
            }
            else{
                mm.put("ms","cttb");
                mm.put("t",user);
            }
            
        }
        catch(Exception e){
            mm.put("ms","cttb");
            mm.put("t",user);
        }
                
        return "flash";
        
    }
    //Ham dem contact:
    @RequestMapping(value = "/goMessage",method = RequestMethod.GET)
    public String goMessage(HttpServletRequest request,ModelMap mm){
        String name=request.getParameter("user");
        ContactDao contactDao=new ContactDao();
        mm.put("message",contactDao.list(name));
        KhDao khDao=new KhDao();
        //Tra ve ket qua cua tk:
        mm.put("tk",khDao.find(name));
        return "message";
    }
    
    //Ham dem contact:
    @RequestMapping(value = "/goFeeback",method = RequestMethod.GET)
    public String goFeeback(HttpServletRequest request,ModelMap mm){
        String name=request.getParameter("tk");
        ContactDao contactDao=new ContactDao();
        mm.put("contact",contactDao.listCt());
        KhDao khDao=new KhDao();
        //Tra ve ket qua cua tk:
        mm.put("tk",khDao.find(name));
        return "feeback";
    }
    
    //Ham dem contact:
    @RequestMapping(value = "/feeback",method = RequestMethod.POST)
    public String feeback(HttpServletRequest request,ModelMap mm,HttpSession session){
        Integer id=Integer.parseInt(request.getParameter("gtid"));
        String noidung=request.getParameter("feeback");
        String email=request.getParameter("email");
        String user=request.getParameter("user");
        //Tim kiem cai contact co id:
        ContactDao contactDao=new ContactDao();
        Contact contact=new Contact();
        contact=contactDao.find(id);
        contact.setTraloi(noidung);
        contact.setTinhtrang("yes");
        //sau do save vao cau hoi:
        if( contactDao.addAd(contact)){
        //gui qua email nguoi nguoi:
        SendMail sm=new SendMail();
        try{
            sm.sendMail(email,"gui toi:"+email,noidung);
        }
        catch(Exception e){
            
        }
          session.setAttribute("ctok","ok");
        }
        mm.put("ms","fbok");
        mm.put("tk",user);
        
        return "flash";
    }
}
