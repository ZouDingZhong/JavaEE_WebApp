package com.zdz.restructurebbs.dao;

import java.util.Iterator;
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
	public List<Article> getArticlesByRootid(int rootId)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		org.hibernate.Query query = session.createQuery("from Article article where article.rootId = "+rootId+" order by article.pdate");
		List<Article> list = query.list();
		session.getTransaction().commit();
		session.close();
		return list;
	}
	public void deleteById(int id)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		Article article = (Article) session.get(Article.class, id);
		boolean isLeaf = article.getIsLeaf();
		if(isLeaf==true)
		{
			session.delete(article);
		}
		else {
			List<Article> articles = session.createQuery("from Article article where article.rootId = "+id).list();
			Iterator<Article> iterator = articles.iterator();
			iterator.next();//这里是为了挣脱无限循环，因为第一个子贴就是自己
			article.setIsLeaf(true);
			session.update(article);
			while(iterator.hasNext())
			{
				delete(iterator.next());
			}
			delete(article);
		}
		session.getTransaction().commit();
		session.close();
	}
	
	public void delete(Article article)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		if(article.getIsLeaf())
		{
			session.delete(article);
		}
		else {
			List<Article> articles = session.createQuery("from Article article where article.rootId = "+article.getId()).list();
			Iterator<Article> iterator = articles.iterator();
			iterator.next();//这里是为了挣脱无限循环，因为第一个子贴就是自己
			article.setIsLeaf(true);
			session.update(article);
			while(iterator.hasNext())
			{
				delete(iterator.next());
			}
			
			delete(article);
		}
		session.getTransaction().commit();
		session.close();

	}
	
	
	public Article getArticleById(int id)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		org.hibernate.Query query = session.createQuery("from Article article where article.id = "+id);
		List<Article> list = query.list(); 
		session.getTransaction().commit();
		session.close();
		return list.get(0);

	}
}

