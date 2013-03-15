package md.victordov.lab.test;

import static org.junit.Assert.*;

import java.util.List;

import md.victordov.lab.common.HibernateUtil;
import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.UnivDAO;
import md.victordov.lab.vo.Universitate;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class TestUniversitateDao {
	
	private static final Integer idUnivToUpdate = 15;
	
	private UnivDAO univDao;
	private Integer UId;
    private int lastId;

	@Before
	public void setUp() throws Exception {
		setUnivDao(new UnivDAO());
		setUId(idUnivToUpdate);
	}

	@After
	public void tearDown() throws Exception {
		univDao = null;
		UId = null;
	}


	@Test
	public void testRetrieve() {
		List <Universitate> univList = null;
		try {
			univList = univDao.retrieve();
		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		assertNotNull(univList);
		assertFalse(univList.isEmpty());
	}

	@Test
	public void testRetrieveInt() {
		setLastId();
		int id = getLastId();
		Universitate test;
		try {
			test = univDao.retrieve(id);
			assertNotNull(test);
		} catch (MyDaoException e) {}
	}

	@Test
	public void testCreate() {
		Universitate universitate = new Universitate();
		universitate.setNumeUniver("test2");
		universitate.setAdresa("adresaTest");
		universitate.setTelefon("phoneTest");
		
		try{
			univDao.create(universitate);
			setLastId();
			int id = getLastId();
			assertEquals(id, (int) univDao.retrieve(id).getUId());
			
		}catch(MyDaoException mde){}
	}

	@Test
	public void testUpdate() {
		Universitate universitate = new Universitate();
		try {
			
			universitate = univDao.retrieve(this.getUId());
			universitate.setNumeUniver("NewName");
			univDao.update(universitate);
			assertEquals("Doesn't equal the updated name of universitate", universitate.getNumeUniver(), univDao.retrieve(this.getUId()).getNumeUniver());
		} catch (MyDaoException e) {}
	}

	@Test
	public void testDelete() {
		setLastId();
		int id = getLastId();
		try {
			assertTrue("Not deleted", univDao.delete(id));
		} catch (MyDaoException e) {}
	}

	@Test
	public void testRetrieveIntInt() {
		int testedSize = 3;
		try {
			assertEquals("Doesn't equal the size of retrieved entity", testedSize, (int) univDao.retrieve(0, testedSize).size());
		} catch (MyDaoException e) {}
	}

	public int getLastId() {
		return lastId;
	}

	public void setLastId() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(Universitate.class).setProjection(
				Projections.max("UId"));
		Integer lastId = (Integer) criteria.uniqueResult();
		session.close();
		this.lastId = lastId;
	}

	public UnivDAO getUnivDao() {
		return univDao;
	}

	public void setUnivDao(UnivDAO univDao) {
		this.univDao = univDao;
	}

	public Integer getUId() {
		return UId;
	}

	public void setUId(Integer uId) {
		UId = uId;
	}

}
