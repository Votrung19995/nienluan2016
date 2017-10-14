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
public class CommentDao {
     private final SessionFactory sf = HibernateUtil.getSessionFactory();
     //ham them khach hang:
    public boolean addComment(Coment c){
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().saveOrUpdate(c);
            sf.getCurrentSession().getTransaction().commit();
            sf.getCurrentSession().close();
            return  true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
    
    //Danh sách khách hàng
    public  List<Coment> listCommet(String id){
            List<Coment> list = new ArrayList<Coment>();
            try{
                sf.getCurrentSession().beginTransaction();
                Criteria criteria=sf.getCurrentSession().createCriteria(Coment.class);
                criteria.add(Restrictions.eq("inventoryId",id));
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
