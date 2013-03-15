package md.victordov.lab.test;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;

import md.victordov.lab.common.HibernateUtil;
import md.victordov.lab.vo.Curs;

public class HibTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		Session session = HibernateUtil.getSessionFactory().openSession();
		
		Criteria criteria = session
			    .createCriteria(Curs.class)
			    .setProjection(Projections.max("CId"));
			Integer idToRetrieve = (Integer)criteria.uniqueResult();
			System.out.println(idToRetrieve);
			
			Curs c = new Curs();
			System.out.println(c==null?"null":"not null");		
			
		
	}

}
