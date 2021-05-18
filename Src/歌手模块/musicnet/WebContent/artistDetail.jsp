<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path;%>
<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.*"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
	String artistId = request.getParameter("id");
	ResultSet rs_song = conn
			.executeQuery("select t2.id,t2.songName,t2.fileURL,t2.hits from tb_artist t1 right join tb_song t2 on t1.artistName=t2.singer where t1.id='"
					+ Integer.parseInt(artistId)
					+ "'order by t2.id desc");
	int ID = 0;
	String songName = "";
	String fileURL = "";
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
	<body id="auto-id-gJp5uEFFituBq3HI" style="background: url('image/bg.jpg') no-repeat" >
		<div data-module="discover" data-sub="other" id="g_top" class="m-top">
			&nbsp;
		</div>
		<div id="g_nav" class="m-subnav">
			&nbsp;
		</div>
		<div class="g-bd4 f-cb" style="background: url('image/bg-middle.png') repeat-y 100% 100%">
			<div class="g-mn4">
				<div class="g-mn4c">
					<div class="g-wrap6">

						<ul id="m_tabs" class="m-tabs f-cb">
							<li class="fst">
								<a href="#" class="z-slt"><em>ta的歌曲</em>
								</a>
							</li>
						</ul>
						
						<div  class="n-top50" style="margin-top:10px">
							<div class="f-cb">
								<div id="song-list-pre-cache" data-key="track_artist_top-10559"
									data-simple="0">
									<div >
										<div class="j-flag" id="auto-id-u3G16kJnDyPpW0Vd">
											<table class="m-table m-table-1 m-table-4">
												<tbody>
													<%
														int s = 0;
														while (rs_song.next()) {
															ID = rs_song.getInt(1);
															songName = rs_song.getString(2);
															fileURL = rs_song.getString(3);
															hits = rs_song.getInt(4);
													%>
													<tr class="even">
														<td class="w1">
															<div class="hd">
																<span onclick='playA("<%=songName%>","images/song/<%=fileURL%>","<%=ID%>");' class="ply ">&nbsp;</span>
															</div>
														</td>
														<td class="">
															<div class="f-cb">
																<div class="tt">
																	<div class="ttc">
																		<span class="txt"><a href="#"><b><%=songName%></b>
																		</a> </span>
																	</div>
																</div>
															</div>
														</td>
														<td class="w2-1 s-fc3">
															<span class="u-dur ">播放：<%=hits%>次</span>
															<div class="opt hshow">
																<span onclick='addShow("<%=ID%>")' class="icn icn-fav"
																	title="收藏"></span>
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
			</div>
			<div class="g-sd4">
				<div class="g-wrap7">
					
					<h3 class="u-hd3">
						<span class="f-fl">热门歌手</span>
					</h3>
					<ul class="m-hdlist f-cb" id="rec-similar-artists">
						<li data-res-id="9621" data-res-type="2" data-res-action="log"
							data-res-data="recommendclick|0||artist-artist-recommend|10559">
							<div class="hd">
								<a href="artistDetail.jsp?id=13" title="王菲"> <img
										src="images/artist/1.jpg">
								</a>
							</div>
							<p>
								<a href="artistDetail.jsp?id=13" title="王菲"
									class="nm nm-icn f-ib f-thide">王菲</a>
							</p>
						</li>
						<li data-res-id="9621" data-res-type="2" data-res-action="log"
							data-res-data="recommendclick|0||artist-artist-recommend|10559">
							<div class="hd">
								<a href="artistDetail.jsp?id=15" > <img
										src="images/artist/3.jpg">
								</a>
							</div>
							<p>
								<a href="artistDetail.jsp?id=15" 
									class="nm nm-icn f-ib f-thide">周杰伦</a>
							</p>
						</li>
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
		</div>
		
		<a title="回到顶部" class="m-back" href="#" id="g_backtop"
			hidefocus="true" style="display: none;">回到顶部</a>

		<script type="text/javascript">
</script>
		<script
			src="//s3.music.126.net/sep/s/2/core.js?756557f5ea03745b332e7a7231d40984"
			type="text/javascript">
</script>
		
		<script
			src="//s3.music.126.net/sep/s/2/pt_artist_index.js?2494e93639ed1fb2b1bc1222e1953eb8"
			type="text/javascript">
</script>
		<script defer="defer"
			src="http://img3.126.net/kaola/dsp1e/js/ntes-ad-cloud.min.js?v=3.33">
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