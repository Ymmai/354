<%@ page contentType="text/html; charset=gbk" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
	StringBuffer sql = new StringBuffer();
	sql.append("select * from tb_song order by id desc ");
	ResultSet rs = conn.executeQuery(sql.toString());
	int ID = 0;
	String songName = "";
	String type = "";
	String fileURL = "";
	String singer = "";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="gbk">
		<title>甜橙云音乐</title>
		<link href="css/pt_discover_index.css" type="text/css"
			rel="stylesheet">
		<link href="css/pt_frame.css" type="text/css" rel="stylesheet">
		<link href="css/pt_profile_home.css" type="text/css" rel="stylesheet">
	</head>
	<body style="background: url(image/bg.jpg) repeat-y 100% 100%;">
		<div data-module="" data-sub="" id="g_top" class="m-top">
			&nbsp;
		</div>
		<div id="g_nav" class="m-subnav m-subnav-up f-pr">
			<div class="shadow">
				&nbsp;
			</div>
		</div>
		<div class="g-bd" style="margin-top:50px">
			<div class="g-wrap" id="baseBox">
				<div class="u-title u-title-2 f-cb">
					<h3>
						<span class="f-ff2">后台管理</span>
					</h3>
				</div>
				<ul class="m-tabs f-cb">
					<li class="fst">
						<a href="admin-artist.jsp" ><em>歌手</em> </a>
					</li>
					<li>
						<a href="admin-song.jsp" class="z-slt"><em>歌曲</em> </a>
					</li>
				</ul>
				<div class="g-wrap p-prf">
					<div class="n-bind f-cb j-flag">
						<p class="delete">
							<a target="contentFrame" href="admin-songAdd.jsp" class="btn"><i>新增歌曲</i>
							</a>
						</p>
					</div>

					<div class="u-title u-title-1 f-cb m-record-title" id="rHeader">
						<h3>
							<span class="f-ff2 s-fc3">歌曲列表</span>
						</h3>

					</div>
					<div id="m-record" data-uid="3514008" data-songs="1316"
						class="m-record">
						<div id="auto-id-oXK37yPmGlBEcCTf">
							<div class="j-flag" id="auto-id-42i2wAet2Pki6UW6">
								<table class="m-table m-table-rank">
									<thead>
										<tr>

											<th>
												<div class="wp">
													歌曲
												</div>
											</th>
											<th class="wp">
												<div class="wp">
													歌手
												</div>
											</th>
											<th class="w3">
												<div class="wp">
													类别
												</div>
											</th>
											<th class="w3">
												<div class="wp">
													操作
												</div>
											</th>
										</tr>
									</thead>
									<tbody>
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
												singer = rs.getString("singer");
												type = rs.getString("type");
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
										<tr>

											<td class="rank">
												<%=songName%>
											</td>

											<td class=" s-fc3">
												<%=singer%>
											</td>
											
											<td class=" s-fc3">
												<%=type%>
											</td>

											<td class="">
												<a href="admin-songEdit.jsp?id=<%=ID%>">修改</a>
												<a href="admin-songDel_deal.jsp?delid=<%=ID%>">删除</a>
											</td>
										</tr>
										<%
											try {
													if (!rs.next()) {
														break;
													}
												} catch (Exception e) {
												}
											}
										%>
									</tbody>
								</table>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="24" align="right">
											当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
											<%
												if (Page > 1) {
											%>
											<a href="admin-song.jsp?Page=1">第一页</a>
											<a href="admin-song.jsp?Page=<%=Page - 1%>">上一页</a>
											<%
												}
												if (Page < maxPage) {
											%>
											<a href="admin-song.jsp?Page=<%=Page + 1%>">下一页</a>
											<a href="admin-song.jsp?Page=<%=maxPage%>">最后一页&nbsp;</a>
											<%
												}
											%>
										</td>
									</tr>
								</table>
							</div>
							<div class="j-flag"></div>
						</div>
					</div>

				</div>

			</div>
			<div class="g-wrap m-edtimg f-cb" style="display: none;">
				<div class="u-bread1 f-fw1 f-fs1">
					<a href="#" class="s-fc7" id="back">个人设置</a><span class="arr s-fc4">&gt;</span><span
						class="f-fw1">更换头像</span>
				</div>
				<div id="cropBox"></div>
			</div>
		</div>

		<a title="回到顶部" class="m-back" href="#" id="g_backtop"
			hidefocus="true" style="display: none;">回到顶部</a>


		<script
			src="//s3.music.126.net/sep/s/2/core.js?756557f5ea03745b332e7a7231d40984"
			type="text/javascript">
</script>
		<iframe frameborder="0" id="auto-id-IvL7xuKir9tR8ay9"
			style="display: none;"
			src="http://mail.163.com/app/cloudmusic/proxy.html"></iframe>
		<script
			src="//s3.music.126.net/sep/s/2/pt_profile_update.js?7c50f062f581255b2ec534505774f597"
			type="text/javascript">
</script>

	</body>
</html>