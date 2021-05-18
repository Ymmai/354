<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="songDao" scope="request" class="com.dao.SongDaoImpl"/>
<jsp:useBean id="song" scope="request" class="com.model.Song">
<jsp:setProperty name="song" property="*"/>
</jsp:useBean>
<html>
<head>
<title>新增歌手</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body>
<%
request.setCharacterEncoding("gbk");
String songName=song.getSongName();

ResultSet rs=conn.executeQuery("select * from tb_song where songName='"+songName+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('该歌曲已经存在，请重新添加！');history.go(-1);</script>");
}else{
	int ret=0;
        ret=songDao.insert(song);
	if (ret!=0){
          out.println("<script language='javascript'>alert('歌曲添加成功！');window.location.href='admin-song.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('歌曲添加失败！');history.go(-1);</script>");
        }
}
%>
</body>
</html>
