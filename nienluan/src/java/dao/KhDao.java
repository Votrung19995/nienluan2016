/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.*;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

/**
 *
 * @author Vo
 */
public class KhDao {
    private final SessionFactory sf = HibernateUtil.getSessionFactory();
    //Tìm kiếm khách hàng
    public Kh find(String user){
        Kh kh=new Kh();
        try{
            sf.getCurrentSession().beginTransaction();
            kh = (Kh)sf.getCurrentSession().get(Kh.class,user);
            sf.getCurrentSession().close();
            return kh;
        }
        catch(Exception e){
            
            return null;
        }
        
    }
    
    //Danh sách khách hàng
    public List<Kh> listKh(){
            List<Kh> list = new ArrayList<Kh>();
            try{
                sf.getCurrentSession().beginTransaction();
                list = sf.getCurrentSession().createCriteria(Kh.class).list();
                sf.getCurrentSession().close();
                return list;
            }
            catch(Exception e){
               
                return null;
            }
         
    }
    //ham them khach hang:
    public void addCust(Kh k){
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().saveOrUpdate(k);
            sf.getCurrentSession().getTransaction().commit();
            sf.getCurrentSession().close();
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
           
        }
    }
    //Ham update
    public boolean updateCust(Kh k){
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().saveOrUpdate(k);
            sf.getCurrentSession().getTransaction().commit();
            sf.getCurrentSession().close();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
}
