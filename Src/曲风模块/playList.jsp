<%@ page contentType="text/html; charset=gbk" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="gbk">
		<title>甜橙云音乐</title>
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
						<span class="f-ff2 d-flag"></span>
						<a href="playList.jsp?type=1" 
							class="u-btn2-1 menu d-flag"><i>全部<em
								class="u-icn u-icn-38"></em> </i> </a>
						<a href="playList.jsp?type=1"
							class="u-btn2-1 menu d-flag"><i>华语<em
								class="u-icn u-icn-38"></em> </i> </a>
										
						<a href="playList.jsp?type=2" 
							class="u-btn2-1 menu d-flag"><i>欧美<em
								class="u-icn u-icn-38"></em> </i> </a>
						<a href="playList.jsp?type=3" 
							class="u-btn2-1 menu d-flag"><i>日语<em
								class="u-icn u-icn-38"></em> </i> </a>
						<a href="playList.jsp?type=4" 
							class="u-btn2-1 menu d-flag"><i>韩语<em
								class="u-icn u-icn-38"></em> </i> </a>
						<a href="playList.jsp?type=5" 
							class="u-btn2-1 menu d-flag"><i>其他<em
								class="u-icn u-icn-38"></em> </i> </a>		
					</h3>

				</div>
				<div id="m-search">
					<div class="ztag j-flag" id="auto-id-oRFIQkCKNyCtcR5R">
						<div class="n-srchrst">
							<div class="srchsongst">
							 
								
							</div>
						</div>
					</div>
					
					<div class="j-flag"></div>
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