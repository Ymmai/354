<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String manager=request.getParameter("manager");//此处必须进行编码转换，否则输入中文用户名时将出现乱码
try{
	ResultSet rs=conn.executeQuery("select * from tb_user where manager='"+manager+"'");
	if(rs.next()){
		String PWD=request.getParameter("PWD");
		if(PWD.equals(rs.getString("pwd"))){
			session.setAttribute("username",manager);
			session.setAttribute("userID",rs.getInt("id"));
			session.setAttribute("userFlag",rs.getString("userFlag"));
			response.sendRedirect("index.jsp");
		}else{
			out.println("<script language='javascript'>alert('您输入的用户名或密码错误，请与管理员联系!');window.location.href='index.jsp';</script>");
		}
	}else{
			out.println("<script language='javascript'>alert('您输入的用户名或密码错误，请与管理员联系!');window.location.href='index.jsp';</script>");
	}
}catch(Exception e){
	out.println("<script language='javascript'>alert('您的操作有误!');window.location.href='index.jsp';</script>");
}
conn.close();
%>
