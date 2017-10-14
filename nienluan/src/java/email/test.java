/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package email;
import email.SendMail;
/**
 *
 * @author Vo
 */
public class test {
    public static void main(String[] args) {
       SendMail sm=new SendMail();
       for(int i=1;i<=20;i++){
           sm.sendMail("anhb1304809@student.ctu.edu.vn","gui toi hoai anh","kaka");
           System.out.println("ok");
       }
    }
}
