package md.victordov.lab.test;

import java.util.ArrayList;
import java.util.List;

import javassist.bytecode.stackmap.TypeData.ClassName;

import md.victordov.lab.common.HibernateUtil;
import md.victordov.lab.common.exception.ErrorList;
import md.victordov.lab.common.exception.MyDaoException;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class MyTestDAO<T> {
	private Class<T> t;
	protected Session session;
	
	@SuppressWarnings("unchecked")
	public List<T> retrieve() throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		List<T> list = new ArrayList<T>();
		try {
			list = (List<T>) session.createQuery("from " + className(t)).list();
			tx.commit();
		} catch (HibernateException he) {
			if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.RETRIEVE_LIST_ERR_KEY, he);
		} finally {
			session.close();
		}
		return list;
	}
	
	public String className(Class<T> e) {
	   return e.getClass().getSimpleName();
	}
	
	

}
