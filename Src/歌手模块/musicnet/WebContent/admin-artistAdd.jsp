
<!DOCTYPE html>
<html>
	<head>
		<meta charset="gbk">
		<title>甜橙云音乐</title>
		<link href="css/pt_discover_index.css" type="text/css"
			rel="stylesheet">
		<link href="css/pt_frame.css" type="text/css" rel="stylesheet">
	</head>
	<body >
		<div data-module="" data-sub="" id="g_top" class="m-top">
			&nbsp;
		</div>
		<div id="g_nav" class="m-subnav m-subnav-up f-pr">
			<div class="shadow">
				&nbsp;
			</div>
		</div>

		<div class="g-bd">
			<div class="g-wrap" id="baseBox">
					
				<ul class="m-tabs f-cb">
					<li class="fst">
						<a ><em>新增歌手</em>
						</a>
					</li>
				</ul>
				
				<form onsubmit="return addCheck()" action="admin-artistAdd_deal.jsp">
					<div class="n-base f-cb">
						<div class="frm m-frm">
						
							<div class="itm">
								歌手姓名：<input type="text" class="u-txt txt" id="artistName"  name="artistName" maxlength="30">
							</div>

							<div class="itm">
								歌手分类：
								<select name="type" class="u-txt txt" style="height:auto">
									<option value="1">
										华语
									</option>
									<option value="2">
										欧美
									</option>
									<option value="3">
										日语
									</option>
									<option value="4">
										韩语
									</option>
									<option value="5">
										其他
									</option>
								</select>
							</div>

							<div class="itm">
								歌手图片：<input type="text" class="u-txt txt" id="imgURL" name="imgURL" maxlength="30">
							</div>
							
													
							<div class="itm ft">
								<input name="submit" type="submit" value="保存" >
								<input onclick="history.go(-1)"  type="button" value="返回" >
							</div>
							
							
						</div>
					</div>
				</form>
					
			</div>
		</div>

		<div class="g-ft">
			<div class="m-ft m-ft-0">
				<div class="wrap">
					<div class="copy">
						<a href="http://www.mingrisoft.com/" target="_blank">关于我们</a><span>-</span>
						<a href="#">客户服务</a><span>-</span>
						<a href="#">服务条款</a>
						<p class="f-fl">
							吉林省明日科技有限公司
						</p>
					</div>
				</div>
			</div>
		</div>
		
		<a title="回到顶部" class="m-back" href="#" id="g_backtop"
			hidefocus="true" style="display: none;">回到顶部</a>

		<script
			src="//s3.music.126.net/sep/s/2/core.js?756557f5ea03745b332e7a7231d40984"
			type="text/javascript">
		</script>

		<script
			src="//s3.music.126.net/sep/s/2/pt_profile_update.js?7c50f062f581255b2ec534505774f597"
			type="text/javascript">
		</script>
 <script src="js/jquery.1.3.2.js" type="text/javascript"></script>       
<script>
	function  addCheck(){
		
		if($('#artistName').val()==""){
			alert("歌手姓名不能为空！");
			return false;
		}
		
		if($('#imgURL').val()==""){
			alert("歌手图片不能为空！");
			return false;
		}
		
		
		return true; 
		
	}

</script>
	</body>
</html>
