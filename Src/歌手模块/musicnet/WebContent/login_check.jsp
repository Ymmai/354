<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String manager=request.getParameter("manager");//�˴�������б���ת�����������������û���ʱ����������
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
			out.println("<script language='javascript'>alert('��������û�������������������Ա��ϵ!');window.location.href='index.jsp';</script>");
		}
	}else{
			out.println("<script language='javascript'>alert('��������û�������������������Ա��ϵ!');window.location.href='index.jsp';</script>");
	}
}catch(Exception e){
	out.println("<script language='javascript'>alert('���Ĳ�������!');window.location.href='index.jsp';</script>");
}
conn.close();
%>
