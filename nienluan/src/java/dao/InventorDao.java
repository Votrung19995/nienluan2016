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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.*;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
public class InventorDao {
     private final SessionFactory sf = HibernateUtil.getSessionFactory();
    //Tìm kiếm khách hàng
    public Inventory find(String name){
        Inventory invt = new Inventory();
        try{
            sf.getCurrentSession().beginTransaction();
            invt = (Inventory)sf.getCurrentSession().get(Inventory.class,name);
            sf.getCurrentSession().close();
            return invt;
        }
        catch(Exception e){
             sf.getCurrentSession().getTransaction().rollback();
             return null;
        }
       
    }
    
    //Danh tat ca cac mat hang:
    public  List<Inventory> list(){
            List<Inventory> list = new ArrayList<Inventory>();
            try{
                sf.getCurrentSession().beginTransaction();
                Criteria criteria=sf.getCurrentSession().createCriteria(Inventory.class);
                list=criteria.list();
                sf.getCurrentSession().close();
                return list;
            }
            catch(Exception e){
                sf.getCurrentSession().getTransaction().rollback();
                return null;
            }
           
    }
    
    //Danh tat ca cac mat hang:
    public  Inventory findInvent(String name){
           
            try{
                sf.getCurrentSession().beginTransaction();
                Criteria criteria=sf.getCurrentSession().createCriteria(Inventory.class);
                Inventory inventory=(Inventory) criteria.add(Restrictions.eq("name",name));
                sf.getCurrentSession().close();
                return inventory;
            }
            catch(Exception e){
                 sf.getCurrentSession().getTransaction().rollback();
                 return null;
            }
           
    }
    
    //Danh sách mat hang teo phan trang:
    public  List<Inventory> listInventory(int st,int max,String sx){
            List<Inventory> list = new ArrayList<Inventory>();
            try{
                sf.getCurrentSession().beginTransaction();
                Criteria criteria=sf.getCurrentSession().createCriteria(Inventory.class);
                //sap xep thu tu:
                if("asc".equals(sx)){
                   criteria.addOrder(Order.asc("gia"));
                }
                else{
                   criteria.addOrder(Order.desc("gia")); 
                }
                criteria.setFirstResult(st);
                criteria.setMaxResults(max);
                list=criteria.list();
                sf.getCurrentSession().close();
                return list;
            }
            catch(Exception e){
                   sf.getCurrentSession().getTransaction().rollback();
                   return null;
            }
           
    }
    //ham get size KH:
    public int getSize(){
        List<Inventory> list = new ArrayList<Inventory>();
            try{
                sf.getCurrentSession().beginTransaction();
                list= sf.getCurrentSession().createCriteria(Inventory.class).list();
                sf.getCurrentSession().close();
                return list.size();
            }
            catch(Exception e){
                 sf.getCurrentSession().getTransaction().rollback();
                  return 0;
            }
           
    }
    public boolean addInventor(Inventory inventory){
       try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().saveOrUpdate(inventory);
            sf.getCurrentSession().getTransaction().commit();
            sf.getCurrentSession().close();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
    public boolean updateInventor(Inventory inventory){
       try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().update(inventory);
            sf.getCurrentSession().getTransaction().commit();
            sf.getCurrentSession().close();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
    //tim cac san pham theo id:
    public  List<Inventory> listID(String id){
            //Su dung bieu thuc chinh quy:
            Pattern patternN = Pattern.compile("^[NL[0-9]]{0,}");
            Pattern patternO = Pattern.compile("^[ONMR[0-9]]{0,}");
            Pattern patternH = Pattern.compile("^[HTG[0-9]]{0,}");
            Pattern patternI = Pattern.compile("^[IP[0-9]]{0,}");
            Pattern patternS = Pattern.compile("^[SAaE[0-9]]{0,}");
            
            Matcher matcherN=patternN.matcher(id);
            Matcher matcherO=patternO.matcher(id);
            Matcher matcherH=patternH.matcher(id);
            Matcher matcherI=patternI.matcher(id);
            Matcher matcherS=patternS.matcher(id);
                
            List<Inventory> list = new ArrayList<Inventory>();
            try{
                sf.getCurrentSession().beginTransaction();
                Criteria criteria=sf.getCurrentSession().createCriteria(Inventory.class);
                
                //tim theo ID san pham:
                if(matcherN.matches()){
                    criteria.add(Restrictions.like("inventoryId","N%"));
                    criteria.add(Restrictions.not(Restrictions.in("inventoryId",new String[]{id})));
                }
                if(matcherO.matches()){
                    criteria.add(Restrictions.like("inventoryId","O%"));
                    criteria.add(Restrictions.not(Restrictions.in("inventoryId",new String[]{id})));
                }
                if(matcherI.matches()){
                    criteria.add(Restrictions.like("inventoryId","I%"));
                    criteria.add(Restrictions.not(Restrictions.in("inventoryId",new String[]{id})));
                }
                if(matcherS.matches()){
                    criteria.add(Restrictions.like("inventoryId","S%"));
                    criteria.add(Restrictions.not(Restrictions.in("inventoryId",new String[]{id})));
                }
                if(matcherH.matches()){
                    criteria.add(Restrictions.like("inventoryId","H%"));
                    criteria.add(Restrictions.not(Restrictions.in("inventoryId",new String[]{id})));
                }
               
                list=criteria.list();
                sf.getCurrentSession().close();
                return list;
            }
            catch(Exception e){
                 sf.getCurrentSession().getTransaction().rollback();
                   return null;
            }
           
    }
    //ham tra ve list theo ten san pham:
    public  List<Inventory> listSP(int st,int max,String sx,String sp){
            List<Inventory> list = new ArrayList<Inventory>();
            try{
                sf.getCurrentSession().beginTransaction();
                Criteria criteria=sf.getCurrentSession().createCriteria(Inventory.class);
                //sap xep thu tu:
                if("asc".equals(sx)){
                   criteria.addOrder(Order.asc("gia"));
                }
                else{
                   criteria.addOrder(Order.desc("gia")); 
                }
                
                //tim kiem theo dieu kien Where:
                if("Nokia".equals(sp)){
                    criteria.add(Restrictions.or(Restrictions.like("inventoryId","N%"),Restrictions.like("inventoryId","L%")));
                }
                
                if("Samsung".equals(sp)){
                    criteria.add(Restrictions.like("inventoryId","S%"));
                }
                
                if("Apple".equals(sp)){
                    criteria.add(Restrictions.like("inventoryId","I%"));
                }
                
                if("Oppo".equals(sp)){
                    criteria.add(Restrictions.like("inventoryId","O%"));
                }
                
                if("HTC".equals(sp)){
                    criteria.add(Restrictions.like("inventoryId","H%"));
                }
                
                criteria.setFirstResult(st);
                criteria.setMaxResults(max);
                list=criteria.list();
                sf.getCurrentSession().close();
                return list;
            }
            catch(Exception e){
                sf.getCurrentSession().getTransaction().rollback();
            }
            return null;
    }
    //ham tim kiem SearchView:
    public  List<Inventory> listSearch(int st,int max,String sx,String sr){
            List<Inventory> list = new ArrayList<Inventory>();
            try{
                sf.getCurrentSession().beginTransaction();
                Criteria criteria=sf.getCurrentSession().createCriteria(Inventory.class);
                //sap xep thu tu:
                if("asc".equals(sx)){
                   criteria.addOrder(Order.asc("gia"));
                }
                else{
                   criteria.addOrder(Order.desc("gia")); 
                }
                criteria.setFirstResult(st);
                criteria.setMaxResults(max);
                criteria.add(Restrictions.like("name","%"+sr+"%"));
                list=criteria.list();
                sf.getCurrentSession().close();
                return list;
            }
            catch(Exception e){
                  sf.getCurrentSession().getTransaction().rollback();
                  return null;
            }
           
    }
    //ham xoa doi tuong:
    public boolean delete(Inventory inventory){
        try {
            sf.getCurrentSession().beginTransaction();
            sf.getCurrentSession().delete(inventory);
            sf.getCurrentSession().getTransaction().commit();
            sf.getCurrentSession().close();
            return true;
        } catch (Exception e) {
            sf.getCurrentSession().getTransaction().rollback();
            return false;
        }
    }
    //Ham tim list table:
    //ham tim kiem SearchView:
    public  List<Inventory> listTable(String sr){
            List<Inventory> list = new ArrayList<Inventory>();
            try{
                sf.getCurrentSession().beginTransaction();
                Criteria criteria=sf.getCurrentSession().createCriteria(Inventory.class);
                criteria.add(Restrictions.like("name","%"+sr+"%"));
                list=criteria.list();
                sf.getCurrentSession().close();
                return list;
            }
            catch(Exception e){
                  sf.getCurrentSession().getTransaction().rollback();
                  return null;
            }
           
    }
    
    //ham tim kiem SearchView:
    public  List<Inventory> listAjax(String sr){
        
                    if("/t".equals(sr)||"\b".equals(sr)||sr==null){
                        return null;
                    }
                    else{
                        List<Inventory> list = new ArrayList<Inventory>();
                        try{
                        sf.getCurrentSession().beginTransaction();
                        Criteria criteria=sf.getCurrentSession().createCriteria(Inventory.class);
                        criteria.add(Restrictions.like("name","%"+sr+"%"));
                        list=( List<Inventory>)criteria.list();
                        sf.getCurrentSession().close();
                        return list; 
                        }
                        catch(Exception e){
                            sf.getCurrentSession().getTransaction().rollback();
                            return null;
                        }
                    }
           
    }
}
