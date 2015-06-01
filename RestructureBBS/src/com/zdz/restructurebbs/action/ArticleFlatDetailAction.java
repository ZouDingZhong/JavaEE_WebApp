package com.zdz.restructurebbs.action;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zdz.restructurebbs.dao.ArticleDao;
import com.zdz.restructurebbs.model.Article;
import com.zdz.restructurebbs.service.ArticleService;

public class ArticleFlatDetailAction extends ActionSupport {

	private String id;
	private int rootId;
	private List<Article> articles;
	private Article firstArticle;

	private ArticleService articleService;
	public ArticleService getArticleService() {
		return articleService;
	}

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}

	public Article getFirstArticle() {
		return firstArticle;
	}

	public void setFirstArticle(Article firstArticle) {
		this.firstArticle = firstArticle;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRootId() {
		return rootId;
	}

	public void setRootId(int rootId) {
		this.rootId = rootId;
	}

	public List<Article> getArticles() {
		return articles;
	}

	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}

	@Override
	public String execute() throws Exception {
		
		articles = articleService.getArticlesByRootid(rootId);
		if(articles==null) return ERROR;
		firstArticle = articles.get(0);
		return SUCCESS;
	}

}
