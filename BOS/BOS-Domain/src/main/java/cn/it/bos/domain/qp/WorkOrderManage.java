package cn.it.bos.domain.qp;
// Generated 2016-12-13 0:41:12 by Hibernate Tools 3.2.2.GA


import java.util.Date;

import javax.persistence.IdClass;

import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.DocumentId;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Index;
import org.hibernate.search.annotations.Indexed;
import org.hibernate.search.annotations.Store;
import org.wltea.analyzer.lucene.IKAnalyzer;

/**
 * QpWorkordermanage generated by hbm2java
 */
@Indexed
@Analyzer(impl=IKAnalyzer.class )
public class WorkOrderManage  implements java.io.Serializable {

	 @DocumentId
     private String id;       		//uuid主键
	 @Field(store=Store.NO,index=Index.TOKENIZED)
     private String wid;       		//工作单号
	 @Field(store=Store.NO,index=Index.TOKENIZED)
     private String arrivecity;	 	//到达地
	 @Field(store=Store.NO,index=Index.TOKENIZED)
	 private String product;		//产品
     private Integer num;			//件数
     private Double weight;			//重量
     private String floadreqr;		//配载要求
     private String prodtimelimit;	//产品时限
     private String prodtype;		//产品类型
     private String sendername;		//寄件人姓名
     private String senderphone;	//寄件人电话
     private String senderaddr;		//寄件人地址
     private String receivername;	//收货人名称
     private String receiverphone;	//收货人电话
     private String receiveraddr;	//收货地址
     private Integer feeitemnum;	//计费件数（原件数）
     private Double actlweit;		//实际重量
     private String vol;			//体积（尺寸）
     private String managerCheck;	//核查
     private Date updatetime;		//更新时间
     
    public WorkOrderManage() {
    }

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWid() {
		return wid;
	}

	public void setWid(String wid) {
		this.wid = wid;
	}

	public String getArrivecity() {
		return arrivecity;
	}

	public void setArrivecity(String arrivecity) {
		this.arrivecity = arrivecity;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public String getFloadreqr() {
		return floadreqr;
	}

	public void setFloadreqr(String floadreqr) {
		this.floadreqr = floadreqr;
	}

	public String getProdtimelimit() {
		return prodtimelimit;
	}

	public void setProdtimelimit(String prodtimelimit) {
		this.prodtimelimit = prodtimelimit;
	}

	public String getProdtype() {
		return prodtype;
	}

	public void setProdtype(String prodtype) {
		this.prodtype = prodtype;
	}

	public String getSendername() {
		return sendername;
	}

	public void setSendername(String sendername) {
		this.sendername = sendername;
	}

	public String getSenderphone() {
		return senderphone;
	}

	public void setSenderphone(String senderphone) {
		this.senderphone = senderphone;
	}

	public String getSenderaddr() {
		return senderaddr;
	}

	public void setSenderaddr(String senderaddr) {
		this.senderaddr = senderaddr;
	}

	public String getReceivername() {
		return receivername;
	}

	public void setReceivername(String receivername) {
		this.receivername = receivername;
	}

	public String getReceiverphone() {
		return receiverphone;
	}

	public void setReceiverphone(String receiverphone) {
		this.receiverphone = receiverphone;
	}

	public String getReceiveraddr() {
		return receiveraddr;
	}

	public void setReceiveraddr(String receiveraddr) {
		this.receiveraddr = receiveraddr;
	}

	public Integer getFeeitemnum() {
		return feeitemnum;
	}

	public void setFeeitemnum(Integer feeitemnum) {
		this.feeitemnum = feeitemnum;
	}

	public Double getActlweit() {
		return actlweit;
	}

	public void setActlweit(Double actlweit) {
		this.actlweit = actlweit;
	}

	public String getVol() {
		return vol;
	}

	public void setVol(String vol) {
		this.vol = vol;
	}

	public String getManagerCheck() {
		return managerCheck;
	}

	public void setManagerCheck(String managerCheck) {
		this.managerCheck = managerCheck;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public WorkOrderManage(String id, String wid, String arrivecity, String product, Integer num, Double weight,
			String floadreqr, String prodtimelimit, String prodtype, String sendername, String senderphone,
			String senderaddr, String receivername, String receiverphone, String receiveraddr, Integer feeitemnum,
			Double actlweit, String vol, String managerCheck, Date updatetime) {
		super();
		this.id = id;
		this.wid = wid;
		this.arrivecity = arrivecity;
		this.product = product;
		this.num = num;
		this.weight = weight;
		this.floadreqr = floadreqr;
		this.prodtimelimit = prodtimelimit;
		this.prodtype = prodtype;
		this.sendername = sendername;
		this.senderphone = senderphone;
		this.senderaddr = senderaddr;
		this.receivername = receivername;
		this.receiverphone = receiverphone;
		this.receiveraddr = receiveraddr;
		this.feeitemnum = feeitemnum;
		this.actlweit = actlweit;
		this.vol = vol;
		this.managerCheck = managerCheck;
		this.updatetime = updatetime;
	}

	
   



}


