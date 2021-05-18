<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path;%>
<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.*"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="GBK">
    <title>甜橙云音乐</title>
    <link href="css/core.css" type="text/css" rel="stylesheet">
    <link href="css/pt_frame.css" type="text/css" rel="stylesheet">
    <style>html, body {
        overflow: hidden;
    }</style>
    <script>if (top != self)top.location = self.location;</script>
    <style type="text/css">.auto-1469062573612 {
        position: fixed;
        _position: absolute;
        z-index: 100;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        width: 100%;
        height: 100%;
        background-image: url(data:image/gif;base64,R0lGODlhAQABAID/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==);
    }

    .auto-1469062573613 {
        position: absolute;
        z-index: 1000;
        border: 1px solid #aaa;
        background: #fff;
    }

    .auto-1469062573613 .zbar {
        line-height: 30px;
        background: #8098E7;
        border-bottom: 1px solid #aaa;
    }

    .auto-1469062573613 .zcnt {
        padding: 10px 5px;
    }

    .auto-1469062573613 .zttl {
        margin-right: 20px;
        text-align: left;
    }

    .auto-1469062573613 .zcls {
        position: absolute;
        top: 5px;
        right: 0;
        width: 20px;
        height: 20px;
        line-height: 20px;
        cursor: pointer;
    }

    .auto-1469062573614 {
        position: absolute;
        background: #fff;
    }

    .auto-1469062573615 {
        font-size: 12px;
        line-height: 160%;
    }

    .auto-1469062573615 a {
        margin: 0 2px;
        padding: 2px 8px;
        color: #333;
        border: 1px solid #aaa;
        text-decoration: none;
    }

    .auto-1469062573615 .js-disabled {
        cursor: default;
    }

    .auto-1469062573615 .js-selected {
        cursor: default;
        background: #bbb;
    }

    .auto-1469062573616 {
        position: absolute;
        z-index: 100;
        overflow: hidden;
        cursor: pointer;
    }

    .auto-1469062573616 .hfile {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        cursor: pointer;
        opacity: 0;
        filter: Alpha(opacity=0);
        font-size: 12px;
        font-size: 16px;
        *font-size: 15px;
    }

    .j-item.j-selected a {
        background: #eee;
        text-decoration: none;
        color: #333;
    }

    .u-atlist {
        position: absolute;
        z-index: 10000;
    }

    .f-thide.selected-item {
        background-color: #eee;
    }

    #shadow-box {
        position: absolute;
        display: block;
        left: 450px;
        top: 1020px;
        border: 1px solid black;
        word-wrap: break-word;
        display: none;
        opacity: 0;
        filter: Alpha(opacity=0);
        z-index: -1000;
    }</style>
</head>
<body class="auto-1469062573613-parent auto-1469062573612-parent">

<jsp:include page="common-nativ.jsp"/>

<iframe name="contentFrame" id="g_iframe" class="g-iframe" scrolling="auto" frameborder="0"
        src="contentFrame.jsp"></iframe>

<link href="css/jplayer.blue.monday.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="dist/jplayer/jquery.jplayer.min.js"></script>
<script>
function playMusic(name, media) {
	
	   $("#jquery_jplayer").jPlayer( "destroy" );
	   
       $("#jquery_jplayer").jPlayer({
            ready: function(event) {
                $(this).jPlayer("setMedia", {
                    title: name,
                    mp3: "images/song/53.mp3"
                }).jPlayer( "play" );
            },
            
            swfPath: "dist/jplayer/jquery.jplayer.swf",
            supplied: "mp3",
            wmode: "window",
            useStateClassSkin: true,
            autoBlur: false,
            smoothPlayBar: true,
            keyEnabled: true,
            remainingDuration: true,
            toggleDuration: true
        });
}

function addMyList(id){
	$.ajax({
            url: "addHit_deal.jsp",
            type: "get",
            data: {
                id: id
            },
            success: function(result) {
               
                if($.trim(result)==='0'){
                	
                	console.log("播放次数失败");
                	return;
                }
                if($.trim(result)==='1'){
                	console.log("播放次数成功");
                	return;
                } 
                if($.trim(result)==='2'){
                	console.log("播放次数成功");
                	return;
                } 
            }
        });
}


function addShow(id){
	var username=$('#username').val();
	if(username=="null" || username==""){
		alert("收藏请先登录!");
		return;
	}

	$.ajax({
            url: "addShow_deal.jsp",
            type: "get",
            data: {
                id: id
            },
            success: function(result) {
                   
                if($.trim(result)==='0'){
                	
                	alert("收藏失败");
                	return;
                }
                if($.trim(result)==='1'){
                	alert("收藏成功");
                	return;
                } 
                if($.trim(result)==='2'){
                	alert("收藏失败");
                	return;
                } 
            }
        });
}
</script>
		<div id="demo" style="z-index: 999; position: fixed;right:0;left:0;bottom:0;width:100%;">
			<div id="jquery_jplayer" class="jp-jplayer">
			</div>
			<div id="jp_container_1" class="jp-audio" role="application"
				aria-label="media player">
				<div class="jp-type-single">
					<div class="jp-details">
						<div class="jp-title" aria-label="title">
							暂无播放音乐
						</div>
					</div>
					<div class="jp-gui jp-interface" style="margin-left:30% " >
						<div class="jp-controls">
							<button class="jp-play" role="button" tabindex="0">
								play
							</button>
						</div>
						<div class="jp-progress">
							<div class="jp-seek-bar">
								<div class="jp-play-bar"></div>
							</div>
						</div>
						<div class="jp-volume-controls">
							<button class="jp-mute" role="button" tabindex="0">
								mute
							</button>
							<button class="jp-volume-max" role="button" tabindex="0">
								max volume
							</button>
							<div class="jp-volume-bar">
								<div class="jp-volume-bar-value"></div>
							</div>
							<div class="jp-duration" role="timer" aria-label="duration">
								&nbsp;
							</div>
							<div class="jp-time-holder">
								<div class="jp-duration" role="timer" aria-label="duration">
									&nbsp;
								</div>
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</body>
</html>