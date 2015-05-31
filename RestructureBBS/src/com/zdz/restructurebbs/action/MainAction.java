package com.zdz.restructurebbs.action;

import com.opensymphony.xwork2.ActionSupport;
import com.zdz.restructurebbs.dao.ArticleDao;
import com.zdz.restructurebbs.service.ArticleService;

public class MainAction extends ActionSupport {
	private int id;
	private int rootid;


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRootid() {
		return rootid;
	}

	public void setRootid(int rootid) {
		this.rootid = rootid;
	}

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	public String delete() {
		ArticleService articleService = new ArticleService();
		ArticleDao articleDao = new ArticleDao();
		articleService.setArticleDao(articleDao);
		articleService.deleteArticleById(id);
		return SUCCESS;
	}

}
