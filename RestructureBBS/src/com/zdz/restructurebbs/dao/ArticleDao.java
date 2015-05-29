package com.zdz.restructurebbs.dao;

import java.util.List;

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
	public List<Article> getSplitPageList(int pageSize,int pageNumber)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		org.hibernate.Query query = session.createQuery("from Article article where article.pid = 0 order by article.pdate desc");
		query.setFirstResult((pageNumber-1)*pageSize);
		query.setMaxResults(pageSize);
		List<Article> list = query.list();
		session.getTransaction().commit();
		session.close();
		return list;
	}
	public int getSplitPageTotalNumber(int pageSize)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		org.hibernate.Query query = session.createQuery("from Article article where article.pid = 0");
		int totalRecords = query.list().size();
		int totalPageNumber = totalRecords%pageSize==0 ? totalRecords/pageSize : totalRecords/pageSize+1;
		session.getTransaction().commit();
		session.close();
		return totalPageNumber;
	}
}
