<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="ins_member" scope="page" class="com.dao.MemberDaoImpl"/>
<jsp:useBean id="member" scope="request" class="com.model.Member">
<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<html>
<head>
<title>�û�ע��!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body>
<%
request.setCharacterEncoding("gbk");
String manager=member.getManager();
ResultSet rs=conn.executeQuery("select * from tb_user where manager='"+manager+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('���û����Ѿ����ڣ�������ע�ᣡ');window.location.href='index.jsp';</script>");
}else{
	int ret=0;
        ret=ins_member.insert(member);
	if (ret!=0){
		  ResultSet rsId=conn.executeQuery("select * from tb_user where manager='"+manager+"'");
		  if(rsId.next()){
			  session.setAttribute("userID",rsId.getInt("id"));	  
		  }
		  session.setAttribute("username",manager);
		  
		  session.setAttribute("userFlag","0");
          out.println("<script language='javascript'>alert('�û�ע��ɹ���');window.location.href='index.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('�û�ע��ʧ�ܣ�');window.location.href='index.jsp';</script>");
        }
}

%>
</body>
</html>
