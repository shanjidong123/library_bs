package com.yonyou.iuap.bookBorrow.pojo;

import com.yonyou.iuap.persistence.jdbc.framework.annotation.Column;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Entity;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.GeneratedValue;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Id;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.FK;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.OneToMany;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Stragegy;
import com.yonyou.iuap.persistence.jdbc.framework.annotation.Table;
import com.yonyou.iuap.persistence.vo.BaseEntity;


/**
 * <b> 此处简要描述此类功能 </b>
 * <p>
 *   此处添加类的描述信息
 * </p>
 *  创建日期:2019-2-20
 * @author 
 * @version 
 */
@Entity(namespace = "iuap-quickstart",name = "PayFine")
@Table(name = "payFine")
public class PayFine extends BaseEntity{
	
    @Id
    @GeneratedValue(strategy = Stragegy.UUID, moudle = "")  
    @Column(name = "id")
    private java.lang.String id;
      
    @Column(name = "code")
    private java.lang.String code;
      
    @Column(name = "name")
    private java.lang.String name;
      
    @Column(name = "timeout_length")
    private java.lang.String timeout_length;
      
    @Column(name = "price_timeoutrent")
    private java.lang.String price_timeoutrent;
      
    @Column(name = "pay_fine")
    private java.lang.String pay_fine;
      
    @Column(name = "user_name")
    private java.lang.String user_name;
      
    @Column(name = "payfine_state")
    private java.lang.String payfine_state;
      
    @Column(name = "def1")
    private java.lang.String def1;//缴纳时间
      
    @Column(name = "def2")
    private java.lang.String def2;
      
    @Column(name = "def3")
    private java.lang.String def3;
      
    @Column(name = "dr")
    private java.lang.Integer dr = 0;
      
    @Column(name = "ts")
    private java.util.Date ts;
        
	
	

	/**
	 * 属性 id的Getter方法.属性名：主键
	 *  创建日期:2019-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getId () {
		return id;
	}
	   
	/**
	 * 属性id的Setter方法.属性名：主键
	 * 创建日期:2019-2-20
	 * @param newId java.lang.String
	 */
	public void setId (java.lang.String newId ) {
	 	this.id = newId;
	} 	 
	
	/**
	 * 属性 code的Getter方法.属性名：图书编码
	 *  创建日期:2019-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getCode () {
		return code;
	}
	   
	/**
	 * 属性code的Setter方法.属性名：图书编码
	 * 创建日期:2019-2-20
	 * @param newCode java.lang.String
	 */
	public void setCode (java.lang.String newCode ) {
	 	this.code = newCode;
	} 	 
	
	/**
	 * 属性 name的Getter方法.属性名：图书名称
	 *  创建日期:2019-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getName () {
		return name;
	}
	   
	/**
	 * 属性name的Setter方法.属性名：图书名称
	 * 创建日期:2019-2-20
	 * @param newName java.lang.String
	 */
	public void setName (java.lang.String newName ) {
	 	this.name = newName;
	} 	 
	
	/**
	 * 属性 timeout_length的Getter方法.属性名：超时时长
	 *  创建日期:2019-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getTimeout_length () {
		return timeout_length;
	}
	   
	/**
	 * 属性timeout_length的Setter方法.属性名：超时时长
	 * 创建日期:2019-2-20
	 * @param newTimeout_length java.lang.String
	 */
	public void setTimeout_length (java.lang.String newTimeout_length ) {
	 	this.timeout_length = newTimeout_length;
	} 	 
	
	/**
	 * 属性 price_timeoutrent的Getter方法.属性名：租用超时价格
	 *  创建日期:2019-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getPrice_timeoutrent () {
		return price_timeoutrent;
	}
	   
	/**
	 * 属性price_timeoutrent的Setter方法.属性名：租用超时价格
	 * 创建日期:2019-2-20
	 * @param newPrice_timeoutrent java.lang.String
	 */
	public void setPrice_timeoutrent (java.lang.String newPrice_timeoutrent ) {
	 	this.price_timeoutrent = newPrice_timeoutrent;
	} 	 
	
	/**
	 * 属性 pay_fine的Getter方法.属性名：应缴纳罚款
	 *  创建日期:2019-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getPay_fine () {
		return pay_fine;
	}
	   
	/**
	 * 属性pay_fine的Setter方法.属性名：应缴纳罚款
	 * 创建日期:2019-2-20
	 * @param newPay_fine java.lang.String
	 */
	public void setPay_fine (java.lang.String newPay_fine ) {
	 	this.pay_fine = newPay_fine;
	} 	 
	
	/**
	 * 属性 user_name的Getter方法.属性名：用户名称
	 *  创建日期:2019-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getUser_name () {
		return user_name;
	}
	   
	/**
	 * 属性user_name的Setter方法.属性名：用户名称
	 * 创建日期:2019-2-20
	 * @param newUser_name java.lang.String
	 */
	public void setUser_name (java.lang.String newUser_name ) {
	 	this.user_name = newUser_name;
	} 	 
	
	/**
	 * 属性 payfine_state的Getter方法.属性名：缴纳罚款状态
	 *  创建日期:2019-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getPayfine_state () {
		return payfine_state;
	}
	   
	/**
	 * 属性payfine_state的Setter方法.属性名：缴纳罚款状态
	 * 创建日期:2019-2-20
	 * @param newPayfine_state java.lang.String
	 */
	public void setPayfine_state (java.lang.String newPayfine_state ) {
	 	this.payfine_state = newPayfine_state;
	} 	 
	
	/**
	 * 属性 def1的Getter方法.属性名：备用字段1
	 *  创建日期:2019-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getDef1 () {
		return def1;
	}
	   
	/**
	 * 属性def1的Setter方法.属性名：备用字段1
	 * 创建日期:2019-2-20
	 * @param newDef1 java.lang.String
	 */
	public void setDef1 (java.lang.String newDef1 ) {
	 	this.def1 = newDef1;
	} 	 
	
	/**
	 * 属性 def2的Getter方法.属性名：备用字段2
	 *  创建日期:2019-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getDef2 () {
		return def2;
	}
	   
	/**
	 * 属性def2的Setter方法.属性名：备用字段2
	 * 创建日期:2019-2-20
	 * @param newDef2 java.lang.String
	 */
	public void setDef2 (java.lang.String newDef2 ) {
	 	this.def2 = newDef2;
	} 	 
	
	/**
	 * 属性 def3的Getter方法.属性名：备用字段3
	 *  创建日期:2019-2-20
	 * @return java.lang.String
	 */
	public java.lang.String getDef3 () {
		return def3;
	}
	   
	/**
	 * 属性def3的Setter方法.属性名：备用字段3
	 * 创建日期:2019-2-20
	 * @param newDef3 java.lang.String
	 */
	public void setDef3 (java.lang.String newDef3 ) {
	 	this.def3 = newDef3;
	} 	 
	
	/**
	 * 属性 dr的Getter方法.属性名：dr
	 *  创建日期:2019-2-20
	 * @return java.lang.Integer
	 */
	public java.lang.Integer getDr () {
		return dr;
	}
	   
	/**
	 * 属性dr的Setter方法.属性名：dr
	 * 创建日期:2019-2-20
	 * @param newDr java.lang.Integer
	 */
	public void setDr (java.lang.Integer newDr ) {
	 	this.dr = newDr;
	} 	 
	
	/**
	 * 属性 ts的Getter方法.属性名：ts
	 *  创建日期:2019-2-20
	 * @return java.util.Date
	 */
	public java.util.Date getTs () {
		return ts;
	}
	   
	/**
	 * 属性ts的Setter方法.属性名：ts
	 * 创建日期:2019-2-20
	 * @param newTs java.util.Date
	 */
	public void setTs (java.util.Date newTs ) {
	 	this.ts = newTs;
	} 	 
	
    @Override
    public String getMetaDefinedName() {
        return "PayFine";
    }

    @Override
    public String getNamespace() {
        return "iuap-quickstart";
    }
}