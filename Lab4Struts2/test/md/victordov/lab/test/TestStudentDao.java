package md.victordov.lab.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;

import md.victordov.lab.common.HibernateUtil;
import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.StudentDAO;
import md.victordov.lab.vo.Student;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class TestStudentDao {
	
	 private StudentDAO dao;

     private Integer sId;

     private int lastId;

	public int getLastId() {
		return lastId;
	}

	public void setLastId() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = session.createCriteria(Student.class).setProjection(
				Projections.max("SId"));
		Integer lastId = (Integer) criteria.uniqueResult();
		session.close();
			
		this.lastId = lastId;
	}

	@Before
	public void setUp() throws Exception {
		setDao(new StudentDAO());
		setsId(40);
	}

	@After
	public void tearDown() throws Exception {
		dao = null;
		sId = null;
		
	}

	@Test
	public void testRetrieve() {
		List <Student> studentList = null;
		try {
			studentList = dao.retrieve();
		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		assertNotNull(studentList);
		assertFalse(studentList.isEmpty());
	}

	@Test
	public void testRetrieveInt() {
		setLastId();
		int id = getLastId();
		Student test;
		try {
			test = dao.retrieve(id);
			assertNotNull(test);
		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		
	}

	@Test
	public void testCreate() {
		Student st = new Student();
		st.setNume("Test2");
		st.setPrenume("TestPrenume");
		st.setGrupa("ti-998");
		st.setEmail("email@email.com");
		st.setTelFix("00-88-99");
		try{
			dao.create(st);
			setLastId();
			int id = getLastId();
			assertEquals(id, (int) dao.retrieve(id).getSId());
			
		}catch(MyDaoException mde){}
	}

	@Test
	public void testUpdate() {
		Student st = new Student();
		try {
			
			st = dao.retrieve(this.getsId());
			st.setPrenume("NewName");
			dao.update(st);
			assertEquals("Doesn't equal the updated name of student", st.getNume(), dao.retrieve(this.getsId()).getNume());
		} catch (MyDaoException e) {}
		
	}

	@Test
	public void testDelete() {
		setLastId();
		int id = getLastId();
		try {
			assertTrue("Not deleted", dao.delete(id));
		} catch (MyDaoException e) {}
	}

	@Test
	public void testRetrieveIntInt() {
		int testedSize = 5;
		try {
			assertEquals("Doesn't equal the size of retrieved entity", testedSize, (int) dao.retrieve(0, testedSize).size());
		} catch (MyDaoException e) {}
	}
	
	public StudentDAO getDao() {
		return dao;
	}

	public void setDao(StudentDAO dao) {
		this.dao = dao;
	}

	public Integer getsId() {
		return sId;
	}

	public void setsId(Integer sId) {
		this.sId = sId;
	}

}
