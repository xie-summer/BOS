package cn.it.bos.domain.bc;
// Generated 2016-12-21 22:50:21 by Hibernate Tools 3.2.2.GA


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;

/**
 * Subarea generated by hbm2java
 */
@Entity
@Table(name="bc_subarea"
    ,catalog="mavenbos"
)
public class Subarea  implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String id;    //  主键id
	private DecidedZone decidedZone; // 定区编码
	private Region region; // 管理分区
	private String addresskey; //  关键字
	private String startnum;//  起始号
	private String endnum;//   结束号
	private String single;//      单双号
	private String position;//  位置坐标

    public Subarea() {
    }

	
    public Subarea(String id) {
        this.id = id;
    }
    public Subarea(String id, Region region, DecidedZone decidedZone, String addresskey, String startnum, String endnum, String single, String position) {
       this.id = id;
       this.region = region;
       this.decidedZone = decidedZone;
       this.addresskey = addresskey;
       this.startnum = startnum;
       this.endnum = endnum;
       this.single = single;
       this.position = position;
    }
    @Transient
    public String getSid() {
   	 return this.id;
    }
     @Id 
    
    @Column(name="id", unique=true, nullable=false, length=32)
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="region_id")
    public Region getRegion() {
        return this.region;
    }
    
    public void setRegion(Region region) {
        this.region = region;
    }
    @JSON(serialize=false)
@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="decidedzone_id")
    public DecidedZone getDecidedZone() {
        return this.decidedZone;
    }
    
    public void setDecidedZone(DecidedZone decidedZone) {
        this.decidedZone = decidedZone;
    }
    
    @Column(name="addresskey", length=100)
    public String getAddresskey() {
        return this.addresskey;
    }
    
    public void setAddresskey(String addresskey) {
        this.addresskey = addresskey;
    }
    
    @Column(name="startnum", length=30)
    public String getStartnum() {
        return this.startnum;
    }
    
    public void setStartnum(String startnum) {
        this.startnum = startnum;
    }
    
    @Column(name="endnum", length=30)
    public String getEndnum() {
        return this.endnum;
    }
    
    public void setEndnum(String endnum) {
        this.endnum = endnum;
    }
    
    @Column(name="single", length=1)
    public String getSingle() {
        return this.single;
    }
    
    public void setSingle(String single) {
        this.single = single;
    }
    
    @Column(name="position")
    public String getPosition() {
        return this.position;
    }
    
    public void setPosition(String position) {
        this.position = position;
    }


	@Override
	public String toString() {
		return "Subarea [id=" + id + ", decidedZone=" + decidedZone + ", region=" + region + ", addresskey="
				+ addresskey + ", startnum=" + startnum + ", endnum=" + endnum + ", single=" + single + ", position="
				+ position + "]";
	}

}


