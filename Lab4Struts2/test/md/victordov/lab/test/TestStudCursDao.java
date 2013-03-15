package md.victordov.lab.test;

import static org.junit.Assert.*;

import java.util.List;

import md.victordov.lab.common.HibernateUtil;
import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.StudCursDAO;
import md.victordov.lab.vo.Curs;
import md.victordov.lab.vo.StudCurs;
import md.victordov.lab.vo.Student;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class TestStudCursDao {
	
	
	private StudCursDAO scDao;
	private Integer scId;
	private int lastId;


	@Before
	public void setUp() throws Exception {
		setScDao(new StudCursDAO());
		setScId(72);
	}

	@After
	public void tearDown() throws Exception {
		scDao = null;
		scId = null;
	}

	@Test
	public void testRetrieve() {
		List <StudCurs> scList = null;
		try {
			scList = scDao.retrieve();
		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		assertNotNull(scList);
		assertFalse(scList.isEmpty());
	}

	@Test
	public void testRetrieveIntInt() {
		int testedSize = 5;
		try {
			assertEquals("Doesn't equal the size of retrieved entity", testedSize, (int) scDao.retrieve(0, testedSize).size());
		} catch (MyDaoException e) {}
	}

	@Test
	public void testRetrieveInt() {
		setLastId();
		int id = getLastId();
		StudCurs test;
		try {
			test = scDao.retrieve(id);
			assertNotNull(test);
		} catch (MyDaoException e) {}
	}

	@Test
	public void testCreate() {
		StudCurs studCurs = new StudCurs();
		Curs curs = new Curs();
		Student student = new Student();
		curs.setCId(2);
		student.setSId(2);
		curs.setNumeCurs("testNumeStudentCurs");
		studCurs.setCurs(curs);
		studCurs.setStudent(student);
		
		try{
			scDao.create(studCurs);
			setLastId();
			int id = getLastId();
			assertEquals(id, (int) scDao.retrieve(id).getScId());
			
		}catch(MyDaoException mde){}
	}

	@Test
	public void testUpdate() {
		StudCurs studCurs = new StudCurs();
		try {
			
			studCurs = scDao.retrieve(this.getScId());
			Curs curs = new Curs();
			curs.setCId(3);
			studCurs.setCurs(curs);
			scDao.update(studCurs);
			assertEquals("Doesn't equal the updated cursId of Student-Curs", studCurs.getCurs().getCId(), scDao.retrieve(this.getScId()).getCurs().getCId());
		} catch (MyDaoException e) {}
	}

	@Test
	public void testDelete() {
		setLastId();
		int id = getLastId();
		try {
			assertTrue("Not deleted", scDao.delete(id));
		} catch (MyDaoException e) {}
	}

	public StudCursDAO getScDao() {
		return scDao;
	}

	public void setScDao(StudCursDAO scDao) {
		this.scDao = scDao;
	}

	public int getLastId() {
		return lastId;
	}

	public void setLastId() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(StudCurs.class).setProjection(
				Projections.max("scId"));
		Integer lastId = (Integer) criteria.uniqueResult();
		session.close();
		this.lastId = lastId;
	}

	public Integer getScId() {
		return scId;
	}

	public void setScId(Integer scId) {
		this.scId = scId;
	}

}
