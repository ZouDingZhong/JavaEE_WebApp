<%@page import="java.sql.Date"%>
<%@page import="com.zdz.restructurebbs.service.ArticleService"%>
<%@page pageEncoding="GBK"%>
<%@page import = "java.sql.*,com.zdz.restructurebbs.model.*,com.zdz.restructurebbs.dao.*,java.util.*,java.sql.PreparedStatement"%>
 <%
 request.setCharacterEncoding("GB18030");
 
 int pid = Integer.parseInt(request.getParameter("pid"));
 int rootid = Integer.parseInt(request.getParameter("rootid"));
 String title = request.getParameter("title");
 String cont = request.getParameter("cont");
 String username = request.getParameter("username");

 ArticleService articleService = new ArticleService();
 ArticleDao articleDao = new ArticleDao();
 articleService.setArticleDao(articleDao);
 
 Article article = new Article();
 article.setCont(cont);
 article.setPdate(new Date(System.currentTimeMillis()));
 article.setIsLeaf(true);
 article.setPid(pid);
 article.setRootId(rootid);
 article.setTitle(title);
 article.setUsername(username);
 
 articleService.save(article);
 
  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Java|Java����_������̳|ChinaJavaWorld������̳ : Java����*������</title>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<link rel="stylesheet" type="text/css" href="images/style.css" title="Integrated Styles">
<script language="JavaScript" type="text/javascript" src="images/global.js"></script>
<link rel="alternate" type="application/rss+xml" title="RSS" href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?forumID=20">
<script language="JavaScript" type="text/javascript" src="images/common.js"></script>
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
        <td width="98%"><p class="jive-breadcrumbs">��̳: Java����*������
            (ģ��)</p>
          <p class="jive-description">̽��Java���Ի���֪ʶ,�����﷨�� ���һ����
							��ͬ��ߣ�л���κ���ʽ�Ĺ��</p></td>
      </tr>
    </tbody>
  </table>
  <br>
  <h1>�ظ���ɣ�</h3>
  <script language="JavaScript1.2" type="text/javascript">
  delayURL('articleFlat','3000')
  </script>
  <span id="time">3</span>����Զ���ת����δ��ת����
  <a href="javascript:" onClick="delayURL('articleFlat','0000')">�˴�...</a>
</div>
</body>
</html>