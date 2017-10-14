/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author Vo
 */
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dao.*;
import model.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Inventory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/")
public class CommentController {
    @RequestMapping(value = "/goComment",method = RequestMethod.POST)
    public @ResponseBody String goComment(@RequestParam String invtId,@RequestParam String name,@RequestParam String path,@RequestParam String comment,@RequestParam String date){
        CommentDao cd=new CommentDao();
        ArrayList<Coment> list=new ArrayList<Coment>();
        String json;
        ObjectMapper obj = new ObjectMapper();
  
        //Them vao Doi tuong comment:
        Coment coment=new Coment(invtId, name, path, comment, date);
        if(cd.addComment(coment)){
            return "tc";
        }
        else{
            return "tb";
        }
    }
}
