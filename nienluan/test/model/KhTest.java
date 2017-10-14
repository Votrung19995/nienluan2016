/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Set;
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
public class KhTest {
    public static Kh kh;
    private String user;
    private String name;
    private String address;
    public KhTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
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
     * Test of getUser method, of class Kh.
     */
    @Test
    //Ham lay user:
    public void testGetUser() {
        System.out.println("getUser");
        this.user="VLMT";
        kh.setUser(user);
        System.out.println(kh.getUser());
    }
    
    @Test
    //Ham lay user:
    public void testSetUser() {
        System.out.println("setUser");
        this.user="VLMT";
        kh.setUser(user);
        System.out.println("Set user thanh cong");
    }
    
     @Test
    //Ham lay ten:
    public void testName() {
        System.out.println("getName");
        this.name="Vo Le minh trung";
        kh.setName(name);
        System.out.println(kh.getName());
    }
    
     @Test
    //Ham get ten:
    public void testSetName() {
        System.out.println("getName");
        this.name="Vo Le minh trung";
        kh.setName(name);
        System.out.println("them ten thanh cong");
    }
}
