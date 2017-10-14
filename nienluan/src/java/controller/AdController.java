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
import dao.*;
import model.*;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Vo
 */
@Controller
@RequestMapping(value = "/")
public class AdController {
    @RequestMapping(value = "/adAd",method = RequestMethod.POST)
    public String addAd(ModelMap mm,HttpServletRequest request){
        String head=request.getParameter("head");
        String tomtat=request.getParameter("tomtat");
        String noidung=request.getParameter("noidung");
        String path=request.getParameter("path");
        
        AdDao ad=new AdDao();
        Ad a=new Ad(head, tomtat, noidung, path);
        if(ad.addAd(a)){
            mm.put("ms","adtc");
        }
        else{
            mm.put("ms","adtb"); 
        }
        return "flash";
    }
//    @RequestMapping(value = "/toAjax",method = RequestMethod.POST)
//    //ham get Ajax:
//    public  @ResponseBody String toAjax(@RequestParam String id,ModelMap mm,HttpServletRequest request) throws JsonProcessingException {
//        ObjectMapper objectMapper=new ObjectMapper();
//        AdDao adDao=new AdDao();
//        Integer i=Integer.parseInt(id);
//        Ad ad=new Ad();
//        ad=adDao.find(id);
//        String json=objectMapper.writeValueAsString(ad);
//          return json;
//    }
    
    //Ham xoa tin tuc:
    @RequestMapping(value = "/delAd",method = RequestMethod.GET)
    public String delAd(HttpServletRequest request,ModelMap mm){
       Integer id=Integer.parseInt(request.getParameter("id"));
       AdDao adDao=new AdDao();
       Ad ad=new Ad();
       ad=new Ad(adDao.find(id));
       if(adDao.deleteAD(ad)){
           mm.put("ms","adxtc");
       }
       else{
           mm.put("ms","adxtb");
       }
       return "flash";
    }
    //
    @RequestMapping(value = "/goAd",method = RequestMethod.GET)
    public String goAd(HttpServletRequest request,ModelMap mm){
        String tk=request.getParameter("tk");
        KhDao khDao=new KhDao();
        mm.put("kh", khDao.find(tk));
        //gui len nguyen list cua Ad:
        AdDao adDao=new AdDao();
        mm.put("ad",adDao.listAd());
        return "ad";
    }
    @RequestMapping(value = "/adDetail",method = RequestMethod.GET)
    //Di den trang xem chi tiest mat hang:
    public String adDetail( HttpServletRequest request,ModelMap mm){
        int id = Integer.parseInt(request.getParameter("ad"));
        String tk=request.getParameter("id");
        KhDao khDao=new KhDao();
        //gui len nguyen list cua Ad:
        AdDao adDao=new AdDao();
        mm.put("ad",adDao.find(id));
        mm.put("kh", khDao.find(tk));
        return "adDetail";
    }
}
