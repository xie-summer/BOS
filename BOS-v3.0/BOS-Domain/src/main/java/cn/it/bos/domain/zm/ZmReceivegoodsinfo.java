package cn.it.bos.domain.zm;
// Generated 2017-1-8 9:56:43 by Hibernate Tools 3.2.2.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * ZmReceivegoodsinfo generated by hbm2java
 */
@Entity
@Table(name="zm_receivegoodsinfo"
    ,catalog="mavenbos"
)
public class ZmReceivegoodsinfo  implements java.io.Serializable {
	@Override
	public String toString() {
		return "ZmReceivegoodsinfo [id=" + id + ", info=" + info + ", updateTime=" + updateTime + ", zmZhongzhuaninfos="
				+ zmZhongzhuaninfos + "]";
	}

	private static final long serialVersionUID = 1L;

     private Long id;
     private String info;
     private Date updateTime;
     private Set<ZmZhongzhuaninfo> zmZhongzhuaninfos = new HashSet<ZmZhongzhuaninfo>(0);

    public ZmReceivegoodsinfo() {
    }

	
    public ZmReceivegoodsinfo(Date updateTime) {
        this.updateTime = updateTime;
    }
    public ZmReceivegoodsinfo(String info, Date updateTime, Set<ZmZhongzhuaninfo> zmZhongzhuaninfos) {
       this.info = info;
       this.updateTime = updateTime;
       this.zmZhongzhuaninfos = zmZhongzhuaninfos;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)
    
    @Column(name="id", unique=true, nullable=false)
    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    @Column(name="info")
    public String getInfo() {
        return this.info;
    }
    
    public void setInfo(String info) {
        this.info = info;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="updateTime", nullable=false, length=19)
    public Date getUpdateTime() {
        return this.updateTime;
    }
    
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="zmReceivegoodsinfo")
    public Set<ZmZhongzhuaninfo> getZmZhongzhuaninfos() {
        return this.zmZhongzhuaninfos;
    }
    
    public void setZmZhongzhuaninfos(Set<ZmZhongzhuaninfo> zmZhongzhuaninfos) {
        this.zmZhongzhuaninfos = zmZhongzhuaninfos;
    }




}


