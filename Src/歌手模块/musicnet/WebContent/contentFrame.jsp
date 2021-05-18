
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<%@ page contentType="text/html; charset=gbk"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.*"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
	StringBuffer sql = new StringBuffer();
	sql.append("select top 10 id,songName,singer,fileURL,type from tb_song where 1=1");
	sql.append("order by hits desc");
	ResultSet rs_new = conn.executeQuery(sql.toString());
	int ID = 0;
	String songName = "";
	String type = "";
	String fileURL = "";
	String singer = "";
	int hits = 0;
	ResultSet rs_singer = conn.executeQuery("select top 12 id,artistName,type,imgURL from tb_artist where 1=1");
	int artistID = 0;
	String artistName = "";
	String artisttype = "";
	String imgURL = "";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="gbk">
		<title>木鱼音乐</title>
		<link href="css/pt_discover_index.css" type="text/css"
			rel="stylesheet">
	</head>
	<body id="auto-id-hmxzivBOqt0HedNm" style="background: url('image/bg.jpg') no-repeat">
		<div data-module="discover" data-sub="discover" id="g_top"
			class="m-top">
			&nbsp;
		</div>
		<div id="g_nav" class="m-subnav">
			&nbsp;
		</div>
		<div class="n-ban d-flag" id="index-banner"
			style="background-image: url(&quot;images/bg.&quot;); background-repeat: no-repeat;">
			<div class="wrap">
				<div class="ban f-pr" style="z-index: 10;">
					<a hidefocus="true" class="active d-flag" href="#" target=""> <img
							class="d-flag"
							src="image/slider3.jpg"
							id="auto-id-sbao5HdqBk3KZtby"
							style="transition: none; opacity: 1;"> </a>
					<a hidefocus="true" href="javascript:void(0)"
						class="btnl click-flag f-alpha">&lt;</a>
					<a hidefocus="true" href="javascript:void(0)"
						class="btnr click-flag f-alpha">&gt;</a>
					<div class="dots f-cb">
						<a hidefocus="true" href="#" class="pg click-flag pg-flag f-alpha"
							data-index="0"></a>
						<a hidefocus="true" href="#" class="pg click-flag pg-flag f-alpha"
							data-index="1"></a>
						<a hidefocus="true" href="#"
							class="pg click-flag pg-flag f-alpha z-slt" data-index="2"></a>
					</div>
				</div>
				<div class="download f-pr">
					<a id="side-download" href="#" class="btn" hidefocus="true">下载</a>
					<span class="shadow"></span><span class="shadowr"></span>
				</div>
				<%--			</div>--%>
			</div>
			<div id="discover-module" class="g-bd1 f-cb">
				<div class="g-mn1">
					<div class="g-mn1c">
						<div class="g-wrap3">
							<div class="n-rcmd">
								<div class="v-hd2">
									<a href="#" class="tit f-ff2 f-tdn">热门歌手</a>
									<span class="more"><a href="artist.jsp?type=all"
										class="s-fc3">更多</a><i class="cor s-bg s-bg-6">&nbsp;</i> </span>
								</div>

								<ul class="m-cvrlst f-cb">

									<%
										int s1 = 0;
										while (rs_singer.next()) {
											artistID = rs_singer.getInt(1);
											artistName = rs_singer.getString(2);
											imgURL = rs_singer.getString(4);
									%>
									<li>
										<div class="u-cover u-cover-1">
											<a href="artistDetail.jsp?id=<%=artistID%>"><img
													src="images/artist/<%=imgURL%>">
											</a>
										</div>
									</li>
									<%
										s1++;
										}
									%>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="g-sd1">
					<div class="n-dj n-dj-1">
						<h1 class="v-hd3">
							热门歌曲
						</h1>
						<ul class="n-hotdj f-cb" id="hotdj-list">
							<%
								int s = 0;
								while (rs_new.next()) {
									ID = rs_new.getInt(1);
									songName = rs_new.getString(2);
									singer = rs_new.getString(3);
									fileURL = rs_new.getString(4);
									type = rs_new.getString(5);
							%>
							<li>
								<div class="info">
									<p>
										<a
											href='javascript:playA("<%=songName%>","images/song/<%=fileURL%>","<%=ID%>");'
											style="color: #1096A9"><%=songName%></a>
										<sup class="u-icn u-icn-1"></sup>
									</p>
									<p class="f-thide s-fc3">
										歌手：<%=singer%>
									</p>
								</div>
							</li>
							<%
								s++;
								}
							%>
						</ul>
					</div>
				</div>
			</div>
			
			<script type="text/javascript">
window.Gbanners =
[
{
			picUrl : "image/slider1.jpg",
			url : "http://192.168.1.91:8080/04/",
			targetId : "0",
			backgroundUrl : "images/bg.",
			targetType : "3000"
},
{
			picUrl : "image/slider2.jpg",
			url : "http://192.168.1.91:8080/04/",
			targetId : "0",
			backgroundUrl : "images/bg.",
			targetType : "3000"
}
 ];
</script>
			<script src="js/core.js" type="text/javascript">
</script>
			<script src="js/pt_discover_index.js" type="text/javascript">
</script>
			<script>
function playA(name, media, id) {
	window.parent.addMyList(id);
	window.parent.playMusic(name, media);
}
</script>
	</body>
</html>