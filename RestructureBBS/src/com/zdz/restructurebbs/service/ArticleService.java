package com.zdz.restructurebbs.service;

import com.zdz.restructurebbs.dao.ArticleDao;
import com.zdz.restructurebbs.model.Article;

public class ArticleService {
	private ArticleDao articleDao;
	
	public ArticleDao getArticleDao() {
		return articleDao;
	}

	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	public int save(Article article){
		return articleDao.save(article);
	}
//	public Article getOneArticle(Article article)
//	{
//		return articleDao.getOneArticle(article);
//	}
}
