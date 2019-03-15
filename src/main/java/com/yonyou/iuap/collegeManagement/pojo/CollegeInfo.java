package com.yonyou.iuap.collegeManagement.pojo;

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
@Entity(namespace = "iuap-quickstart",name = "CollegeInfo")
@Table(name = "CollegeInfo")
public class CollegeInfo extends BaseEntity{
	
    @Id
    @GeneratedValue(strategy = Stragegy.UUID, moudle = "")  
    @Column(name = "id")
    private java.lang.String id;
      
    @Column(name = "name")
    private java.lang.String name;
      
    @Column(name = "code")
    private java.lang.String code;
      
    @Column(name = "pk_collegetype")
    private java.lang.String pk_collegetype;
      
    @Column(name = "collegetype_name")
    private java.lang.String collegetype_name;
      
    @Column(name = "login_status")
    private java.lang.String login_status;
      
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
	 * 属性 name的Getter方法.属性名：学生姓名
	 *  创建日期:2019-3-15
	 * @return java.lang.String
	 */
	public java.lang.String getName () {
		return name;
	}
	   
	/**
	 * 属性name的Setter方法.属性名：学生姓名
	 * 创建日期:2019-3-15
	 * @param newName java.lang.String
	 */
	public void setName (java.lang.String newName ) {
	 	this.name = newName;
	} 	 
	
	/**
	 * 属性 code的Getter方法.属性名：学生学号
	 *  创建日期:2019-3-15
	 * @return java.lang.String
	 */
	public java.lang.String getCode () {
		return code;
	}
	   
	/**
	 * 属性code的Setter方法.属性名：学生学号
	 * 创建日期:2019-3-15
	 * @param newCode java.lang.String
	 */
	public void setCode (java.lang.String newCode ) {
	 	this.code = newCode;
	} 	 
	
	/**
	 * 属性 pk_collegetype的Getter方法.属性名：类别pk
	 *  创建日期:2019-3-15
	 * @return java.lang.String
	 */
	public java.lang.String getPk_collegetype () {
		return pk_collegetype;
	}
	   
	/**
	 * 属性pk_collegetype的Setter方法.属性名：类别pk
	 * 创建日期:2019-3-15
	 * @param newPk_collegetype java.lang.String
	 */
	public void setPk_collegetype (java.lang.String newPk_collegetype ) {
	 	this.pk_collegetype = newPk_collegetype;
	} 	 
	
	/**
	 * 属性 collegetype_name的Getter方法.属性名：类别名称
	 *  创建日期:2019-3-15
	 * @return java.lang.String
	 */
	public java.lang.String getCollegetype_name () {
		return collegetype_name;
	}
	   
	/**
	 * 属性collegetype_name的Setter方法.属性名：类别名称
	 * 创建日期:2019-3-15
	 * @param newCollegetype_name java.lang.String
	 */
	public void setCollegetype_name (java.lang.String newCollegetype_name ) {
	 	this.collegetype_name = newCollegetype_name;
	} 	 
	
	/**
	 * 属性 login_status的Getter方法.属性名：登录授权状态
	 *  创建日期:2019-3-15
	 * @return java.lang.String
	 */
	public java.lang.String getLogin_status () {
		return login_status;
	}
	   
	/**
	 * 属性login_status的Setter方法.属性名：登录授权状态
	 * 创建日期:2019-3-15
	 * @param newLogin_status java.lang.String
	 */
	public void setLogin_status (java.lang.String newLogin_status ) {
	 	this.login_status = newLogin_status;
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
        return "CollegeInfo";
    }

    @Override
    public String getNamespace() {
        return "iuap-quickstart";
    }
}