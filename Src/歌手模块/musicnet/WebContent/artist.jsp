<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path;%>
<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.*"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
    String artistType= request.getParameter("type");
    String title="";
    if(artistType.equals("all")){
    	title="全部歌手";
    }
    if(artistType.equals("1")){
    	title="华语歌手";
    }
    if(artistType.equals("2")){
    	title="欧美歌手";
    }
    if(artistType.equals("3")){
    	title="日本歌手";
    }
    if(artistType.equals("4")){
    	title="韩国歌手";
    }
    if(artistType.equals("5")){
    	title="其他歌手";
    }
	StringBuffer sql = new StringBuffer();
	sql.append("select * from tb_artist where 1=1");
	if(null!=artistType && !artistType.equals("all")){
		sql.append(" and type='"+artistType+"' ");
	}
	
	sql.append("order by id desc ");
			
	ResultSet rs = conn.executeQuery(sql.toString());
	int ID = 0;
	String artistName = "";
	String type = "";
	String imgURL = "";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="gbk">
    <title>甜橙云音乐</title>
    <link href="css/pt_discover_index.css" type="text/css" rel="stylesheet">
    <link href="css/pt_frame.css" type="text/css" rel="stylesheet">
</head>
<body id="auto-id-m5QW1TMGV9UAUTIC" style="background: url('image/bg.jpg') no-repeat">
<div data-module="discover" data-sub="artist" id="g_top" class="m-top">&nbsp;</div>
<div id="g_nav" class="m-subnav">&nbsp;</div>

<div class="g-bd2 f-cb">
    <div class="g-sd2">
        <div class="g-wrap4 n-sgernav" id="singer-cat-nav" style="background: url('image/bg-middle.jpg') no-repeat">
            <h2 class="tit"><a href="artist.jsp?type=all">全部</a></h2>
            <div class="blk">
                <h2 class="tit"><a href="artist.jsp?type=1">华语</a></h2>
                
            </div>
            <div class="blk">
                <h2 class="tit"><a href="artist.jsp?type=2">欧美</a></h2>
                
            </div>
            <div class="blk">
                <h2 class="tit"><a href="artist.jsp?type=3">日本</a></h2>
                
            </div>
            <div class="blk">
                <h2 class="tit"><a href="artist.jsp?type=4">韩国</a></h2>
                
            </div>
            <div class="blk">
                <h2 class="tit"><a href="artist.jsp?type=5">其他</a></h2>
                
            </div>
        </div>
    </div>
    <div class="g-mn2">
        <div class="g-mn2c">
            <div class="g-wrap">
                <div class="u-title f-cb">
                    <h3><span class="f-ff2"><%=title%></span></h3>

                </div>
                <div class="m-sgerlist">
                    <ul class="m-cvrlst m-cvrlst-5 f-cb">
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
												artistName = rs.getString("artistName");
												type = rs.getString("type");
												imgURL = rs.getString("imgURL");
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
										
                        <li>
                            <div class="u-cover u-cover-5">
                                <img src="images/artist/<%=imgURL%>"><a
                                    href="artistDetail.jsp?id=<%=ID%>" class="msk" title="<%=artistName%>"></a>
                            </div>
                            <p>
                                <a href="artistDetail.jsp?id=<%=ID%>" class="nm nm-icn f-thide s-fc0" title="<%=artistName%>"><%=artistName%></a>
                            </p>
                        </li>  
                        <%
											try {
													if (!rs.next()) {
														break;
													}
												} catch (Exception e) {
												}
											}
										%>                                                   
                        
                    </ul>
                </div>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="24" align="right">
											当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
											<%
												if (Page > 1) {
											%>
											<a href="artist.jsp?Page=1&type=<%=artistType%>">第一页</a>
											<a href="artist.jsp?Page=<%=Page - 1%>&type=<%=artistType%>">上一页</a>
											<%
												}
												if (Page < maxPage) {
											%>
											<a href="artist.jsp?Page=<%=Page + 1%>&type=<%=artistType%>">下一页</a>
											<a href="artist.jsp?Page=<%=maxPage%>&type=<%=artistType%>">最后一页&nbsp;</a>
											<%
												}
											%>
										</td>
									</tr>
								</table>
            </div>
        </div>
    </div>
</div>

<%--<div class="g-ft">
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

--%><a title="回到顶部" class="m-back" href="#" id="g_backtop" hidefocus="true" style="display:none;">回到顶部</a>
<script src="//s3.music.126.net/sep/s/2/core.js?d24ad53fbb6bb9dcbf17208e10101287" type="text/javascript"></script>
<iframe frameborder="0" id="auto-id-swhiOXlKxVMpcn4l" style="display: none;"
        src="http://mail.163.com/app/cloudmusic/proxy.html"></iframe>
<script src="//s3.music.126.net/sep/s/2/pt_discover_artist_index.js?7e4621affd2acc6528b1dce73586fe54"
        type="text/javascript"></script>

</body>
</html>