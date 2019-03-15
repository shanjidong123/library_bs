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
 *  创建日期:2019-1-16
 * @author 
 * @version 
 */
@Entity(namespace = "iuap-quickstart",name = "bookType")
@Table(name = "bookType")
public class BookType extends BaseEntity{
	
    @Id
    @GeneratedValue(strategy = Stragegy.UUID, moudle = "")  
    @Column(name = "id")
    private java.lang.String id;
      
    @Column(name = "code")
    private java.lang.String code;
      
    @Column(name = "name")
    private java.lang.String name;
      
    @Column(name = "parent_id")
    private java.lang.String parent_id;
      
    @Column(name = "parent_id_name")
    private java.lang.String parent_id_name;
      
    @Column(name = "sort")
    private java.lang.String sort;
      
    @Column(name = "add_person")
    private java.lang.String add_person;
      
    @Column(name = "book_num")
    private java.lang.String book_num;
      
    @Column(name = "def1")
    private java.lang.String def1;
      
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
	 *  创建日期:2019-1-16
	 * @return java.lang.String
	 */
	public java.lang.String getId () {
		return id;
	}
	   
	/**
	 * 属性id的Setter方法.属性名：主键
	 * 创建日期:2019-1-16
	 * @param newId java.lang.String
	 */
	public void setId (java.lang.String newId ) {
	 	this.id = newId;
	} 	 
	
	/**
	 * 属性 code的Getter方法.属性名：编码
	 *  创建日期:2019-1-16
	 * @return java.lang.String
	 */
	public java.lang.String getCode () {
		return code;
	}
	   
	/**
	 * 属性code的Setter方法.属性名：编码
	 * 创建日期:2019-1-16
	 * @param newCode java.lang.String
	 */
	public void setCode (java.lang.String newCode ) {
	 	this.code = newCode;
	} 	 
	
	/**
	 * 属性 name的Getter方法.属性名：名称
	 *  创建日期:2019-1-16
	 * @return java.lang.String
	 */
	public java.lang.String getName () {
		return name;
	}
	   
	/**
	 * 属性name的Setter方法.属性名：名称
	 * 创建日期:2019-1-16
	 * @param newName java.lang.String
	 */
	public void setName (java.lang.String newName ) {
	 	this.name = newName;
	} 	 
	
	/**
	 * 属性 parent_id的Getter方法.属性名：上级ID
	 *  创建日期:2019-1-16
	 * @return java.lang.String
	 */
	public java.lang.String getParent_id () {
		return parent_id;
	}
	   
	/**
	 * 属性parent_id的Setter方法.属性名：上级ID
	 * 创建日期:2019-1-16
	 * @param newParent_id java.lang.String
	 */
	public void setParent_id (java.lang.String newParent_id ) {
	 	this.parent_id = newParent_id;
	} 	 
	
	/**
	 * 属性 parent_id_name的Getter方法.属性名：上级名称
	 *  创建日期:2019-1-16
	 * @return java.lang.String
	 */
	public java.lang.String getParent_id_name () {
		return parent_id_name;
	}
	   
	/**
	 * 属性parent_id_name的Setter方法.属性名：上级名称
	 * 创建日期:2019-1-16
	 * @param newParent_id_name java.lang.String
	 */
	public void setParent_id_name (java.lang.String newParent_id_name ) {
	 	this.parent_id_name = newParent_id_name;
	} 	 
	
	/**
	 * 属性 sort的Getter方法.属性名：排序
	 *  创建日期:2019-1-16
	 * @return java.lang.String
	 */
	public java.lang.String getSort () {
		return sort;
	}
	   
	/**
	 * 属性sort的Setter方法.属性名：排序
	 * 创建日期:2019-1-16
	 * @param newSort java.lang.String
	 */
	public void setSort (java.lang.String newSort ) {
	 	this.sort = newSort;
	} 	 
	
	/**
	 * 属性 add_person的Getter方法.属性名：添加人
	 *  创建日期:2019-1-16
	 * @return java.lang.String
	 */
	public java.lang.String getAdd_person () {
		return add_person;
	}
	   
	/**
	 * 属性add_person的Setter方法.属性名：添加人
	 * 创建日期:2019-1-16
	 * @param newAdd_person java.lang.String
	 */
	public void setAdd_person (java.lang.String newAdd_person ) {
	 	this.add_person = newAdd_person;
	} 	 
	
	/**
	 * 属性 book_num的Getter方法.属性名：包含图书数量
	 *  创建日期:2019-1-16
	 * @return java.lang.String
	 */
	public java.lang.String getBook_num () {
		return book_num;
	}
	   
	/**
	 * 属性book_num的Setter方法.属性名：包含图书数量
	 * 创建日期:2019-1-16
	 * @param newBook_num java.lang.String
	 */
	public void setBook_num (java.lang.String newBook_num ) {
	 	this.book_num = newBook_num;
	} 	 
	
	/**
	 * 属性 def1的Getter方法.属性名：attrDisplayName7
	 *  创建日期:2019-1-16
	 * @return java.lang.String
	 */
	public java.lang.String getDef1 () {
		return def1;
	}
	   
	/**
	 * 属性def1的Setter方法.属性名：attrDisplayName7
	 * 创建日期:2019-1-16
	 * @param newDef1 java.lang.String
	 */
	public void setDef1 (java.lang.String newDef1 ) {
	 	this.def1 = newDef1;
	} 	 
	
	/**
	 * 属性 def2的Getter方法.属性名：attrDisplayName8
	 *  创建日期:2019-1-16
	 * @return java.lang.String
	 */
	public java.lang.String getDef2 () {
		return def2;
	}
	   
	/**
	 * 属性def2的Setter方法.属性名：attrDisplayName8
	 * 创建日期:2019-1-16
	 * @param newDef2 java.lang.String
	 */
	public void setDef2 (java.lang.String newDef2 ) {
	 	this.def2 = newDef2;
	} 	 
	
	/**
	 * 属性 def3的Getter方法.属性名：attrDisplayName10
	 *  创建日期:2019-1-16
	 * @return java.lang.String
	 */
	public java.lang.String getDef3 () {
		return def3;
	}
	   
	/**
	 * 属性def3的Setter方法.属性名：attrDisplayName10
	 * 创建日期:2019-1-16
	 * @param newDef3 java.lang.String
	 */
	public void setDef3 (java.lang.String newDef3 ) {
	 	this.def3 = newDef3;
	} 	 
	
	/**
	 * 属性 dr的Getter方法.属性名：dr
	 *  创建日期:2019-1-16
	 * @return java.lang.Integer
	 */
	public java.lang.Integer getDr () {
		return dr;
	}
	   
	/**
	 * 属性dr的Setter方法.属性名：dr
	 * 创建日期:2019-1-16
	 * @param newDr java.lang.Integer
	 */
	public void setDr (java.lang.Integer newDr ) {
	 	this.dr = newDr;
	} 	 
	
	/**
	 * 属性 ts的Getter方法.属性名：ts
	 *  创建日期:2019-1-16
	 * @return java.util.Date
	 */
	public java.util.Date getTs () {
		return ts;
	}
	   
	/**
	 * 属性ts的Setter方法.属性名：ts
	 * 创建日期:2019-1-16
	 * @param newTs java.util.Date
	 */
	public void setTs (java.util.Date newTs ) {
	 	this.ts = newTs;
	} 	 
	
    @Override
    public String getMetaDefinedName() {
        return "bookType";
    }

    @Override
    public String getNamespace() {
        return "iuap-quickstart";
    }
}