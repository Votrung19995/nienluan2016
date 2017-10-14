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
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Vo
 */
public class AdDao {
    
    private final SessionFactory sf = HibernateUtil.getSessionFactory();
    //Tìm kiếm khách hàng
    public Ad find(Integer id){
            Ad ad=new Ad();
            try{
                sf.getCurrentSession().beginTransaction();
                ad=(Ad)sf.getCurrentSession().get(Ad.class,id);
                sf.getCurrentSession().close();
                return ad;
            }
            catch(Exception e){
                   sf.getCurrentSession().getTransaction().rollback();
                   return null;
            }
        
    }
    
    //Danh sách khách hàng
    public List<Ad> listAd(){
            List<Ad> list = new ArrayList<Ad>();
            try{
                sf.getCurrentSession().beginTransaction();
                list = sf.getCurrentSession().createCriteria(Ad.class).list();
                sf.getCurrentSession().close();
                return list;
            }
            catch(Exception e){
               
                return null;
            }
         
    }
    //ham them khach hang:
    public boolean addAd(Ad ad){
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().saveOrUpdate(ad);
            sf.getCurrentSession().getTransaction().commit();
            sf.getCurrentSession().close();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
    
    //ham xoa tin tuc:
    public boolean  deleteAD(Ad ad){
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().delete(ad);
            sf.getCurrentSession().getTransaction().commit();
            sf.getCurrentSession().close();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
}
