package model;
// Generated Oct 10, 2016 9:58:00 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Contact generated by hbm2java
 */
@Entity
@Table(name="contact"
    ,catalog="nienluan"
)
public class Contact  implements java.io.Serializable {


     private Integer id;
     private String user;
     private String email;
     private String traloi;
     private String cauhoi;
     private String tinhtrang;

    public Contact() {
    }

	
    public Contact(String user, String email, String cauhoi) {
        this.user = user;
        this.email = email;
        this.cauhoi = cauhoi;
    }
    public Contact(String user, String email, String traloi, String cauhoi, String tinhtrang) {
       this.user = user;
       this.email = email;
       this.traloi = traloi;
       this.cauhoi = cauhoi;
       this.tinhtrang = tinhtrang;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    
    @Column(name="user", nullable=false)
    public String getUser() {
        return this.user;
    }
    
    public void setUser(String user) {
        this.user = user;
    }

    
    @Column(name="email", nullable=false)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    
    @Column(name="traloi", length=400)
    public String getTraloi() {
        return this.traloi;
    }
    
    public void setTraloi(String traloi) {
        this.traloi = traloi;
    }

    
    @Column(name="cauhoi", nullable=false, length=400)
    public String getCauhoi() {
        return this.cauhoi;
    }
    
    public void setCauhoi(String cauhoi) {
        this.cauhoi = cauhoi;
    }

    
    @Column(name="tinhtrang", length=200)
    public String getTinhtrang() {
        return this.tinhtrang;
    }
    
    public void setTinhtrang(String tinhtrang) {
        this.tinhtrang = tinhtrang;
    }




}


