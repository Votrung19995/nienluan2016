/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import model.Kh;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Vo
 */
public class KhDaoTest {
    public static KhDao kd;
    public static Kh kh;
    public KhDaoTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
        kd=new KhDao();
        kh=new Kh();
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
     * Test of find method, of class KhDao.
     */
    @Test
    //Test ham tim kiem user trong csdl:
    public void testFind() {
        System.out.println(" Tiem kiem khách hàng");
        String user = "Trung1995";
        KhDao instance = new KhDao();
        Kh expResult = instance.find(user);
        if(expResult!=null){
            System.out.println("Da tim thay USER");
        }
        else{
            System.out.println("Khong tim thay USER");
        }
    }
    
    @Test
    //Test ham tim kiem tat ca user:
    public void testFindList() {
        System.out.println(" Tiem kiem danh sach khach hanh");
        KhDao instance = new KhDao();
        List<Kh> expResult = instance.listKh();
        if(expResult!=null){
            System.out.println("Da tim thay list");
        }
        else{
            System.out.println("Khong tim thay list");
        }
    }

}
