<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path;%>
<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.*"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
	String sName = request.getParameter("songName");
	String title = "";

	StringBuffer sql = new StringBuffer();
	sql.append("select * from tb_song where 1=1");
	if (null ==sName ) {
		sName="";
	}
     
    sql.append(" and songName like '%" + sName + "%' ");
     
	sql.append(" order by hits desc,id desc ");

	ResultSet rs = conn.executeQuery(sql.toString());
	rs.last();
	int rowCount = rs.getRow() ;
	if(rowCount==0){
		out.println("<script lanuage='javascript'>alert('没有搜索结果!');window.location.href='search.jsp';</script>");
		return;
	}
	rs.first();
	int ID = 0;
	String songName = "";
	String type = "";
	String fileURL = "";
	String singer = "";
	int hits = 0;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="gbk">
		<title>木鱼音乐</title>
		<link href="css/pt_discover_index.css" type="text/css"
			rel="stylesheet">
		<link href="css/pt_frame.css" type="text/css" rel="stylesheet">
		<link href="css/pt_search_index.css" type="text/css" rel="stylesheet">
	</head>
	<body id="auto-id-ws7DxlhbPlyHTsnX" style="background: url('image/bg.jpg') repeat-y">
		<div data-module="discover" data-sub="playlist" id="g_top"
			class="m-top">
			&nbsp;
		</div>
		<div id="g_nav" class="m-subnav">
			&nbsp;
		</div>
		<script>
try {
	top.matchNav("discover", "playlist");
} catch (e) {
}
</script>
		<div class="g-bd" id="m-disc-pl-c">

			<div class="g-wrap n-srch">
			<div class="pgsrch f-pr j-suggest" id="auto-id-ErvdJrthwDvbXbzT">
				<form id="searchForm" action="search.jsp">
				<input  type="text" name="songName" class="srch j-flag" value="">
				<a hidefocus="true" href="javascript:document.getElementById('searchForm').submit();" class="btn j-flag"
					title="搜索" >搜索</a>
				</form>	
			</div>
			</div>

			<div class="g-wrap p-pl f-pr">
			
				<div class="u-title f-cb">
					<h3>
						<span class="f-ff2 d-flag">搜索结果</span>		
					</h3>

				</div>
				<div id="m-search">
					
					<div class="ztag j-flag" id="auto-id-oRFIQkCKNyCtcR5R">
						<div class="n-srchrst">
							<div class="srchsongst">
							<%
							
								for (int i = 1; i <=rowCount; i++) {
									ID = rs.getInt("id");
									songName = rs.getString("songName");
									type = rs.getString("type");
									fileURL = rs.getString("fileURL");
									singer = rs.getString("singer");
									hits = rs.getInt("hits");
									if (type.equals("1")) {
										type = "华语";
									}
									if (type.equals("2")) {
										type = "欧美";
									}
									if (type.equals("3")) {
										type = "日语";
									}
									if (type.equals("4")) {
										type = "韩语";
									}
									if (type.equals("5")) {
										type = "其他";
									}
							%>
												
								<div class="item f-cb h-flag even ">
									<div class="td">
										<div class="hd">
											<a class="ply " title="播放"
												onclick='playA("<%=songName%>","images/song/<%=fileURL%>","<%=ID%>");'></a>
										</div>
									</div>
									<div class="td w0">
										<div class="sn">
											<div class="text">
												<b title="<%=songName%>"><span
														class="s-fc7"><%=songName%></span></b> 
											</div>
										</div>
									</div>
									<div class="td">
										<div class="opt hshow">
											<span onclick='addShow("<%=ID%>")' class="icn icn-fav" title="收藏"></span>
										</div>
									</div>
									<div class="td w1">
										<div class="text">
											<%=singer%>
										</div>
									</div>
									<div class="td w1"> 
										<%=type%>
									</div>
									
									<div class="td">
										播放：<%=hits%>次
									</div>
								</div>
								 <%
								 	try {
								 			if (!rs.next()) {
								 				break;
								 			}
								 		} catch (Exception e) {
								 		}
								 	}
								 %>  
								
							</div>
						</div> 
					</div>
					
					<div class="j-flag"></div>
				</div>

			</div>
		</div>
		<%--<div class="g-ft">
			<div class="m-ft m-ft-0">
				<div class="wrap">
					<a class="logo f-tdn" href="http://www.mingrisoft.com/"
						target="_blank"> <span class="s-fc3">吉林省明日科技有限公司</span>
					 </a>
					
					<div class="copy">
						<a href="http://www.mingrisoft.com/" target="_blank">关于我们</a><span>-</span>
						<a href="#">客户服务</a><span>-</span>
						<a href="#">服务条款</a><span>-</span>
						
					</div>
				</div>
			</div>
		</div>
		
		--%><script
			src="//s3.music.126.net/sep/s/2/core.js?d24ad53fbb6bb9dcbf17208e10101287"
			type="text/javascript">
</script>
		<script
			src="//s3.music.126.net/sep/s/2/pt_discover_playlist.js?b605919fa60b3e2a105132fdedc5ceb5"
			type="text/javascript">
</script>
<script>
function playA(name,media,id){
	window.parent.addMyList(id);
	window.parent.playMusic(name,media);
}
function addShow(id){
	window.parent.addShow(id);	
}
</script>
	</body>
</html>