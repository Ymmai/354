<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
String ID=request.getParameter("delid");
if (null!=ID){
	int ret=-1;
	String sql="delete from tb_song Where id=("+Integer.parseInt(ID)+")";
	ret=conn.executeUpdate(sql);
	if(ret==0){
		out.println("<script lanuage='javascript'>alert('ɾ��ʧ��!');history.go(-1);</script>");
	}else{
		out.println("<script lanuage='javascript'>alert('ɾ���ɹ�!');window.location.href='admin-song.jsp';</script>");
	}
}else{
	out.println("<script lanuage='javascript'>alert('���Ĳ�������!');history.go(-1);</script>");
}
%>
