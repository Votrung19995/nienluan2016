/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Vo
 */
public class Cart {
    public String id;
    private String invtname;
    private String path;
    private int sl;
    private String color;
    private int sale;
    private long gia;
    
    public Cart(){
        
    }

    public Cart(String invtname, String path, int sl,String color, long gia) {
        this.invtname = invtname;
        this.path = path;
        this.sl = sl;
        this.color=color;
        this.gia = gia;
    }
    
    public Cart(String id, String invtname, String path,int sale, int sl,String color, long gia) {
        this.id = id;
        this.invtname = invtname;
        this.path = path;
        this.sl = sl;
        this.gia = gia;
        this.sale=sale;
        this.color=color;
    }
    public String getInvtname() {
        return invtname;
    }

    public void setInvtname(String invtname) {
        this.invtname = invtname;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public int getSl() {
        return sl;
    }

    public void setSl(int sl) {
        this.sl = sl;
    }

    public long getGia() {
        return gia;
    }

    public void setGia(long gia) {
        this.gia = gia;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    
    
    
}
