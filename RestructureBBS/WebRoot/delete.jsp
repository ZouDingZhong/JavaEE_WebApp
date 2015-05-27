<%@page pageEncoding="GBK"%>
<%@page import = "java.sql.*,com.zdz.bbs.*,java.util.*,java.sql.PreparedStatement"%>
 <%@ include file="_SessionCheck.jsp"%>
 
 <%!
 	void delete(Connection conn,int id,boolean isLeaf)
 	{
 		if(!isLeaf)
 		{
	 		Statement stmt = null;
	 		ResultSet rs = null;
	 		try{	
	 		stmt = DB.getStmt(conn);
	 		rs = DB.getResultSet(stmt, "select * from article where pid = "+id);
	 		while(rs.next())
	 		{
	 			delete(conn,rs.getInt("id"),rs.getInt("isLeaf")==0);	
	 		}
	 		
	 		}catch(SQLException e)
	 		{
	 			e.printStackTrace();
	 		}finally
	 		{
	 			DB.close(rs);
	 			DB.close(stmt);
	 		}
 		}
 		
 			Statement stmt = null;
	 		try{
	 			stmt = DB.getStmt(conn);
	 			stmt.executeUpdate("delete from article where id = "+id);
	 		}catch(SQLException e)
	 		{
	 			e.printStackTrace();
	 		}finally
	 		{
	 			DB.close(stmt);
	 		}
 		
 	}
  %>
 
 <%
 request.setCharacterEncoding("GB18030");
 int id = Integer.parseInt(request.getParameter("id"));
 boolean isLeaf = Boolean.parseBoolean(request.getParameter("isLeaf"));
 String indexUrl = request.getParameter("url");
 System.out.println("delete url = "+indexUrl);
 
 Connection conn = DB.getConn();
 delete(conn,id,isLeaf);
 
 DB.close(conn);
 
 
  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Java|Java世界_中文论坛|ChinaJavaWorld技术论坛 : Java语言*初级版</title>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<link rel="stylesheet" type="text/css" href="images/style.css" title="Integrated Styles">
<script language="JavaScript" type="text/javascript" src="images/global.js"></script>
<link rel="alternate" type="application/rss+xml" title="RSS" href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?forumID=20">
<script language="JavaScript" type="text/javascript" src="images/common.js"></script>

<!--  
<script language="JavaScript1.2" type="text/javascript">
function delayURL(url) {
	div delay = document.getElementById("time").innerText;
alert(delay);
	if(delay>0)
	{
		delay--;
		document.getElementById("time").innerText = delay;
	}
	else
	{
		top.location.href='article.jsp';
	}
    setTimeout("delayURL('" + url + "')", 1000);
}
</script>
-->


<script language="JavaScript1.2" type="text/javascript">
<!--
//  Place this in the 'head' section of your page.  


function delayURL(url, time) {
    setTimeout("top.location.href='" + url + "'", time);
}

//-->

</script>

</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody>
    <tr>
      <td width="140"><a href="http://bbs.chinajavaworld.com/index.jspa"><img src="images/header-left.gif" alt="Java|Java世界_中文论坛|ChinaJavaWorld技术论坛" border="0"></a></td>
      <td><img src="images/header-stretch.gif" alt="" border="0" height="57" width="100%"></td>
      <td width="1%"><img src="images/header-right.gif" alt="" border="0"></td>
    </tr>
  </tbody>
</table>
<br>
<div id="jive-forumpage">
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td width="98%"><p class="jive-breadcrumbs">
                     论坛: Java语言web开发练习</p>
          <p class="jive-description"> 这个是个打酱油的简易论坛，大家可以随意吐槽... </p>
          </td>
      </tr>
    </tbody>
  </table>
  <br>
  <h1>删除操作完成！</h3>




<!--  
  <script language="JavaScript1.2" type="text/javascript">
  delayURL('article.jsp')
alert("work");
System.out.println("swork");  
  </script>
  <span id="time">3</span>秒后自动跳转，如未跳转请点击
  <a href="article.jsp" onClick="top.location.href='article.jsp'">此处...</a>
 -->
  
  <script language="JavaScript1.2" type="text/javascript">
  delayURL('articleFlat.jsp','3000')
  </script>
  <span id="time">3</span>秒后自动跳转，如未跳转请点击
  <a href="javascript:" onClick="delayURL('articleFlat.jsp','0000')">此处...</a>
 
  
</div>
</body>
</html>