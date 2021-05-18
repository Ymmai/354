<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="ins_member" scope="page" class="com.dao.MemberDaoImpl"/>
<jsp:useBean id="member" scope="request" class="com.model.Member">
<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<html>
<head>
<title>用户注册!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body>
<%
request.setCharacterEncoding("gbk");
String manager=member.getManager();
ResultSet rs=conn.executeQuery("select * from tb_user where manager='"+manager+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('该用户名已经存在，请重新注册！');window.location.href='index.jsp';</script>");
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
          out.println("<script language='javascript'>alert('用户注册成功！');window.location.href='index.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('用户注册失败！');window.location.href='index.jsp';</script>");
        }
}

%>
</body>
</html>
