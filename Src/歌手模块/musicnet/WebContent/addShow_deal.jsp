<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%

String ID=request.getParameter("id");
Integer userID = (Integer) session.getAttribute("userID");

if (null!=ID){
	int ret=-1;
	int s1=Integer.parseInt(ID);
	//int s2=Integer.parseInt(userID);
	String sql = "Insert into tb_userSong (songId,userId) values(" +s1 + "," + userID+")";
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
