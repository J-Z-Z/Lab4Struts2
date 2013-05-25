package md.victordov.lab.dao;

import java.util.List;
import md.victordov.lab.common.HibernateUtil;
import md.victordov.lab.common.exception.ErrorList;
import md.victordov.lab.common.exception.MyDaoException;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

public abstract class AbstractDao {
    private Session session;
    

    protected boolean create(Object obj) throws MyDaoException {
    	session = HibernateUtil.getSessionFactory().openSession();
    	Transaction tx = session.beginTransaction();
        try {
            session.saveOrUpdate(obj);
            tx.commit();
        } catch (HibernateException he) {
    		if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.RETRIEVE_LIST_ERR_KEY, he);
        } finally {
        	session.close();
        }
        return true;
    }

    public boolean delete(Class<?> clazz, Integer id) throws MyDaoException {
    	session = HibernateUtil.getSessionFactory().openSession();
    	Transaction tx = session.beginTransaction();
        try {
        	Object obj = session.get(clazz, id);
            session.delete(obj);
            tx.commit();
        } catch (HibernateException he) {
        	throw new MyDaoException(ErrorList.RETRIEVE_LIST_ERR_KEY, he);
        } finally {
            session.close();
        }
        return true;
    }

    protected Object retrieve(Class<?> clazz, Integer id) throws MyDaoException {
    	session = HibernateUtil.getSessionFactory().openSession();
        Object obj = null;
        try {
            obj = session.get(clazz, id);
        } catch (HibernateException he) {
        	throw new MyDaoException(ErrorList.RETRIEVE_LIST_ERR_KEY, he);
        } finally {
            session.close();
        }
        return obj;
    }
    
    
    protected List<?> retrieve(Class<?> clazz, Integer start, Integer maxRecords) throws MyDaoException {
    	session = HibernateUtil.getSessionFactory().openSession();
        List<?> list= null;
        try {
        	list = session.createCriteria(clazz).setFirstResult(start).setMaxResults(maxRecords).list();
        } catch (HibernateException he) {
        	throw new MyDaoException(ErrorList.RETRIEVE_LIST_ERR_KEY, he);
        } finally {
            session.close();
        }
        return list;
    }

    protected List<?> retrieve(Class<?> clazz) throws MyDaoException {
    	session = HibernateUtil.getSessionFactory().openSession();
        List<?> objects = null;
        try {
            objects = (List<?>) session.createCriteria(clazz).list();
        } catch (HibernateException he) {
        	throw new MyDaoException(ErrorList.RETRIEVE_LIST_ERR_KEY, he);
        } finally {
            session.close();
        }
        return objects;
    }
    protected Long countSize(Class<?> clazz){
    	session = HibernateUtil.getSessionFactory().openSession();
		Long count = ((Long) session.createQuery("select count(*) from "+ clazz.getName()).uniqueResult()).longValue();
		session.close();
		return count;
    }
}