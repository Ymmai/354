<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path;%>
<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.*"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
	StringBuffer sql = new StringBuffer();
	sql
			.append("select top 30 id,songName,singer,fileURL,type from tb_song where 1=1");

	sql.append("order by hits desc");

	ResultSet rs_new = conn.executeQuery(sql.toString());
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
		<title>甜橙云音乐</title>
		<link href="css/pt_discover_index.css" type="text/css"
			rel="stylesheet">
		<link href="css/pt_frame.css" type="text/css" rel="stylesheet">
	</head>
	<body id="auto-id-GSM4aHykyxAiXHiX" style="background: url('image/bg.jpg') no-repeat">
		<div data-module="discover" data-sub="toplist" id="g_top"
			class="m-top">
			&nbsp;
		</div>
		<div id="g_nav" class="m-subnav">
			&nbsp;
		</div>
	
		<div id="toplist" class="g-bd3 g-bd3-1 f-cb">
			<div class="g-sd3 g-sd3-1">
				<div class="n-minelst n-minelst-2">
					<h2 class="f-ff1">
						热门歌手
					</h2>
					<ul class="m-hdlist f-cb" style="margin:0px">
						<li data-res-id="9621" data-res-type="2" data-res-action="log"
							data-res-data="recommendclick|0||artist-artist-recommend|10559">
							<div class="hd">
								<a href="artistDetail.jsp?id=16" > <img
										src="images/artist/4.jpg">
								</a>
							</div>
							<p>
								<a href="artistDetail.jsp?id=16" 
									class="nm nm-icn f-ib f-thide">Eminem</a>
							</p>
						</li>
						<li data-res-id="9621" data-res-type="2" data-res-action="log"
							data-res-data="recommendclick|0||artist-artist-recommend|10559">
							<div class="hd">
								<a href="artistDetail.jsp?id=19" > <img
										src="images/artist/7.jpg">
								</a>
							</div>
							<p>
								<a href="artistDetail.jsp?id=19" 
									class="nm nm-icn f-ib f-thide">久石譲</a>
							</p>
						</li>
						<li data-res-id="9621" data-res-type="2" data-res-action="log"
							data-res-data="recommendclick|0||artist-artist-recommend|10559">
							<div class="hd">
								<a href="artistDetail.jsp?id=22" > <img
										src="images/artist/10.jpg">
								</a>
							</div>
							<p>
								<a href="artistDetail.jsp?id=22" 
									class="nm nm-icn f-ib f-thide">G-Dragon</a>
							</p>
						</li>
						<li data-res-id="9621" data-res-type="2" data-res-action="log"
							data-res-data="recommendclick|0||artist-artist-recommend|10559">
							<div class="hd">
								<a href="artistDetail.jsp?id=24" > <img
										src="images/artist/12.jpg">
								</a>
							</div>
							<p>
								<a href="artistDetail.jsp?id=24" 
									class="nm nm-icn f-ib f-thide">金泰妍</a>
							</p>
						</li>
					</ul>
					
					
				</div>
			</div>


			<div class="g-mn3" style="margin-top: 30px">
				<div class="g-mn3c">

					<div class="g-wrap12">
						<div class="u-title u-title-1 f-cb">
							<h3>
								<span class="f-ff2">歌曲TOP-30</span>
							</h3>

						</div>
						<div id="song-list-pre-cache" data-key="song_toplist-19723756"
							data-simple="0">
							<div id="auto-id-VEd67rpf74DVML8f">
								<div class="j-flag" id="auto-id-o5oRUwylt22S4fpC">
									<table class="m-table m-table-rank">
										<thead>
											<tr>
												<th>
													<div class="wp">
														歌曲
													</div>
												</th>
												<th class="w2-1">
													<div class="wp">
														类别
													</div>
												</th>
												<th class="w3">
													<div class="wp">
														歌手
													</div>
												</th>
											</tr>
										</thead>
										<tbody>
											<%
												int s = 0;
												while (rs_new.next()) {
													ID = rs_new.getInt(1);
													songName = rs_new.getString(2);
													singer = rs_new.getString(3);
													fileURL = rs_new.getString(4);
													type = rs_new.getString(5);
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
											<tr class=" ">
												<td class="">
													<div class="f-cb">
														<div class="tt">
															<span
																onclick='playA("<%=songName%>","images/song/<%=fileURL%>","<%=ID%>");'
																class="ply ">&nbsp;</span>

															<div class="ttc">
																<span class="txt"><b><%=songName%></b> </span>
															</div>
														</div>
													</div>
												</td>

												<td class=" s-fc3">
													<span class="u-dur "><%=type%></span>

													<div class="opt hshow">
														<span onclick='addShow("<%=ID%>")' class="icn icn-fav" title="收藏"></span>
													</div>
												</td>

												<td class="">
													<div class="text">
														<span><%=singer%> </span>
													</div>
												</td>
											</tr>
											<%
												s++;
												}
											%>
										</tbody>
									</table>
								</div>
								<div class="j-flag"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
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