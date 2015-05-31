package com.zdz.restructurebbs.service;

import java.util.List;

import org.hibernate.Session;

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

	public int save(Article article) {
		return articleDao.save(article);
	}

	public List<Article> getSplitPageList(int pageSize, int pageNumber) {
		return articleDao.getSplitPageList(pageSize, pageNumber);
	}

	public int getSplitPageTotalNumber(int pageSize) {
		return articleDao.getSplitPageTotalNumber(pageSize);
	}

	public List<Article> getArticlesByRootid(int rootId) {
		return articleDao.getArticlesByRootid(rootId);
	}

	public Article getArticleById(int id) {
		return articleDao.getArticleById(id);
	}
	public void deleteArticleById(int id) {
		articleDao.deleteById(id);
	}
}
