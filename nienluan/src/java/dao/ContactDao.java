/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Vo
 */
import java.util.ArrayList;
import java.util.List;
import model.HibernateUtil;
import model.*;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
public class ContactDao {
    
     private final SessionFactory sf = HibernateUtil.getSessionFactory();
    //Tìm kiếm khách hàng
    public Contact find(Integer id){
            Contact contact=new Contact();
            try{
                sf.getCurrentSession().beginTransaction();
                contact=(Contact)sf.getCurrentSession().get(Contact.class,id);
                sf.getCurrentSession().close();
                return contact;
            }
            catch(Exception e){
                   sf.getCurrentSession().getTransaction().rollback();
                   return null;
            }
        
    }
    
    //Danh sách khách hàng
    public List<Contact> listCt(){
            List<Contact> list = new ArrayList<Contact>();
            try{
                sf.getCurrentSession().beginTransaction();
                list = sf.getCurrentSession().createCriteria(Contact.class).list();
                sf.getCurrentSession().close();
                return list;
            }
            catch(Exception e){
               
                return null;
            }
         
    }
    //ham them khach hang:
    public boolean addAd(Contact contact){
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().saveOrUpdate(contact);
            sf.getCurrentSession().getTransaction().commit();
            sf.getCurrentSession().close();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
    
    //ham xoa tin tuc:
    public boolean  deleteCt(Contact contact){
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().delete(contact);
            sf.getCurrentSession().getTransaction().commit();
            sf.getCurrentSession().close();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
    //Tim theo ma user:
    //Danh tat ca cac mat hang:
    public  List<Contact> list(String user){
            List<Contact> list = new ArrayList<Contact>();
            try{
                sf.getCurrentSession().beginTransaction();
                Criteria criteria=sf.getCurrentSession().createCriteria(Contact.class);
                criteria.add(Restrictions.eq("user",user));
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
