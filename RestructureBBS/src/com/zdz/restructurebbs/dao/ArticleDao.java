package com.zdz.restructurebbs.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.zdz.restructurebbs.model.Article;

public class ArticleDao {
	private SessionFactory sessionFactory;
	public ArticleDao()
	{
		sessionFactory = new Configuration().configure().buildSessionFactory();		
	}
	public int save(Article article){
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(article);
		int id = article.getId();
		session.getTransaction().commit();
		session.close();
		return id;
	}
//	public Article getOneArticle(Article article) {
//		Session session = sessionFactory.openSession();
//		session.beginTransaction();
//		Article article2 = (Article) session.get(Article.class.getClass(), article);
//		session.getTransaction().commit();
//		session.close();
//		return article2;
//	}
}
