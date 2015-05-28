<%@ page language="java" import="java.util.*,com.zdz.bbs.*,java.sql.*" pageEncoding="GB18030"%>
<%


String strId = request.getParameter("id");
String rootid = request.getParameter("rootid");

if(strId == null || strId.trim().equals("")) {
	out.println("Error ID!");
	return;
}
int id = 0;
try {
	id = Integer.parseInt(strId);
} catch (NumberFormatException e) {
	out.println("Error ID Again!");
	return;
} 

Article a = null;
List<Article> articles = new ArrayList<Article>();

Connection conn = DB.getConn();
String sql = "select * from article where rootid = " + rootid;
Statement stmt = DB.getStmt(conn);
ResultSet rs = DB.getResultSet(stmt, sql);
while(rs.next())
{
						 a = new Article();
			a.setId(rs.getInt("id"));
			a.setTitle(rs.getString("title"));
			a.setCont(rs.getString("cont"));
			//这里的getDate在范例中是getTimestamp
			a.setPdate(rs.getDate("pdate"));
			a.setLeaf(rs.getInt("isleaf")==0?true:false);
			a.setRootId(rs.getInt("rootid"));
		    a.setPid(rs.getInt("pid"));
		    a.setUserName(rs.getString("username"));
		    articles.add(a);
		    

}

DB.close(rs);
DB.close(stmt);
DB.close(conn);

if(a == null) {
%>
	您寻找的帖子不存在！
<%
	return;
}
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>帖子内容</title>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<link rel="stylesheet" type="text/css" href="images/style.css" title="Integrated Styles">
<script language="JavaScript" type="text/javascript" src="images/global.js"></script>
<link rel="alternate" type="application/rss+xml" title="RSS" href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?threadID=744236">
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
<div id="jive-flatpage">
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td width="99%"><p class="jive-breadcrumbs"> <a href="articleFlat">首页</a> &#187; <a href="articleFlat">简易BBS</a> </p>
          <p class="jive-page-title">  主题: <%=articles.get(0).getTitle() %> </p></td>
        <td width="1%"><div class="jive-accountbox"></div></td>
      </tr>
    </tbody>
  </table>
  <div class="jive-buttons">
    <table summary="Buttons" border="0" cellpadding="0" cellspacing="0">
      <tbody>
        <tr>
          <td class="jive-icon"><a href="reply?id=<%=a.getId() %>&rootid=<%=a.getRootId() %>"><img src="images/reply-16x16.gif" alt="回复本主题" border="0" height="16" width="16"></a></td>
          <td class="jive-icon-label"><a id="jive-reply-thread" href="reply?id=<%=a.getId() %>&rootid=<%=a.getRootId() %>">回复本主题</a> </td>
          <td><a href="articleFlat.jsp"><img src="images/arrow-left-16x16.gif" alt="返回到主题列表" border="0" height="16" hspace="6" width="16"></a> </td>
          <td><a href="articleFlat.jsp">返回到主题列表</a> </td>
        </tr>
      </tbody>
    </table>
  </div>
  <br>
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td width="99%"><div id="jive-message-holder">
            <div class="jive-message-list">
              <div class="jive-table">
                <div class="jive-messagebox">
                	
                	<!-- this is the begin of the for -->
                  
                  <%
                    int i=1;
                    String floor;
                  	for(Iterator<Article> it = articles.iterator();it.hasNext();i++) {
                      Article ra = it.next();
                      floor = i==1 ? "楼主" : "第" + i +"楼";
                  %>
                  
                  <table summary="Message" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tbody>
                      <tr id="jive-message-780144" class="jive-odd" valign="top">
                        <td class="jive-first" width="1%">
						<!-- 个人信息的table -->
						<table border="0" cellpadding="0" cellspacing="0" width="150">
                            <tbody>
                              <tr>
                                <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                      <tr valign="top">
                                        <td style="padding: 0px;" width="1%"><nobr> <a href="" title="发帖昵称"><%=ra.getUserName()%></a> </nobr> </td>
                                        <td style="padding: 0px;" width="99%"><img class="jive-status-level-image" src="images/level3.gif" title="世界新手" alt="" border="0"><br>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                  <img class="jive-avatar" src="images/avatar-display.png" alt="" border="0"> <br>
                                  <br>
                                  <span class="jive-description"> 发表:
                                  34 <br>
                                  点数: 100<br>
                                  注册:<%=a.getPdate()%>
                                   <br>
                                  <a href="http://user.qzone.qq.com/424486138" target="_blank"><font color="red">访问我的空间</font></a> </span> </td>
                              </tr>
                            </tbody>
                          </table>
						  <!--个人信息table结束-->
						  
						  </td>
                        <td class="jive-last" width="99%"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                              <tr valign="top">
                                <td width="1%"></td>
                                <td width="97%"><span class="jive-subject"><%=floor %> ------- <%=ra.getTitle() %></span> </td>
                                <td class="jive-rating-buttons" nowrap="nowrap" width="1%"></td>
                                <td width="1%"><div class="jive-buttons">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                      <tbody>
                                        <tr>
                                          <td>&nbsp;</td>
                                          <td class="jive-icon"><a href="reply?id=<%=ra.getId() %>&rootid=<%=ra.getRootId() %>" title="回复本主题"><img src="images/reply-16x16.gif" alt="回复本主题" border="0" height="16" width="16"></a> </td>
                                          <td class="jive-icon-label"><a href="reply?id=<%=ra.getId() %>&rootid=<%=ra.getRootId() %>" title="回复本主题">回复</a> </td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </div></td>
                              </tr>
                              <tr>
                                <td colspan="4" style="border-top: 1px solid rgb(204, 204, 204);"><br>
                                  <%=ra.getCont()%><br>
                                  <br>
                                </td>
                              </tr>
                              <tr>
                                <td colspan="4" style="font-size: 9pt;"><img src="images/sigline.gif"><br>
                                  <font color="#568ac2">Stay hungry Stay foolish</font> <br>
                                </td>
                              </tr>
                              <tr>
                                <td colspan="4" style="border-top: 1px solid rgb(204, 204, 204); font-size: 9pt; table-layout: fixed;"> ·<a href="http://user.qzone.qq.com/424486138"><font color="#666666">我的QQ空间</font></a> </td>
                              </tr>
                            </tbody>
                          </table></td>
                      </tr>
                    </tbody>
                  </table>

 									<%
 									}
                  %>
                 
                  <!-- this is the end of the for -->
                  
                </div>
              </div>
            </div>
            <div class="jive-message-list-footer">
              <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tbody>
                  <tr>
                    <td nowrap="nowrap" width="1%"></td>
                    <td align="center" width="98%"><table border="0" cellpadding="0" cellspacing="0">
                        <tbody>
                          <tr>
                            <td><a href="articleFlat"><img src="images/arrow-left-16x16.gif" alt="返回到主题列表" border="0" height="16" hspace="6" width="16"></a> </td>
                            <td><a href="articleFlat">返回到主题列表</a> </td>
                          </tr>
                        </tbody>
                      </table></td>
                    <td nowrap="nowrap" width="1%">&nbsp;</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div></td>
        <td width="1%"></td>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>
