<%@page pageEncoding="GBK"%>
<%@page import = "java.sql.*,com.zdz.bbs.*,java.util.*,java.sql.Date"%>
 <%
 	boolean logined = false;
 	String adminLogined = (String)session.getAttribute("adminLogined");
 	if(adminLogined!=null&&adminLogined.equalsIgnoreCase("true"))
 	{
 System.out.println("test"+logined);	
 		logined = true;
 	}	
  %>
 
 <%	
 	List<Article> articles = new ArrayList<Article>();
 	Connection conn = DB.getConn();
if(conn==null) System.out.println("????????????");
 	Statement stmt = DB.getStmt(conn);
 	
 	int pageSize = 4;
 	String strPageNo = request.getParameter("pageNo");
 	int pageNo=1;
 	if(strPageNo==null)
 	{
 		pageNo = 1;
 	}else
 	{
 		pageNo = Integer.parseInt(strPageNo);
 		if(pageNo<=0){pageNo=1;}
 	}
 	
 	int totalPageNo;
 	
 	Connection countConn = DB.getConn();
 	Statement countStmt = DB.getStmt(countConn);
 	ResultSet countRS = countStmt.executeQuery("select count(*) from article where pid = 0");
 	countRS.next();
 	int totalRecords = countRS.getInt(1);
 	totalPageNo = totalRecords%pageSize==0 ? totalRecords/pageSize : totalRecords/pageSize+1;
 	countConn.close();
 	countStmt.close();
 	countRS.close();
 	
 	if(pageNo>totalPageNo){pageNo=totalPageNo;}
 	int startNo = (pageNo-1)*pageSize;
 	String sql = "select * from article where pid = 0 order by pdate desc limit "+startNo+" , "+pageSize;
 	
 	ResultSet rs = DB.getResultSet(stmt, sql);

 	while(rs.next())
 	{
 	 		Article a = new Article();
			a.setId(rs.getInt("id"));
			a.setTitle(rs.getString("title"));
			a.setCont(rs.getString("cont"));
			a.setGrade(0);
			//�����getDate�ڷ�������getTimestamp
			a.setPdate(rs.getTimestamp("pdate"));
System.out.println(rs.getDate("pdate"));
			a.setLeaf(rs.getInt("isleaf")==0?true:false);
			a.setRootId(rs.getInt("rootid"));
		    a.setPid(rs.getInt("pid"));
		    a.setUserName(rs.getString("username"));
		    articles.add(a);
 	}
 	
 	String url = "";
 	url += request.getRequestURL();
    url += "?pageNo="+pageNo;
System.out.println(url);    
  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>���ư�BBS by zdz</title>
<meta http-equiv="content-type" content="text/html; charset=GBK">
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
        <td width="98%"><p class="jive-breadcrumbs">��̳: Java����web������ϰ
            </p>
          <p class="jive-description"> ����Ǹ����͵ļ�����̳����ҿ��������²�... </p>
          <p class="jive-description"> �������䣺424486138@qq.com</p>
          </td>
      </tr>
    </tbody>
  </table>
  <div class="jive-buttons">
    <table summary="Buttons" border="0" cellpadding="0" cellspacing="0">
      <tbody>
        <tr>
          <td class="jive-icon"><a href="newArticle.jsp"><img src="images/post-16x16.gif" alt="����������" border="0" height="16" width="16"></a></td>
          <td class="jive-icon-label"><a id="jive-post-thread" href="newArticle.jsp">����������</a> <a href="reply.jsp"></a></td>
        </tr>
        <td></td>
        <td class="jive-icon-label"><a id="jive-post-thread" href="login.jsp">����Ա��¼</a>
        <tr>
        
        </tr>
      </tbody>
    </table>
  </div>
  <br>
  <table border="0" cellpadding="3" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td><span class="nobreak"> �� <%=totalPageNo %> ҳ
        <span class="jive-paginator"> [ <a href="articleFlat.jsp?pageNo=<%=pageNo-1 %>">��һҳ</a> ]�� <%=pageNo %> ҳ [ <a href="articleFlat.jsp?pageNo=<%=pageNo+1 %>">��һҳ</a> ] </span> </span> </td>
      </tr>
    </tbody>
  </table>
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td width="99%"><div class="jive-thread-list">
            <div class="jive-table">
              <table summary="List of threads" cellpadding="0" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th class="jive-first" colspan="3"> ���� </th>
                    <th class="jive-author"> <nobr> ����
                      &nbsp; </nobr> </th>
                    <th class="jive-view-count"> <nobr> ���
                      &nbsp; </nobr> </th>
                    <th class="jive-msg-count" nowrap="nowrap"> �ظ� </th>
                    <th class="jive-last" nowrap="nowrap"> �������� </th>
                  </tr>
                </thead>
                <tbody>
                <%
                      int fnumb=0;
                     
                      Iterator<Article> it = articles.iterator();
                     
                      for(;it.hasNext();fnumb++) {
                      Article a = it.next();
                      String classStr = fnumb%2 == 0 ? "jive-even":"jive-odd";
                      %>
                  <tr class=<%=classStr %>>
                    <td class="jive-first" nowrap="nowrap" width="1%"><div class="jive-bullet"> <img src="images/read-16x16.gif" alt="�Ѷ�" border="0" height="16" width="16">
                        <!-- div-->
                      </div></td>
                      
                    <td nowrap="nowrap" width="1%">
                    <%
                    	System.out.println(logined);
                    	if(logined==true)
                    	{ 
                    	System.out.println("logined2222");
                    %>
                    <a href="delete.jsp?id=<%=a.getId() %>&isLeaf=<%=a.isLeaf()%>&url=<%=url %>">ɾ��</a>
                    <% }%>
                    </td>
                    
                    <td class="jive-thread-name" width="95%"><a id="jive-thread-1" href="articleFlatdetail.jsp?id=<%= a.getId()%>&rootid=<%= a.getRootId()%>"><%=a.getTitle() %></a></td>
                    <td class="jive-author" nowrap="nowrap" width="1%"><span class=""> <a href=""><%=a.getUserName() %></a> </span></td>
                    <td class="jive-view-count" width="1%"> 104</td>
                    <td class="jive-msg-count" width="1%"> 5</td>
                    <td class="jive-last" nowrap="nowrap" width="1%"><div class="jive-last-post"><%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(a.getPdate()) %><br>
                       </div></td>
                  </tr>
            
                    <% } %>
                </tbody>
              </table>
            </div>
          </div>
          <div class="jive-legend"></div></td>
      </tr>
    </tbody>
  </table>
  <br>
  <br>
</div>
</body>
</html>