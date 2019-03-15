package com.yonyou.iuap.system.entity;

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
 *  创建日期:2019-3-15
 * @author 
 * @version 
 */
@Entity(namespace = "iuap-quickstart",name = "loginLog")
@Table(name = "loginLog")
public class LoginLog extends BaseEntity{
	
    @Id
    @GeneratedValue(strategy = Stragegy.UUID, moudle = "")  
    @Column(name = "id")
    private java.lang.String id;
      
    @Column(name = "name")
    private java.lang.String name;
      
    @Column(name = "login_time")
    private java.lang.String login_time;
      
    @Column(name = "login_type")
    private java.lang.String login_type;
      
    @Column(name = "login_ip")
    private java.lang.String login_ip;
      
    @Column(name = "def1")
    private java.lang.String def1;
      
    @Column(name = "def2")
    private java.lang.String def2;
      
    @Column(name = "dr")
    private java.lang.Integer dr = 0;
      
    @Column(name = "ts")
    private java.util.Date ts;
        
	
	

	/**
	 * 属性 id的Getter方法.属性名：主键
	 *  创建日期:2019-3-15
	 * @return java.lang.String
	 */
	public java.lang.String getId () {
		return id;
	}
	   
	/**
	 * 属性id的Setter方法.属性名：主键
	 * 创建日期:2019-3-15
	 * @param newId java.lang.String
	 */
	public void setId (java.lang.String newId ) {
	 	this.id = newId;
	} 	 
	
	/**
	 * 属性 name的Getter方法.属性名：用户姓名
	 *  创建日期:2019-3-15
	 * @return java.lang.String
	 */
	public java.lang.String getName () {
		return name;
	}
	   
	/**
	 * 属性name的Setter方法.属性名：用户姓名
	 * 创建日期:2019-3-15
	 * @param newName java.lang.String
	 */
	public void setName (java.lang.String newName ) {
	 	this.name = newName;
	} 	 
	
	/**
	 * 属性 login_time的Getter方法.属性名：登录时间
	 *  创建日期:2019-3-15
	 * @return java.lang.String
	 */
	public java.lang.String getLogin_time () {
		return login_time;
	}
	   
	/**
	 * 属性login_time的Setter方法.属性名：登录时间
	 * 创建日期:2019-3-15
	 * @param newLogin_time java.lang.String
	 */
	public void setLogin_time (java.lang.String newLogin_time ) {
	 	this.login_time = newLogin_time;
	} 	 
	
	/**
	 * 属性 login_type的Getter方法.属性名：登录类型
	 *  创建日期:2019-3-15
	 * @return java.lang.String
	 */
	public java.lang.String getLogin_type () {
		return login_type;
	}
	   
	/**
	 * 属性login_type的Setter方法.属性名：登录类型
	 * 创建日期:2019-3-15
	 * @param newLogin_type java.lang.String
	 */
	public void setLogin_type (java.lang.String newLogin_type ) {
	 	this.login_type = newLogin_type;
	} 	 
	
	/**
	 * 属性 login_ip的Getter方法.属性名：登录ip
	 *  创建日期:2019-3-15
	 * @return java.lang.String
	 */
	public java.lang.String getLogin_ip () {
		return login_ip;
	}
	   
	/**
	 * 属性login_ip的Setter方法.属性名：登录ip
	 * 创建日期:2019-3-15
	 * @param newLogin_ip java.lang.String
	 */
	public void setLogin_ip (java.lang.String newLogin_ip ) {
	 	this.login_ip = newLogin_ip;
	} 	 
	
	/**
	 * 属性 def1的Getter方法.属性名：预留字段1
	 *  创建日期:2019-3-15
	 * @return java.lang.String
	 */
	public java.lang.String getDef1 () {
		return def1;
	}
	   
	/**
	 * 属性def1的Setter方法.属性名：预留字段1
	 * 创建日期:2019-3-15
	 * @param newDef1 java.lang.String
	 */
	public void setDef1 (java.lang.String newDef1 ) {
	 	this.def1 = newDef1;
	} 	 
	
	/**
	 * 属性 def2的Getter方法.属性名：预留字段2
	 *  创建日期:2019-3-15
	 * @return java.lang.String
	 */
	public java.lang.String getDef2 () {
		return def2;
	}
	   
	/**
	 * 属性def2的Setter方法.属性名：预留字段2
	 * 创建日期:2019-3-15
	 * @param newDef2 java.lang.String
	 */
	public void setDef2 (java.lang.String newDef2 ) {
	 	this.def2 = newDef2;
	} 	 
	
	/**
	 * 属性 dr的Getter方法.属性名：dr
	 *  创建日期:2019-3-15
	 * @return java.lang.Integer
	 */
	public java.lang.Integer getDr () {
		return dr;
	}
	   
	/**
	 * 属性dr的Setter方法.属性名：dr
	 * 创建日期:2019-3-15
	 * @param newDr java.lang.Integer
	 */
	public void setDr (java.lang.Integer newDr ) {
	 	this.dr = newDr;
	} 	 
	
	/**
	 * 属性 ts的Getter方法.属性名：ts
	 *  创建日期:2019-3-15
	 * @return java.util.Date
	 */
	public java.util.Date getTs () {
		return ts;
	}
	   
	/**
	 * 属性ts的Setter方法.属性名：ts
	 * 创建日期:2019-3-15
	 * @param newTs java.util.Date
	 */
	public void setTs (java.util.Date newTs ) {
	 	this.ts = newTs;
	} 	 
	
    @Override
    public String getMetaDefinedName() {
        return "loginLog";
    }

    @Override
    public String getNamespace() {
        return "iuap-quickstart";
    }
}