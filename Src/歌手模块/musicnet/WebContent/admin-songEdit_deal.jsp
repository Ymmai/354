<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="songDao" scope="request" class="com.dao.SongDaoImpl"/>
<jsp:useBean id="song" scope="request" class="com.model.Song">
<jsp:setProperty name="song" property="*"/>
</jsp:useBean>
<html>
<head>
<title>��Ϣ�޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body>
		<%
			request.setCharacterEncoding("gbk");
			Integer id = song.getID();

			int ret = 0;
			ret = songDao.update(song);
			if (ret != 0) {
				out.println("<script language='javascript'>alert('�޸ĳɹ���');window.location.href='admin-song.jsp';</script>");
			} else {
				out.println("<script language='javascript'>alert('�޸�ʧ�ܣ�');history.go(-1);</script>");
			}
		%>
	</body>
</html>
