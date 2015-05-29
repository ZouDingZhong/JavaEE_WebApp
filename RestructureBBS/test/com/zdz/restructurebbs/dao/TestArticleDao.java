package com.zdz.restructurebbs.dao;

import java.util.Iterator;

import javax.management.Query;

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
}
