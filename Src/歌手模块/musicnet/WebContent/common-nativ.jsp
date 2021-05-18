<%@ page contentType="text/html; charset=gbk" %>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<%
	String username = (String) session.getAttribute("username");
	String userFlag = (String) session.getAttribute("userFlag");

	if (username == null || username == "") {
%>
<input id="username" type="hidden" value="<%=username%>"></input>
<style>
#mcTooltip{
	background:url(image/out.png) no-repeat;
}
</style>
<div id="g-topbar" class="g-topbar">
    <div class="m-top">
        <div class="wrap">
            <h1 class="logo"><a hidefocus="true" target="contentFrame" href="contentFrame.jsp">甜橙云音乐</a></h1>
            <ul class="m-nav j-tflag">
                <li class="fst">
                    <span><a hidefocus="true" target="contentFrame" href="search.jsp?type=all" data-module="discover" class="z-slt"><em>发现音乐</em></a></span>
                </li>
                <li>
                    <span><a target="contentFrame" href="myMusicList.jsp"><em>我的音乐</em><sub class="cor">&nbsp;</sub></a></span>
                </li>
            </ul>
            <div class="m-tophead f-pr j-tflag" id="auto-id-TfIcbtRXDNhZrRkA">
                <a href="javascript:login();" class="name f-thide f-fl f-tdn" style="color:#1C2021">登录</a>
                <a href="javascript:regis();" class="name f-thide f-fl f-tdn" style="color:#1C2021">注册</a>
            </div>
			
		</div>
    </div>
    <div class="m-subnav m-subnav-up f-pr j-tflag f-hide">
        <div class="shadow">&nbsp;</div>
    </div>
    <div id="g_nav2" class="m-subnav j-tflag">
        <div class="wrap f-pr">
            <ul class="nav">
                <li><a hidefocus="true" target="contentFrame" href="contentFrame.jsp" data-module="discover"
                       class="z-slt menuTab"><em>推荐</em></a></li>
                <li><a hidefocus="true" target="contentFrame" href="topList.jsp" data-module="toplist"
                       class="menuTab"><em>排行榜</em></a></li>
                <li><a hidefocus="true" target="contentFrame" href="playList.jsp?type=all" data-module="playlist" class="menuTab"><em>曲风</em></a>
                </li>
                <li><a hidefocus="true" target="contentFrame" href="artist.jsp?type=all" data-module="artist"
                       class="menuTab"><em>歌手</em></a></li>

            </ul>
        </div>
    </div>
</div>
<%
	} else {
%>
<input id="username" type="hidden" value="<%=username%>"></input>
<div id="g-topbar" class="g-topbar">
    <div class="m-top">
        <div class="wrap">
        
            <h1 class="logo"><a hidefocus="true" target="contentFrame" href="contentFrame.jsp" >甜橙云音乐</a></h1>
            
            <ul class="m-nav j-tflag">
               
                <li class="fst">
                    <span><a hidefocus="true" target="contentFrame" href="search.jsp?type=all" data-module="discover" class="z-slt"><em>发现音乐</em></a></span>
                </li>
     
                <li>
                    <span><a target="contentFrame" href="myMusicList.jsp"><em>我的音乐</em><sub class="cor">&nbsp;</sub></a></span>
                </li>
                
            </ul>
            
            <div class="m-tophead f-pr j-tflag" id="auto-id-TfIcbtRXDNhZrRkA">
                <a onmouseover="tooltip.pop(this, '#textContent',{position:1, offsetX:0,  effect:'slide'})"  class="tooltip" style="color:#1C2021">您好，<%=username%></a>
            </div>

			<div style="display: none">
				<div id="textContent" style="width: 75px; height: 75px;color:black">
					<%
					 if (null!=userFlag && userFlag.equals("1")) {
					%>
					<a target="contentFrame" href="admin-artist.jsp">后台管理</a>
					<br />
					<a id="blogUrl" href="logout.jsp">退出</a>
					<%} else {%>
					<a target="contentFrame" href="admin-modifyPs.jsp">修改密码</a>
					<br />
					<a id="blogUrl" href="logout.jsp">退出</a>
					<%
						}
					%>
				</div>
			</div>
		</div>
    </div>
    <div class="m-subnav m-subnav-up f-pr j-tflag f-hide">
        <div class="shadow">&nbsp;</div>
    </div>
    <div id="g_nav2" class="m-subnav j-tflag">
        <div class="wrap f-pr">
            <ul class="nav">
                <li><a hidefocus="true" target="contentFrame" href="contentFrame.jsp" data-module="discover"
                       class="z-slt menuTab"><em>推荐</em></a></li>
                <li><a hidefocus="true" target="contentFrame" href="topList.jsp" data-module="toplist"
                       class="menuTab"><em>排行榜</em></a></li>
                <li><a hidefocus="true" target="contentFrame" href="playList.jsp?type=all" data-module="playlist" class="menuTab"><em>曲风</em></a>
                </li>
                <li><a hidefocus="true" target="contentFrame" href="artist.jsp?type=all" data-module="artist"
                       class="menuTab"><em>歌手</em></a></li>
            </ul>
        </div>
    </div>
</div>
<%
	}
%>

<style>
		#respond {
    position: relative;
    overflow: hidden;
    padding: 20px 40px;
    font-size: 13px;
}
#respond div {
    margin: 6px 0;
    color: #13ACC3;
    font-size:20px;
}
.comment-login {
    padding: 60px 0 0;
    text-align: center;
}
.comment-login li {
    margin: 20px 20px;
}

.comment-regists {
    padding: 10px 130px 0;
    text-align: right;
}
.comment-regists li {
    margin: 20px 20px;
}
#respond label {
    position: relative;
    top: 5px;
}
#respond input {
    width: 150px;
    height: 18px;
    border-top-style: initial;
    border-right-style: initial;
    border-left-style: initial;
    border-top-color: initial;
    border-right-color: initial;
    border-left-color: initial;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial;
    color: rgb(79, 79, 79);
    font-size: 13px;
    font-family: 微软雅黑;
    overflow: hidden;
    padding: 2px;
    outline: 0px;
    border-width: 0px 0px 1px;
    border-bottom: 1px dashed rgb(127, 155, 192);
    background: 0px 0px;
}
#respond input.submitButton {
    margin-right: 14px;
    width: 66px;
    height: 26px;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial;
    color: rgb(255, 255, 255);
    font-size: 13px;
    font-family: 微软雅黑;
    cursor: pointer;
    outline: 0px;
    border-width: 0px;
    border-style: initial;
    border-color: initial;
    border-radius: 0px;
    background: rgb(19, 172, 195);
}
div.jbox .jbox-button {
    color: #1E1D1D;
}

#loginHtml{overflow:hidden;}
.left{width:350px;height:574px;  background:#f0f3f9 url(image/login-leftBg.jpg) no-repeat; float:left;}
.right{width:350px; height:574px; background:#f0f3f9 url(image/login-rightBg.jpg) no-repeat; float:right;}
.center{background:#ffe6b8; height:574px;}

</style>

 <script type="text/javascript" src="js/jBox/jquery-1.4.2.min.js"></script>
 <script type="text/javascript" src="js/jBox/jquery.jBox-2.3.min.js"></script>
 <script type="text/javascript" src="js/jBox/i18n/jquery.jBox-zh-CN.js"></script>  
 <link type="text/css" rel="stylesheet" href="js/jBox/Skins2/Blue/jbox.css"/>
 
 <script type="text/javascript" src="js/toolTip/tooltip.js"></script>
 <link type="text/css" rel="stylesheet" href="js/toolTip/tooltip.css"/>
 
 
  
<script>
$(".menuTab").bind("click", function(obj){
	$('.menuTab').removeClass("z-slt");
	obj.currentTarget.className='z-slt menuTab';	
});

function login(){
			var html ='<div id="loginHtml">'+
    			   '<div class="left">' +
    			   '<div id="respond"><form  method="post" id="commentform">'+											
				   '<div class="comment-login"></div>'+
				   '<div class="comment-login" style="font-size:16px;margin-top:-50px"></div>'+
				   '<div class="comment-login" style="margin-top:-50px">'+
				   '</div>'+
				   '</form></div>'+
    			   '</div>'+
    			   '<div class="right">' +
    			   '<div id="respond"><form  method="post" action="login_check.jsp"  id="commentform">'+											
					'<div class="comment-login"></div>'+
					'<div class="comment-login" style="font-size:16px;margin-top:-40px">'+
					'<ul style="margin-top:100px">'+
					'<li class="form-inline">'+
					'<label><strong>账号：</strong></label>'+
					'<input type="text" name="manager" id="user" value="" tabindex="1" aria-required="true">'+
					'</li>'+
					'<li class="form-inline">'+
					'<label><strong>密码：</strong></label>'+
					'<input type="password" name="PWD" id="ps" value="" tabindex="2" aria-required="true">'+
					'</li>'+
					'</ul>'+
					'</div>'+
					'<div class="comment-login"><input name="submit" type="submit" id="save"  class="submitButton" tabindex="5" value="登录">' +
					'<input name="submit" type="button" id="save" onclick=""  class="submitButton" tabindex="5" value="忘记密码？">' +
					'</div>'+
				    '</form></div>'+
    			    '</div>'+
    			   '<div class="center"></div>'+
				   '</div>';
						
				var content = {

			    state1: {
			        content: html,
			
			        buttons: { '取消': 0 },
			
			        buttonsFocus: 0,
			
			        submit: function (v, h, f) {
			            if (v == 0) {
			                return true; // close the window
			            }
			            return false;
			        }
			    }
			};
				$.jBox.open(content, '登录', 717, 650);	
				var i=parseInt(10*Math.random());
			var j=parseInt(10*Math.random());
			var k=i+j;
			$("#hiddencode").val(k);
			$("#showspan").html(" " + i + " + " + j + " = ?"); 
		}

function regis(){
	
			var html = '<div id="respond"><form action="register_deal.jsp" method="post" onsubmit="return regisSubmit()">'+											
						'<div class="comment-login">请注册</div>'+
						'<div class="comment-login">'+
						'<ul>'+
					    '<li class="form-inline">'+
						'<label>账号：</label>'+
						'<input type="text" name="manager" id="manager" value="" tabindex="1" aria-required="true">'+
					    '</li>'+
					    '<li class="form-inline">'+
						'<label>密码：</label>'+
						'<input type="password" name="pwd" id="pwd" value="" tabindex="2" aria-required="true">'+
					    '</li>'+
					    '<li class="form-inline">'+
						'<label>密码确认：</label>'+
						'<input type="password" name="pwd2" id="pwd2" value="" tabindex="2" aria-required="true">'+
					    '</li>'+
					    '</ul>'+
					    '</div>'+
					    '<div class="comment-login"><input name="submit" type="submit" id="save"   class="submitButton" tabindex="5" value="注册"></div>'+
						'</form></div>';
						
				var content = {
			    state1: {
			        content: html,
			        buttons: { '取消': 0 },
			        buttonsFocus: 0,
			        submit: function (v, h, f) {
			            if (v == 0) {
			                return true; // close the window
			            }
			            return false;
			        }
			    }
			};
				$.jBox.open(content, '注册', 650, 550);	
		}
</script>
<script>
function regisSubmit(){
	
		if(/^[\u4e00-\u9fa5]+$/.test($('#manager').val())){
			alert("账户不能输入汉字！");
			return false;
		  }
			
		
		var pwd=document.getElementById("pwd").value;
		var pwd2=document.getElementById("pwd2").value;
		if(pwd!==pwd2){
			alert('密码前后不一致！');
			return false;
		}
		return true;
	}
</script>
