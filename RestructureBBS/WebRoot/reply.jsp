<%@page pageEncoding="GBK"%>
<%@page import = "java.sql.*,com.zdz.bbs.*,java.util.*"%>
<%

String id =  request.getParameter("id");
String rootid =  request.getParameter("rootid");
System.out.println("test iswork"+id);

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>

<title>Java|Java����_������̳|ChinaJavaWorld������̳ : Java����*������</title>
<meta http-equiv="content-type" content="text/html; charset=GBK">

<!-- this is the ckeditor coding -->
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="script/regcheckdata.js" >
</script>
<link rel="stylesheet" type="text/css" href="images/style.css" title="Integrated Styles">
<script language="JavaScript" type="text/javascript" src="images/global.js"></script>
<link rel="alternate" type="application/rss+xml" title="RSS" href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?forumID=20">
<script language="JavaScript" type="text/javascript" src="images/common.js"></script>
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
  <form action="replyDeal.jsp" name="form" method="post" >
    <input type="hidden" name="pid" value="<%=id%>">
    <input type="hidden" name="rootid" value="<%=rootid%>">
    
   <td>�����ǳƣ�<input type="text" name="username" style="height: 20px; width: 155px" onBlur="checkUserName(this.value.toLowerCase())"><br><span id="usernameErr"></span><td>
    <br>
    <input type="hidden" name="post" value="1">
          �� �⣺&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="title" style="height: 20px; width: 155px"><br>
  	<br>
  	���ݣ�<textarea class="ckeditor" name="cont" rows="20" cols="100"></textarea><br>
  	<input type="submit" name="submit" id="submit" value="�ύ">
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