<%@page pageEncoding="GBK"%>
<%@page import = "java.sql.*,com.zdz.bbs.*,java.util.*"%>
<%
request.setCharacterEncoding("GB18030");

String isPost = request.getParameter("post");
System.out.println(isPost);
if(isPost!=null)
{
 	 String title = request.getParameter("title");
System.out.println(title);
	 String cont = request.getParameter("cont");
	 
	 String username = request.getParameter("username");
	 Connection conn = DB.getConn();

     boolean autoCommit = conn.getAutoCommit();
     conn.setAutoCommit(false);
 

	 int rootid = -1;		
	 String sql = "insert into article values (null, ?, ?, ?, ?, now(), ?,?)";
		PreparedStatement pstmt = DB.getPreStmt(conn, sql, Statement.RETURN_GENERATED_KEYS);
		pstmt.setInt(1, 0);
		pstmt.setInt(2, rootid);
		pstmt.setString(3, title);
		pstmt.setString(4, cont);
		pstmt.setInt(5, 0);
		pstmt.setString(6,username);
		pstmt.executeUpdate();
		
		ResultSet rsKey = pstmt.getGeneratedKeys();
		rsKey.next();
		rootid = rsKey.getInt(1);
	 
	 Statement stmt = conn.createStatement();
 	 stmt.executeUpdate("update article set rootid = " + rootid + " where id = "	+ rootid);
 	 
 	 conn.commit();
     conn.setAutoCommit(true);
 
 	 stmt.close();
 	 rsKey.close();
 	 pstmt.close();
 	 conn.close();
 	 
 	 response.sendRedirect("articleFlat.jsp");
}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>

<title>�½�����</title>
<meta http-equiv="content-type" content="text/html; charset=GBK">

<!-- this is the ckeditor coding -->
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>

<link rel="stylesheet" type="text/css" href="images/style.css" title="Integrated Styles">
<script language="JavaScript" type="text/javascript" src="images/global.js"></script>
<link rel="alternate" type="application/rss+xml" title="RSS" href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?forumID=20">
<script language="JavaScript" type="text/javascript" src="images/common.js"></script>

<script type="text/javascript" src="script/regcheckdata.js" >
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody>
    <tr>
      <td width="140"><a href="http://bbs.chinajavaworld.com/index.jspa"><img src="images/header-left.gif" alt="Java|Java����_������̳|ChinaJavaWorld������̳" border="0"></a></td>
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
        <td width="98%"><p class="jive-breadcrumbs">��̳: Java����web������ϰ</p>
          <p class="jive-description"> ����Ǹ����͵ļ�����̳����ҿ��������²�... </p>
              <p><a href="articleFlat.jsp"><img src="images/arrow-left-16x16.gif" alt="���ص������б�" border="0" height="16" hspace="6" width="16"></a> 
               <a href="articleFlat.jsp">���ص������б�</a> </p>
         
          </td>                     
      </tr>
    </tbody>
  </table>
  <br>
  <form action="newArticle.jsp" name="form" method="post" onSubmit="return checkdata()">
 
          <td>�����ǳƣ�<input type="text" name="username" style="height: 20px; width: 155px" onBlur="checkUserName(this.value.toLowerCase())"><br><span id="usernameErr"></span><td>
  
    <br>
    <input type="hidden" name="post" value="1">
          �� �⣺&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="title" style="height: 20px; width: 155px"><br>
  	<br>
  	���ݣ�<textarea class="ckeditor" name="cont" rows="20" cols="100"></textarea><br>
  	<input type="submit" name="submit" id="submit" value="submit">
  </form>
  
<!-- this is the ckeditor coding -->  
<script type="text/javascript">
//<![CDATA[
 CKEDITOR.replace( 'editor1',//editor1�����ı����ID
  {
   skin : 'kama'//��Ҫʹ�õ�Ƥ��
  });
//]]>
</script>
  
  
</div>
</body>
</html>