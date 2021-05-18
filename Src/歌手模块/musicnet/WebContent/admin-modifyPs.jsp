<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*"%>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/><%
String username=(String)session.getAttribute("username");
if(username!=null && username!=""){
	String sql="select * from tb_user where manager='"+username+"'";
	ResultSet rs=conn.executeQuery(sql);
	int id=-1;
	if(rs.next()){
		id=rs.getInt(1);
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
	<body id="auto-id-X1gI20iWgxfCg0Tz">
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
						<a ><em>修改密码</em>
						</a>
					</li>
				</ul>
				
				<form onsubmit="return modifyPs();" action="admin-modifyPs_deal.jsp">
					<div class="n-base f-cb">
						<div class="frm m-frm">
						
							<div class="itm">
								<span style="color:red">*</span>原密码：<input type="password" class="u-txt txt" id="psOr"  name="pwd" maxlength="30">
							</div>
							
							<div class="itm">
								新密码：<input type="password"   class="u-txt txt" value="" id="psNew" name="psNew" maxlength="30">
							</div>
							
							<div class="itm">
								新密码确认：<input type="password" class="u-txt txt" id="psNew2" name="psNew2" maxlength="30">
							</div>
							
							<input type="hidden" value="<%=id%>" name="ID" />							
							<div class="itm ft">
								<input name="submit" type="submit" value="保存" >
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
	function  modifyPs(){
		
		if($('#psOr').val()==""){
			alert("原密码不能为空！");
			return false;
		}
		
		if($('#psNew').val()==""){
			alert("新密码不能为空！");
			return false;
		}
		
		if($('#psNew2').val()==""){
			alert("新密码确认不能为空！");
			return false;
		}
		
		if($('#psNew').val()!==$('#psNew2').val()){
			alert('密码前后不一致！');
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