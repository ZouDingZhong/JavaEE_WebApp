package com.zdz.restructurebbs.action;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;
import com.zdz.restructurebbs.dao.ArticleDao;
import com.zdz.restructurebbs.model.Article;
import com.zdz.restructurebbs.service.ArticleService;

public class SplitPageAction extends ActionSupport{

	private final int PAGESIZE = 4;
	//为了提高鲁棒性，本来应该使用String接收并检验的
	private int pageNumber = 1 ;
	private int totalPageNumber ;
	private List<Article> articles;
	private int lastPageNumber;
	private int nextPageNumber;
	
	private ArticleService articleService;
	public ArticleService getArticleService() {
		return articleService;
	}

	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	public int getLastPageNumber() {
		return lastPageNumber;
	}
	public void setLastPageNumber(int lastPageNumber) {
		this.lastPageNumber = lastPageNumber;
	}
	public int getNextPageNumber() {
		return nextPageNumber;
	}
	public void setNextPageNumber(int nextPageNumber) {
		this.nextPageNumber = nextPageNumber;
	}
	public List<Article> getArticles() {
		return articles;
	}
	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
	
	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getTotalPageNumber() {
		return totalPageNumber;
	}

	public void setTotalPageNumber(int totalPageNumber) {
		this.totalPageNumber = totalPageNumber;
	}

	@Override
	public String execute() throws Exception {
		
		totalPageNumber = articleService.getSplitPageTotalNumber(PAGESIZE);
		if (pageNumber<=0) {
			pageNumber = 1;
		}
		else if(pageNumber>totalPageNumber){
			pageNumber = totalPageNumber;
		}
		lastPageNumber = pageNumber-1;
		nextPageNumber = pageNumber+1;
		articles = articleService.getSplitPageList(PAGESIZE, pageNumber);
		return SUCCESS;
	}
	
}
