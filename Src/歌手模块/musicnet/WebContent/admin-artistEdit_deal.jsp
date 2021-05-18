<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="artistDao" scope="request" class="com.dao.ArtistDaoImpl"/>
<jsp:useBean id="artist" scope="request" class="com.model.Artist">
<jsp:setProperty name="artist" property="*"/>
</jsp:useBean>
<html>
<head>
<title>信息修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body>
		<%
			request.setCharacterEncoding("gbk");
			Integer id = artist.getID();

			int ret = 0;
			ret = artistDao.update(artist);
			if (ret != 0) {
				out.println("<script language='javascript'>alert('修改成功！');window.location.href='admin-artist.jsp';</script>");
			} else {
				out.println("<script language='javascript'>alert('修改失败！');history.go(-1);</script>");
			}
		%>
	</body>
</html>
