/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.springframework.ui.ModelMap;

/**
 *
 * @author Vo
 */
public class KhControllerTest {
    public static KhController kc;
    public KhControllerTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
        kc=new KhController();
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of goUpdateKh method, of class KhController.
     */
    @Test
    //Test han dang ky:
    public void testGoDK() {
        System.out.println("Di den trang dang ky");
        ModelMap mm = new ModelMap();
        HttpSession session = null;
        try{
           String result=kc.goQuanLy(mm, session);
        }
        catch(Exception e){
            System.out.println("Khong tim thay trang dang ky!"+e.getMessage());
        }
    }
    
    //Test ham kiem tra user:
    public void testKTuser() {
        System.out.println("Thuc hien kiem tra user trong CSDL");
        ModelMap mm = new ModelMap();
        HttpSession session = null;
        try{
           String result=kc.goKTinvt("Trung1995", mm);
            System.out.println("Da tim thay user");
        }
        catch(Exception e){
            System.out.println("Khong tim thay trang dang ky!"+e.getMessage());
        }
    }
    
}
