<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="artistDao" scope="request" class="com.dao.ArtistDaoImpl"/>
<jsp:useBean id="artist" scope="request" class="com.model.Artist">
<jsp:setProperty name="artist" property="*"/>
</jsp:useBean>
<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%
request.setCharacterEncoding("gbk");
String artistName=artist.getArtistName();

ResultSet rs=conn.executeQuery("select * from tb_artist where artistName='"+artistName+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('�ø����Ѿ����ڣ���������ӣ�');history.go(-1);</script>");
}else{
	int ret=0;
        ret=artistDao.insert(artist);
	if (ret!=0){
          out.println("<script language='javascript'>alert('������ӳɹ���');window.location.href='admin-artist.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('�������ʧ�ܣ�');history.go(-1);</script>");
        }
}
%>
</body>
</html>
