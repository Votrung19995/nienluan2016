/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.*;
import model.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Vo
 */
public class PurchaseDao {
     private final SessionFactory sf = HibernateUtil.getSessionFactory();
   
    //ham them khach hang:
    public boolean addAd(Purchaseorder purchaseorder){
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().save(purchaseorder);
            sf.getCurrentSession().getTransaction().commit();
            sf.getCurrentSession().close();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
    
     public  List<Purchaseorder> list(String user){
            List<Purchaseorder> list = new ArrayList<Purchaseorder>();
            try{
                Kh kh=new Kh(user);
                sf.getCurrentSession().beginTransaction();
                Criteria criteria=sf.getCurrentSession().createCriteria(Purchaseorder.class);
                criteria.add(Restrictions.eq("kh",kh));
                list=criteria.list();
                sf.getCurrentSession().close();
                return list;
            }
            catch(Exception e){
                sf.getCurrentSession().getTransaction().rollback();
                return null;
            }
           
    }
     
    //Danh sách hoa don
    public List<Purchaseorder> listPur(){
            List<Purchaseorder> list = new ArrayList<Purchaseorder>();
            try{
                sf.getCurrentSession().beginTransaction();
                list = sf.getCurrentSession().createCriteria(Purchaseorder.class).list();
                sf.getCurrentSession().close();
                return list;
            }
            catch(Exception e){
               
                return null;
            }
         
    }
    
    //tim hóa đơn theo id:
    public Purchaseorder find(Integer id){
        Purchaseorder p=new Purchaseorder();
        try{
            sf.getCurrentSession().beginTransaction();
            p = (Purchaseorder)sf.getCurrentSession().get(Purchaseorder.class,id);
            sf.getCurrentSession().close();
            return p;
        }
        catch(Exception e){
            
            return null;
        }
        
    }
    
    //ham them khach hang:
    public boolean addPur(Purchaseorder purchaseorder){
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().saveOrUpdate(purchaseorder);
            sf.getCurrentSession().getTransaction().commit();
            sf.getCurrentSession().close();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
}
