<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="ins_member" scope="request" class="com.dao.MemberDaoImpl"/>
<jsp:useBean id="member" scope="request" class="com.model.Member">
<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<html>
<head>
<title>密码修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body>
<%
	request.setCharacterEncoding("gbk");
	Integer id = member.getID();
	String pwd = member.getPwd();
	String psNew = request.getParameter("psNew");
	ResultSet rs = conn.executeQuery("select * from tb_user where ID='" + id+ "'");
	String pwdSql="";
		while (rs.next()) {
			pwdSql = rs.getString("pwd");
		}
		
		if (!pwd.equals(pwdSql)) {
			out.println("<script language='javascript'>alert('原密码不正确！');window.location.href='index.jsp';</script>");
			return;
		}
		
		int ret = 0;
		member.setPwd(psNew);
		ret = ins_member.update(member);
		
		if (ret != 0) {
		    session.setAttribute("username",member.getManager());
			out.println("<script language='javascript'>alert('密码修改成功！请重新登录！');window.location.href='index.jsp';</script>");
		} else {
			out.println("<script language='javascript'>alert('密码修改失败！');window.location.href='index.jsp';</script>");
		}
%>
</body>
</html>
