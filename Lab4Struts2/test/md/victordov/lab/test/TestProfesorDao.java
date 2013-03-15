package md.victordov.lab.test;

import static org.junit.Assert.*;

import java.util.List;

import md.victordov.lab.common.HibernateUtil;
import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.ProfesorDAO;
import md.victordov.lab.vo.Profesor;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class TestProfesorDao {
	private ProfesorDAO profDao;
	private Integer PId;

    private int lastId;
    private static final Integer idToBeUpdated = 10;

	@Before
	public void setUp() throws Exception {
		setProfDao(new ProfesorDAO());
		setPId(idToBeUpdated);
	}

	@After
	public void tearDown() throws Exception {
		profDao = null;
		PId = null;
	}

	@Test
	public void testRetrieve() {
		List <Profesor> profesorList = null;
		try {
			profesorList = profDao.retrieve();
		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		assertNotNull(profesorList);
		assertFalse(profesorList.isEmpty());
	}

	@Test
	public void testRetrieveInt() {
		setLastId();
		int id = getLastId();
		Profesor test;
		try {
			test = profDao.retrieve(id);
			assertNotNull(test);
		} catch (MyDaoException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testCreate() {
		Profesor prof = new Profesor();
		prof.setNume("testCaseName");
		prof.setPrenume("testCasePrenume");
		prof.setAdresa("testCaseAdresa");
		
		try{
			profDao.create(prof);
			setLastId();
			int id = getLastId();
			assertEquals(id, (int) profDao.retrieve(id).getPId());
			
		}catch(MyDaoException mde){}
	}

	@Test
	public void testUpdate() {
		Profesor prof = new Profesor();
		try {
			
			prof = profDao.retrieve(this.getPId());
			prof.setPrenume("NewName");
			profDao.update(prof);
			assertEquals("Doesn't equal the updated name of profesor", prof.getNume(), profDao.retrieve(this.getPId()).getNume());
		} catch (MyDaoException e) {}
	}

	@Test
	public void testDelete() {
		setLastId();
		int id = getLastId();
		try {
			assertTrue("Not deleted", profDao.delete(id));
		} catch (MyDaoException e) {}
	}

	@Test
	public void testRetrieveIntInt() {
		int testedSize = 5;
		try {
			assertEquals("Doesn't equal the size of retrieved entity", testedSize, (int) profDao.retrieve(0, testedSize).size());
		} catch (MyDaoException e) {}
	}

	public ProfesorDAO getProfDao() {
		return profDao;
	}

	public void setProfDao(ProfesorDAO profDao) {
		this.profDao = profDao;
	}

	public Integer getPId() {
		return PId;
	}

	public void setPId(Integer pId) {
		PId = pId;
	}

	public int getLastId() {
		return lastId;
	}

	public void setLastId() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(Profesor.class).setProjection(
				Projections.max("PId"));
		Integer lastId = (Integer) criteria.uniqueResult();
		session.close();
			
		this.lastId = lastId;
	}

}
