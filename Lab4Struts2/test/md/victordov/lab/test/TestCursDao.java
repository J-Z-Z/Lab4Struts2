package md.victordov.lab.test;

import static org.junit.Assert.*;

import java.util.List;

import md.victordov.lab.common.HibernateUtil;
import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.CursDAO;
import md.victordov.lab.dao.ProfesorDAO;
import md.victordov.lab.dao.UnivDAO;
import md.victordov.lab.vo.Curs;
import md.victordov.lab.vo.Profesor;
import md.victordov.lab.vo.Universitate;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;


/**
 * 
 * @author victor
 * Test Dao's with a lot of Ruby Golberg :)
 *
 */

public class TestCursDao {
	public static final int idToRetrieve = 32;
	
	private CursDAO cursDao;
	private int lastId;
	private Integer cursId;
	private static final int idToUpdate = 66;
	
	@Before
	public void setUp() throws Exception {
		setCursDao(new CursDAO());
		setCursId(idToUpdate);
	}

	@After
	public void tearDown() throws Exception {
		cursDao = null;
		cursId = null;
	}

	@Test
	public void testRetrieve() {
		List<Curs> cursList = null;
		try {
			cursList = cursDao.retrieve();
		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		assertNotNull(cursList);
		assertFalse(cursList.isEmpty());
	}

	@Test
	public void testRetrieveInt() {
		Curs curs = null;
		try {
			curs = cursDao.retrieve(1);
		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		assertNotNull(curs);
	}

	@Test
	public void testCreate() {
		
		Curs curs = new Curs();
		Profesor prof = new Profesor();
		Universitate universitate = new Universitate();
		
		try {
			prof = new ProfesorDAO().retrieve(1);
			universitate = new UnivDAO().retrieve(1);
			curs.setNumeCurs("Test");
			curs.setProfesor(prof);
			curs.setUniversitate(universitate);
			cursDao.create(curs);
			
			setLastId();
			
			Curs tempcurs = new Curs();
			tempcurs = cursDao.retrieve(getLastId());
			assertEquals("Names's of the the objects are not the same",
					curs.getNumeCurs(), tempcurs.getNumeCurs());

		} catch (MyDaoException e) {
			e.printStackTrace();
		}

	}

	@Test
	public void testUpdate() {
		Curs testCurs = new Curs();
		Profesor profesor = new Profesor();
		profesor.setPId(2);
		try {
			testCurs = cursDao.retrieve(getCursId());
			testCurs.setProfesor(profesor);
			cursDao.update(testCurs);
			assertEquals("Objects are not equal", testCurs.getCId(), cursDao
					.retrieve(getCursId()).getCId());
		} catch (MyDaoException e) {}

	}

	@Test
	public void testDelete() throws MyDaoException {
		setLastId();
		assertTrue("Object could not be deleted", new CursDAO().delete(getLastId()));
	}

	@Test
	public void testRetrieveIntInt() throws MyDaoException {
		final int sizeN = 5;
		assertEquals(sizeN, new CursDAO().retrieve(0, sizeN).size());
	}

	public CursDAO getCursDao() {
		return cursDao;
	}

	public void setCursDao(CursDAO cursDao) {
		this.cursDao = cursDao;
	}

	public int getLastId() {
		return lastId;
	}

	public void setLastId() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(Curs.class).setProjection(
				Projections.max("CId"));
		this.lastId = (Integer) criteria.uniqueResult();
		session.close();
	}

	public int getCursId() {
		return cursId;
	}

	public void setCursId(int cId) {
		cursId = cId;
	}

}
