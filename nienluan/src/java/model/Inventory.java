package model;
// Generated Oct 5, 2016 2:06:21 PM by Hibernate Tools 4.3.1


import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Inventory generated by hbm2java
 */
@Entity
@Table(name="inventory"
    ,catalog="nienluan"
)
public class Inventory  implements java.io.Serializable {


     private String inventoryId;
     private String name;
     private String path;
     private String sreen;
     private String hdh;
     private String cpu;
     private String ram;
     private String camera;
     private String pin;
     private long gia;
     private int count;
     private String color;
     private int sale;
     private Set<Purchaseorderdetail> purchaseorderdetails = new HashSet<Purchaseorderdetail>(0);

    public Inventory() {
    }
    
    public Inventory(String inventoryId) {
        this.inventoryId = inventoryId;
        
    }
    public Inventory(String inventoryId, String name, String path, String sreen, String hdh, String cpu, String ram, String camera, String pin, long gia, int count, String color) {
        this.inventoryId = inventoryId;
        this.name = name;
        this.path = path;
        this.sreen = sreen;
        this.hdh = hdh;
        this.cpu = cpu;
        this.ram = ram;
        this.camera = camera;
        this.pin = pin;
        this.gia = gia;
        this.count = count;
        this.color = color;
        
    }
	
    public Inventory(String inventoryId, String name, String path, String sreen, String hdh, String cpu, String ram, String camera, String pin, long gia, int count, String color, int sale) {
        this.inventoryId = inventoryId;
        this.name = name;
        this.path = path;
        this.sreen = sreen;
        this.hdh = hdh;
        this.cpu = cpu;
        this.ram = ram;
        this.camera = camera;
        this.pin = pin;
        this.gia = gia;
        this.count = count;
        this.color = color;
        this.sale = sale;
    }
    public Inventory(String inventoryId, String name, String path, String sreen, String hdh, String cpu, String ram, String camera, String pin, long gia, int count, String color, int sale, Set<Purchaseorderdetail> purchaseorderdetails) {
       this.inventoryId = inventoryId;
       this.name = name;
       this.path = path;
       this.sreen = sreen;
       this.hdh = hdh;
       this.cpu = cpu;
       this.ram = ram;
       this.camera = camera;
       this.pin = pin;
       this.gia = gia;
       this.count = count;
       this.color = color;
       this.sale = sale;
       this.purchaseorderdetails = purchaseorderdetails;
    }
   
     @Id 

    
    @Column(name="InventoryID", unique=true, nullable=false, length=200)
    public String getInventoryId() {
        return this.inventoryId;
    }
    
    public void setInventoryId(String inventoryId) {
        this.inventoryId = inventoryId;
    }

    
    @Column(name="name", nullable=false, length=200)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    
    @Column(name="path", nullable=false, length=200)
    public String getPath() {
        return this.path;
    }
    
    public void setPath(String path) {
        this.path = path;
    }

    
    @Column(name="sreen", nullable=false, length=200)
    public String getSreen() {
        return this.sreen;
    }
    
    public void setSreen(String sreen) {
        this.sreen = sreen;
    }

    
    @Column(name="hdh", nullable=false, length=200)
    public String getHdh() {
        return this.hdh;
    }
    
    public void setHdh(String hdh) {
        this.hdh = hdh;
    }

    
    @Column(name="cpu", nullable=false, length=200)
    public String getCpu() {
        return this.cpu;
    }
    
    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    
    @Column(name="ram", nullable=false, length=200)
    public String getRam() {
        return this.ram;
    }
    
    public void setRam(String ram) {
        this.ram = ram;
    }

    
    @Column(name="camera", nullable=false, length=200)
    public String getCamera() {
        return this.camera;
    }
    
    public void setCamera(String camera) {
        this.camera = camera;
    }

    
    @Column(name="pin", nullable=false, length=200)
    public String getPin() {
        return this.pin;
    }
    
    public void setPin(String pin) {
        this.pin = pin;
    }

    
    @Column(name="gia", nullable=false, precision=10, scale=0)
    public long getGia() {
        return this.gia;
    }
    
    public void setGia(long gia) {
        this.gia = gia;
    }

    
    @Column(name="count", nullable=false)
    public int getCount() {
        return this.count;
    }
    
    public void setCount(int count) {
        this.count = count;
    }

    
    @Column(name="color", nullable=false, length=200)
    public String getColor() {
        return this.color;
    }
    
    public void setColor(String color) {
        this.color = color;
    }

    
    @Column(name="sale", nullable=false)
    public int getSale() {
        return this.sale;
    }
    
    public void setSale(int sale) {
        this.sale = sale;
    }

    @JsonIgnore
    @OneToMany(fetch=FetchType.LAZY, mappedBy="inventory")
    public Set<Purchaseorderdetail> getPurchaseorderdetails() {
        return this.purchaseorderdetails;
    }
    
    public void setPurchaseorderdetails(Set<Purchaseorderdetail> purchaseorderdetails) {
        this.purchaseorderdetails = purchaseorderdetails;
    }




}

