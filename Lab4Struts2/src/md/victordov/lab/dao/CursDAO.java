package md.victordov.lab.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import md.victordov.lab.common.HibernateUtil;
import md.victordov.lab.common.exception.ErrorList;
import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.vo.Curs;

public class CursDAO implements Serializable, GenericDAO<Curs> {

	/**
	 * @author VictorDov
	 * 
	 *         DAO class CursDAO manages the Curs objects ( creates, reads one
	 *         or all or predefined number, updates, deletes, counts the number
	 *         of records.
	 */

	private static final long serialVersionUID = 1L;
	private Session session;

	@SuppressWarnings("unchecked")
	@Override
	public List<Curs> retrieve() throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		List<Curs> list = new ArrayList<Curs>();
		try {
			list = (List<Curs>) session.createQuery("from Curs").list();
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

	@Override
	public Curs retrieve(int id) throws MyDaoException {
		Session session = null;

		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		try {
			Curs instance = (Curs) session.get(Curs.class, id);
			if (instance == null) {
				System.out.println("get successful, no instance found");
			} else {
				System.out.println("CursDao, method retrieve( id )");
				System.out.println("get successful, instance found");
			}
			return instance;
		} catch (HibernateException he) {
			if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.RETRIEVE_ERR_KEY, he);
		} catch (RuntimeException re) {
			re.printStackTrace();
			throw re;
		} finally {
			session.close();
		}

	}

	@Override
	public boolean create(Curs t) throws MyDaoException {

		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(t);
			tx.commit();
		} catch (HibernateException he) {
			if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.CREATE_ERR_KEY, he);
		} finally {
			session.close();
		}
		return true;
	}

	@Override
	public boolean update(Curs t) throws MyDaoException {

		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(t);
			tx.commit();
		} catch (HibernateException he) {
			if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.UPDATE_ERR_KEY, he);
		} finally {
			session.close();
		}
		
		return true;

	}

	@Override
	public boolean delete(int id) throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();
		
		try {
			session.delete((Curs) session.get(Curs.class, id));
			tx.commit();
		} catch (HibernateException he) {
			if (tx != null)
				tx.rollback();
			throw new MyDaoException(ErrorList.DELETE_ERR_KEY, he);
		} finally {
			session.close();
		}
		return true;

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Curs> retrieve(int start, int maxRecords) throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		Query q = session.createQuery("from Curs as c");
		int pageIndex = start;
		int numberOfRecordsPerPage = maxRecords;
		int s;
		s = (pageIndex * numberOfRecordsPerPage) - numberOfRecordsPerPage;
		q.setFirstResult(s);
		q.setMaxResults(numberOfRecordsPerPage);
		List<Curs> list = null;
		try {
			list = (List<Curs>) q.list();
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

	@Override
	public Long countSize() throws MyDaoException {
		session = HibernateUtil.getSessionFactory().openSession();
		Transaction tx = session.beginTransaction();

		Long count = ((Long) session.createQuery("select count(*) from Curs")
				.iterate().next()).longValue();
		tx.commit();
		return count;
	}

}
