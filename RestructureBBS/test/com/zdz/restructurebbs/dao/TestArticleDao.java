package com.zdz.restructurebbs.dao;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.management.Query;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

import com.zdz.restructurebbs.model.Article;

public class TestArticleDao {
	@Test
	public void testSplitPage()
	{
		SessionFactory sessionFactory;
		sessionFactory = new Configuration().configure().buildSessionFactory();		
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		org.hibernate.Query query = session.createQuery("from Article article where article.pid = 0 order by article.pdate desc");
		query.setFirstResult(4);
		query.setMaxResults(4);
		Iterator<Article> iterator = query.list().iterator();
		while(iterator.hasNext())
		{
			System.out.println(iterator.next().getTitle());
		}
		session.getTransaction().commit();
		session.close();
	}
	@Test
	public void testEncoding()
	{
		SessionFactory sessionFactory;
		sessionFactory = new Configuration().configure().buildSessionFactory();		
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		Article article = new Article();
		article.setTitle("我感觉呵呵哒");
		session.save(article);
		
		session.getTransaction().commit();
		session.close();
	}
	@Test
	public void testIsLeaf()
	{
		SessionFactory sessionFactory;
		sessionFactory = new Configuration().configure().buildSessionFactory();		
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		Article article = new Article();
		article = (Article) session.get(Article.class,75);
		System.out.println(article.getIsLeaf());
		
		session.getTransaction().commit();
		session.close();
	}
	@Test
	public void testDelete()
	{
		ArticleDao articleDao = new ArticleDao();
		articleDao.setSessionFactory(new Configuration().configure().buildSessionFactory());
		articleDao.deleteById(96);
	}
	@Test
	public void testIterator()
	{
		List list = new LinkedList();
		list.add(1);
		list.add(2);
		Iterator iterator = list.iterator();
//		System.out.println(iterator);
//		iterator.next();
//		System.out.println(iterator);
		while(iterator.hasNext())
		{
			System.out.println(iterator.next());
		}
	}
}
