<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*"%>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/><%
String ID=request.getParameter("id");
String username=(String)session.getAttribute("username");
if(username!=null && username!=""){
	
	ResultSet rs_song = conn.executeQuery("select artistName,id from tb_artist order by id desc");
	String artistName = "";
	String artisId = "";
	
	String sql="select id,songName,singer,fileURL,type from tb_song where id='"+Integer.parseInt(ID)+"'";
	ResultSet rs=conn.executeQuery(sql);
	int id=-1;
	String songName="";
	String singer="";
	String fileURL="";
	String type="";
	if(rs.next()){
		id=rs.getInt(1);
		songName=rs.getString(2);
		singer=rs.getString(3);
		fileURL=rs.getString(4);
		type=rs.getString(5);
	}
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
						<a ><em>修改歌曲</em>
						</a>
					</li>
				</ul>
				
				<form onsubmit="return editCheck();" action="admin-songEdit_deal.jsp">
					<div class="n-base f-cb">
						<div class="frm m-frm">
						
							<div class="itm">
								歌曲名称：<input type="text" value="<%=songName%>" class="u-txt txt" id="songName"  name="songName" maxlength="30">
							</div>

							<div class="itm">
								歌手：
								<select id="singer" name="singer" class="u-txt txt" style="height:auto">
									<%
                 	int s = 0;
                 	while (rs_song.next()) {
                 		artistName = rs_song.getString(1);
                 		artisId = rs_song.getString(2);
                 %>
                 
									<option value="<%=artistName%>">
										<%=artistName%>
									</option>
									
									 <%
                    	s++;
                    	}
                    %>
								</select>
							</div>
							
							
							<div class="itm">
								分类：
								<select id="type" name="type" class="u-txt txt" style="height:auto">
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
								歌曲文件地址：<input value="<%=fileURL%>" type="text" class="u-txt txt" id="fileURL" name="fileURL" maxlength="30">
							</div>
							
							<input type="hidden" value="<%=id%>" name="ID">						
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
    
	$("#type option[value='"+<%=type%>+"']").attr("selected",true);
	$("#singer option[value=<%=singer%>]").attr("selected",true);

	function  editCheck(){
		
		if($('#songName').val()==""){
			alert("歌曲姓名不能为空！");
			return false;
		}
		
		if($('#fileURL').val()==""){
			alert("歌曲图片不能为空！");
			return false;
		}
		
		return true; 
		
	}

</script>
	</body>
</html>
<%conn.close();
}else{
	out.println("<script lanage='javascript'>alert('请先登录，再修改个人信息!');window.location.href='index.jsp';</script>");
}%>