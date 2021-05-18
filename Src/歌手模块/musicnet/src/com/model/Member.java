package com.model;

public class Member {
  private Integer ID=Integer.valueOf("-1");
  private String manager="";
  private String pwd="";
  private String userFlag="";
  
  public void member(){  //�����
 }

public Integer getID() {
	return ID;
}

public void setID(Integer iD) {
	ID = iD;
}

public String getManager() {
	return manager;
}

public void setManager(String manager) {
	this.manager = manager;
}

public String getPwd() {
	return pwd;
}

public void setPwd(String pwd) {
	this.pwd = pwd;
}

public String getUserFlag() {
	return userFlag;
}

public void setUserFlag(String userFlag) {
	this.userFlag = userFlag;
}

 
}
