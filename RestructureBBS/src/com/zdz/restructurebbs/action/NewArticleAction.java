package com.zdz.restructurebbs.action;

import java.sql.Date;

import org.hibernate.Session;

import sun.print.resources.serviceui;

import com.opensymphony.xwork2.ActionSupport;
import com.zdz.restructurebbs.dao.ArticleDao;
import com.zdz.restructurebbs.model.Article;
import com.zdz.restructurebbs.service.ArticleService;

public class NewArticleAction extends ActionSupport{

	private String title;
	private String cont;
	private String username;
	private String post;

	private int pid; 
	private int rootid;
	
	
	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public int getRootid() {
		return rootid;
	}

	public void setRootid(int rootid) {
		this.rootid = rootid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	@Override
	public String execute() throws Exception {
		if(post!=null)
		{
			 ArticleService articleService = new ArticleService();
			 ArticleDao articleDao = new ArticleDao();
			 articleService.setArticleDao(articleDao);
			 
			 Article article = new Article();
			 int rootid = -1;		
			 article.setCont(cont);
			 article.setIsLeaf(true);
			 article.setPdate(new Date(System.currentTimeMillis()));
			 article.setPid(0);
			 article.setRootId(rootid);
			 article.setTitle(title);
			 article.setUsername(username);
			 rootid = articleService.save(article);
			 article.setRootId(rootid);
			 articleService.save(article);
			 return "return";
		}
		return SUCCESS;
	}
	public String replyDeal()
	{
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
		 
		 Article superArticle = articleService.getArticleById(pid);
		 superArticle.setIsLeaf(false);
		 articleService.save(superArticle);
		 
		 articleService.save(article);
		return SUCCESS;
	}
	
}
