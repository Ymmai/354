<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%

String ID=request.getParameter("id");
if (null!=ID){
	int ret=-1;
	String sql="update tb_song set hits=hits+1 Where id=("+Integer.parseInt(ID)+")";
	ret=conn.executeUpdate(sql);
	if(ret==0){
		response.getWriter().write('0');
	}else{
		response.getWriter().write('1');
	}
}else{
	response.getWriter().write('2');
}
%>
