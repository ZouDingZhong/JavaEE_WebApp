<%@page pageEncoding="GBK"%>
<%@page import="java.sql.*,com.zdz.bbs.*,java.util.*,java.sql.Date"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	boolean logined = false;
	String adminLogined = (String) session.getAttribute("adminLogined");
	if (adminLogined != null && adminLogined.equalsIgnoreCase("true")) {
		logined = true;
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>���ư�BBS by zdz</title>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<link rel="stylesheet" type="text/css" href="images/style.css"
	title="Integrated Styles">
<script language="JavaScript" type="text/javascript"
	src="images/global.js"></script>
<link rel="alternate" type="application/rss+xml" title="RSS"
	href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?forumID=20">
<script language="JavaScript" type="text/javascript"
	src="images/common.js"></script>
</head>
<body>
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tbody>
			<tr>
				<td width="140"><a
					href="http://bbs.chinajavaworld.com/index.jspa"><img
						src="images/header-left.gif"
						alt="Java|Java����_������̳|ChinaJavaWorld������̳" border="0"></a></td>
				<td><img src="images/header-stretch.gif" alt="" border="0"
					height="57" width="100%"></td>
				<td width="1%"><img src="images/header-right.gif" alt=""
					border="0"></td>
			</tr>
		</tbody>
	</table>
	<br>
	<div id="jive-forumpage">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr valign="top">
					<td width="98%"><p class="jive-breadcrumbs">��̳:
							Java����web������ϰ</p>
						<p class="jive-description">����Ǹ����͵ļ�����̳����ҿ��������²�...</p>
						<p class="jive-description">�������䣺424486138@qq.com</p></td>
				</tr>
			</tbody>
		</table>
		<div class="jive-buttons">
			<table summary="Buttons" border="0" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td class="jive-icon"><a href="newArticle"><img
								src="images/post-16x16.gif" alt="����������" border="0" height="16"
								width="16"></a></td>
						<td class="jive-icon-label"><a id="jive-post-thread"
							href="newArticle">����������</a> <a href="reply"></a></td>
					</tr>
					<td></td>
					<td class="jive-icon-label"><a id="jive-post-thread"
						href="login">����Ա��¼</a>
					<tr>

					</tr>
				</tbody>
			</table>
		</div>
		<br>
		<table border="0" cellpadding="3" cellspacing="0" width="100%">
			<tbody>
				<tr valign="top">
					<td><span class="nobreak"> �� <s:property
								value="totalPageNumber" /> ҳ <span class="jive-paginator">
								[ <a
								href="articleFlat?pageNumber=<s:property value='lastPageNumber'/>">��һҳ</a>
								]�� <s:property value="pageNumber" /> ҳ [ <a
								href="articleFlat?pageNumber=<s:property value='nextPageNumber'/>">��һҳ</a>
								]
						</span>
					</span></td>
				</tr>
			</tbody>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr valign="top">
					<td width="99%"><div class="jive-thread-list">
							<div class="jive-table">
								<table summary="List of threads" cellpadding="0" cellspacing="0"
									width="100%">
									<thead>
										<tr>
											<th class="jive-first" colspan="3">����</th>
											<th class="jive-author"><nobr> ���� &nbsp; </nobr></th>
											<th class="jive-view-count"><nobr> ��� &nbsp; </nobr></th>
											<th class="jive-msg-count" nowrap="nowrap">�ظ�</th>
											<th class="jive-last" nowrap="nowrap">��������</th>
										</tr>
									</thead>
									<tbody>
										<s:iterator value="articles">
											<tr class="jive-even">
												<td class="jive-first" nowrap="nowrap" width="1%"><div
														class="jive-bullet">
														<img src="images/read-16x16.gif" alt="�Ѷ�" border="0"
															height="16" width="16">
														<!-- div-->
													</div></td>

												<td nowrap="nowrap" width="1%"></td>

												<td class="jive-thread-name" width="95%"><a
													id="jive-thread-1"
													href="articleFlatDetail?id=<s:property value="id"/>&rootid=<s:property value="rootId"/>"><s:property
															value="title" /></a></td>
												<td class="jive-author" nowrap="nowrap" width="1%"><span
													class=""> <a href=""><s:property
																value="username" /></a>
												</span></td>
												<td class="jive-view-count" width="1%">104</td>
												<td class="jive-msg-count" width="1%">5</td>
												<td class="jive-last" nowrap="nowrap" width="1%"><div
														class="jive-last-post">
														<s:property value="pdate" />
														<br>
													</div></td>
											</tr>

										</s:iterator>
									</tbody>
								</table>
							</div>
						</div>
						<div class="jive-legend"></div></td>
				</tr>
			</tbody>
		</table>
		<br> <br>
	</div>
</body>
</html>