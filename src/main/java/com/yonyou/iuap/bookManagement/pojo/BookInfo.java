package com.yonyou.iuap.bookManagement.pojo;

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
 *  创建日期:2019-1-17
 * @author 
 * @version 
 */
@Entity(namespace = "iuap-quickstart",name = "BookInfo")
@Table(name = "bookinfo")
public class BookInfo extends BaseEntity{
	
    @Id
    @GeneratedValue(strategy = Stragegy.UUID, moudle = "")  
    @Column(name = "id")
    private java.lang.String id;
      
    @Column(name = "name")
    private java.lang.String name;
      
    @Column(name = "code")
    private java.lang.String code;
      
    @Column(name = "publish")
    private java.lang.String publish;
      
    @Column(name = "price_rent")
    private java.lang.String price_rent;
      
    @Column(name = "pk_booktype")
    private java.lang.String pk_booktype;
      
    @Column(name = "booktype_name")
    private java.lang.String booktype_name;
      
    @Column(name = "def1")
    private java.lang.String def1;//热度
      
    @Column(name = "def2")
    private java.lang.String def2;
      
    @Column(name = "dr")
    private java.lang.Integer dr = 0;
      
    @Column(name = "ts")
    private java.util.Date ts;
        
	
	

	/**
	 * 属性 id的Getter方法.属性名：主键
	 *  创建日期:2019-1-17
	 * @return java.lang.String
	 */
	public java.lang.String getId () {
		return id;
	}
	   
	/**
	 * 属性id的Setter方法.属性名：主键
	 * 创建日期:2019-1-17
	 * @param newId java.lang.String
	 */
	public void setId (java.lang.String newId ) {
	 	this.id = newId;
	} 	 
	
	/**
	 * 属性 name的Getter方法.属性名：图书名称
	 *  创建日期:2019-1-17
	 * @return java.lang.String
	 */
	public java.lang.String getName () {
		return name;
	}
	   
	/**
	 * 属性name的Setter方法.属性名：图书名称
	 * 创建日期:2019-1-17
	 * @param newName java.lang.String
	 */
	public void setName (java.lang.String newName ) {
	 	this.name = newName;
	} 	 
	
	/**
	 * 属性 code的Getter方法.属性名：图书编码
	 *  创建日期:2019-1-17
	 * @return java.lang.String
	 */
	public java.lang.String getCode () {
		return code;
	}
	   
	/**
	 * 属性code的Setter方法.属性名：图书编码
	 * 创建日期:2019-1-17
	 * @param newCode java.lang.String
	 */
	public void setCode (java.lang.String newCode ) {
	 	this.code = newCode;
	} 	 
	
	/**
	 * 属性 publish的Getter方法.属性名：出版社
	 *  创建日期:2019-1-17
	 * @return java.lang.String
	 */
	public java.lang.String getPublish () {
		return publish;
	}
	   
	/**
	 * 属性publish的Setter方法.属性名：出版社
	 * 创建日期:2019-1-17
	 * @param newPublish java.lang.String
	 */
	public void setPublish (java.lang.String newPublish ) {
	 	this.publish = newPublish;
	} 	 
	
	/**
	 * 属性 price_rent的Getter方法.属性名：租用价格
	 *  创建日期:2019-1-17
	 * @return java.lang.String
	 */
	public java.lang.String getPrice_rent () {
		return price_rent;
	}
	   
	/**
	 * 属性price_rent的Setter方法.属性名：租用价格
	 * 创建日期:2019-1-17
	 * @param newPrice_rent java.lang.String
	 */
	public void setPrice_rent (java.lang.String newPrice_rent ) {
	 	this.price_rent = newPrice_rent;
	} 	 
	
	/**
	 * 属性 pk_booktype的Getter方法.属性名：类别pk
	 *  创建日期:2019-1-17
	 * @return java.lang.String
	 */
	public java.lang.String getPk_booktype () {
		return pk_booktype;
	}
	   
	/**
	 * 属性pk_booktype的Setter方法.属性名：类别pk
	 * 创建日期:2019-1-17
	 * @param newPk_booktype java.lang.String
	 */
	public void setPk_booktype (java.lang.String newPk_booktype ) {
	 	this.pk_booktype = newPk_booktype;
	} 	 
	
	/**
	 * 属性 booktype_name的Getter方法.属性名：类别名称
	 *  创建日期:2019-1-17
	 * @return java.lang.String
	 */
	public java.lang.String getBooktype_name () {
		return booktype_name;
	}
	   
	/**
	 * 属性booktype_name的Setter方法.属性名：类别名称
	 * 创建日期:2019-1-17
	 * @param newBooktype_name java.lang.String
	 */
	public void setBooktype_name (java.lang.String newBooktype_name ) {
	 	this.booktype_name = newBooktype_name;
	} 	 
	
	/**
	 * 属性 def1的Getter方法.属性名：预留字段1
	 *  创建日期:2019-1-17
	 * @return java.lang.String
	 */
	public java.lang.String getDef1 () {
		return def1;
	}
	   
	/**
	 * 属性def1的Setter方法.属性名：预留字段1
	 * 创建日期:2019-1-17
	 * @param newDef1 java.lang.String
	 */
	public void setDef1 (java.lang.String newDef1 ) {
	 	this.def1 = newDef1;
	} 	 
	
	/**
	 * 属性 def2的Getter方法.属性名：预留字段2
	 *  创建日期:2019-1-17
	 * @return java.lang.String
	 */
	public java.lang.String getDef2 () {
		return def2;
	}
	   
	/**
	 * 属性def2的Setter方法.属性名：预留字段2
	 * 创建日期:2019-1-17
	 * @param newDef2 java.lang.String
	 */
	public void setDef2 (java.lang.String newDef2 ) {
	 	this.def2 = newDef2;
	} 	 
	
	/**
	 * 属性 dr的Getter方法.属性名：dr
	 *  创建日期:2019-1-17
	 * @return java.lang.Integer
	 */
	public java.lang.Integer getDr () {
		return dr;
	}
	   
	/**
	 * 属性dr的Setter方法.属性名：dr
	 * 创建日期:2019-1-17
	 * @param newDr java.lang.Integer
	 */
	public void setDr (java.lang.Integer newDr ) {
	 	this.dr = newDr;
	} 	 
	
	/**
	 * 属性 ts的Getter方法.属性名：ts
	 *  创建日期:2019-1-17
	 * @return java.util.Date
	 */
	public java.util.Date getTs () {
		return ts;
	}
	   
	/**
	 * 属性ts的Setter方法.属性名：ts
	 * 创建日期:2019-1-17
	 * @param newTs java.util.Date
	 */
	public void setTs (java.util.Date newTs ) {
	 	this.ts = newTs;
	} 	 
	
    @Override
    public String getMetaDefinedName() {
        return "BookInfo";
    }

    @Override
    public String getNamespace() {
        return "iuap-quickstart";
    }
}