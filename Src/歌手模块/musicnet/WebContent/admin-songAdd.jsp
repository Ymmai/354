<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path;%>
<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.*"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
	ResultSet rs_song = conn.executeQuery("select artistName,id from tb_artist order by id desc");
	String artistName = "";
	String id = "";

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
						<a ><em>��������</em>
						</a>
					</li>
				</ul>
				
				<form onsubmit="return addCheck()" action="admin-songAdd_deal.jsp">
					<div class="n-base f-cb">
						<div class="frm m-frm">
						
							<div class="itm">
								�������ƣ�<input type="text" class="u-txt txt" id="songName"  name="songName" maxlength="30">
							</div>
							
							<div class="itm">
								���֣�
								<select name="singer" class="u-txt txt" style="height:auto">
									<%
                 	int s = 0;
                 	while (rs_song.next()) {
                 		artistName = rs_song.getString(1);
                 		id = rs_song.getString(2);
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
								���ࣺ
								<select name="type" class="u-txt txt" style="height:auto">
									<option value="1">
										����
									</option>
									<option value="2">
										ŷ��
									</option>
									<option value="3">
										����
									</option>
									<option value="4">
										����
									</option>
									<option value="5">
										����
									</option>
								</select>
							</div>

							<div class="itm">
								�����ļ���ַ��<input type="text" class="u-txt txt" id="fileURL" name="fileURL" maxlength="30">
							</div>
							
													
							<div class="itm ft">
								<input name="submit" type="submit" value="����" >
								<input onclick="history.go(-1)"  type="button" value="����" >
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
						<a href="http://www.mingrisoft.com/" target="_blank">��������</a><span>-</span>
						<a href="#">�ͻ�����</a><span>-</span>
						<a href="#">��������</a>
						<p class="f-fl">
							����ʡ���տƼ����޹�˾
						</p>
					</div>
				</div>
			</div>
		</div>
		
		<a title="�ص�����" class="m-back" href="#" id="g_backtop"
			hidefocus="true" style="display: none;">�ص�����</a>

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
		
		if($('#songName').val()==""){
			alert("�������Ʋ���Ϊ�գ�");
			return false;
		}
		
		if($('#fileURL').val()==""){
			alert("����ͼƬ����Ϊ�գ�");
			return false;
		}
		
		return true; 
	}

</script>
	</body>
</html>
