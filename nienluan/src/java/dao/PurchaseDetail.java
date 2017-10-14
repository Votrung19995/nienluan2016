/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import model.HibernateUtil;
import model.*;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Vo
 */
public class PurchaseDetail {
     private final SessionFactory sf = HibernateUtil.getSessionFactory();
   
    //ham them khach hang:
    public boolean addAd(Purchaseorderdetail purchaseorderdetail){
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().save(purchaseorderdetail);
            sf.getCurrentSession().getTransaction().commit();
            sf.getCurrentSession().close();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
    
    //Danh sách khách hàng
   public  List<Purchaseorderdetail> list(Integer id){
            List<Purchaseorderdetail> list = new ArrayList<Purchaseorderdetail>();
            try{
                Purchaseorder purchaseorder=new Purchaseorder(id);
                sf.getCurrentSession().beginTransaction();
                Criteria criteria=sf.getCurrentSession().createCriteria(Purchaseorderdetail.class);
                criteria.add(Restrictions.eq("purchaseorder",purchaseorder));
                list=criteria.list();
                sf.getCurrentSession().close();
                return list;
            }
            catch(Exception e){
                sf.getCurrentSession().getTransaction().rollback();
                return null;
            }
           
    }
    
}
