<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path;%>
<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.*"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
	String artistType = request.getParameter("type");
	String title = "";
	if (artistType.equals("all")) {
		title = "ȫ��";
	}
	if (artistType.equals("1")) {
		title = "����";
	}
	if (artistType.equals("2")) {
		title = "ŷ��";
	}
	if (artistType.equals("3")) {
		title = "�ձ�";
	}
	if (artistType.equals("4")) {
		title = "����";
	}
	if (artistType.equals("5")) {
		title = "����";
	}
	StringBuffer sql = new StringBuffer();
	sql.append("select * from tb_song where 1=1");
	if (null != artistType && !artistType.equals("all")) {
		sql.append(" and type='" + artistType + "' ");
	}

	sql.append("order by hits desc,id desc ");

	ResultSet rs = conn.executeQuery(sql.toString());
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
		<title>���������</title>
		<link href="css/pt_discover_index.css" type="text/css"
			rel="stylesheet">
		<link href="css/pt_frame.css" type="text/css" rel="stylesheet">
	</head>
	<body id="auto-id-ws7DxlhbPlyHTsnX" style="background: url('image/bg.jpg') no-repeat">
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
		<div class="g-bd" id="m-disc-pl-c" style="background: url(image/bg-middle.png) repeat-y 100% 100%;">
			<div class="g-wrap p-pl f-pr">
				<div class="u-title f-cb">
					<h3>
						<span class="f-ff2 d-flag"><%=title%></span>
						<a href="playList.jsp?type=1" 
							class="u-btn2-1 menu d-flag"><i>ȫ��<em
								class="u-icn u-icn-38"></em> </i> </a>
						<a href="playList.jsp?type=1"
							class="u-btn2-1 menu d-flag"><i>����<em
								class="u-icn u-icn-38"></em> </i> </a>
										
						<a href="playList.jsp?type=2" 
							class="u-btn2-1 menu d-flag"><i>ŷ��<em
								class="u-icn u-icn-38"></em> </i> </a>
						<a href="playList.jsp?type=3" 
							class="u-btn2-1 menu d-flag"><i>����<em
								class="u-icn u-icn-38"></em> </i> </a>
						<a href="playList.jsp?type=4" 
							class="u-btn2-1 menu d-flag"><i>����<em
								class="u-icn u-icn-38"></em> </i> </a>
						<a href="playList.jsp?type=5" 
							class="u-btn2-1 menu d-flag"><i>����<em
								class="u-icn u-icn-38"></em> </i> </a>		
					</h3>

				</div>
				<div id="m-search">
					<div class="ztag j-flag" id="auto-id-oRFIQkCKNyCtcR5R">
						<div class="n-srchrst">
							<div class="srchsongst">
							<%
								String str = (String) request.getParameter("Page");
								if (str == null) {
									str = "0";
								}
								int pagesize = 10;
								rs.last();
								int RecordCount = rs.getRow();
								int maxPage = 0;
								maxPage = (RecordCount % pagesize == 0) ? (RecordCount / pagesize)
										: (RecordCount / pagesize + 1);

								int Page = Integer.parseInt(str);
								if (Page < 1) {
									Page = 1;
								} else {
									if (((Page - 1) * pagesize + 1) > RecordCount) {
										Page = maxPage;
									}
								}
								rs.absolute((Page - 1) * pagesize + 1);
								for (int i = 1; i <= pagesize; i++) {
									ID = rs.getInt("id");
									songName = rs.getString("songName");
									type = rs.getString("type");
									fileURL = rs.getString("fileURL");
									singer = rs.getString("singer");
									hits = rs.getInt("hits");
									if (type.equals("1")) {
										type = "����";
									}
									if (type.equals("2")) {
										type = "ŷ��";
									}
									if (type.equals("3")) {
										type = "����";
									}
									if (type.equals("4")) {
										type = "����";
									}
									if (type.equals("5")) {
										type = "����";
									}
							%>
												
								<div class="item f-cb h-flag even ">
									<div class="td">
										<div class="hd">
											<a class="ply " title="����"
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
											<span onclick='addShow("<%=ID%>")' class="icn icn-fav" title="�ղ�"></span>
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
										���ţ�<%=hits%>��
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
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="24" align="right">
											��ǰҳ����[<%=Page%>/<%=maxPage%>]&nbsp;
											<%
												if (Page > 1) {
											%>
											<a href="playList.jsp?Page=1&type=<%=artistType%>">��һҳ</a>
											<a href="playList.jsp?Page=<%=Page - 1%>&type=<%=artistType%>">��һҳ</a>
											<%
												}
												if (Page < maxPage) {
											%>
											<a href="playList.jsp?Page=<%=Page + 1%>&type=<%=artistType%>">��һҳ</a>
											<a href="playList.jsp?Page=<%=maxPage%>&type=<%=artistType%>">���һҳ&nbsp;</a>
											<%
												}
											%>
										</td>
									</tr>
								</table>
					<div class="j-flag"></div>
				</div>

			</div>
		</div>
		<%--<div class="g-ft">
			<div class="m-ft m-ft-0">
				<div class="wrap">
					<a class="logo f-tdn" href="http://www.mingrisoft.com/"
						target="_blank"> <span class="s-fc3">����ʡ���տƼ����޹�˾</span>
					 </a>
					
					<div class="copy">
						<a href="http://www.mingrisoft.com/" target="_blank">��������</a><span>-</span>
						<a href="#">�ͻ�����</a><span>-</span>
						<a href="#">��������</a><span>-</span>
						
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