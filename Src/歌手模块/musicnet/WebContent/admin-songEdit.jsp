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
						<a ><em>�޸ĸ���</em>
						</a>
					</li>
				</ul>
				
				<form onsubmit="return editCheck();" action="admin-songEdit_deal.jsp">
					<div class="n-base f-cb">
						<div class="frm m-frm">
						
							<div class="itm">
								�������ƣ�<input type="text" value="<%=songName%>" class="u-txt txt" id="songName"  name="songName" maxlength="30">
							</div>

							<div class="itm">
								���֣�
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
								���ࣺ
								<select id="type" name="type" class="u-txt txt" style="height:auto">
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
								�����ļ���ַ��<input value="<%=fileURL%>" type="text" class="u-txt txt" id="fileURL" name="fileURL" maxlength="30">
							</div>
							
							<input type="hidden" value="<%=id%>" name="ID">						
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
    
	$("#type option[value='"+<%=type%>+"']").attr("selected",true);
	$("#singer option[value=<%=singer%>]").attr("selected",true);

	function  editCheck(){
		
		if($('#songName').val()==""){
			alert("������������Ϊ�գ�");
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
<%conn.close();
}else{
	out.println("<script lanage='javascript'>alert('���ȵ�¼�����޸ĸ�����Ϣ!');window.location.href='index.jsp';</script>");
}%>