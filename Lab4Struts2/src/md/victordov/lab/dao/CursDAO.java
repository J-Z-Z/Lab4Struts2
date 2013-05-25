package md.victordov.lab.dao;

import java.util.List;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.AbstractDao;
import md.victordov.lab.vo.Curs;

public class CursDAO extends AbstractDao{

	public CursDAO(){
		super();
	}

	 /**
     * Insert a new Student into the database.
     * @param student
     */
    public boolean create(Curs curs) throws MyDaoException {
        return super.create(curs);
        
    }

    /**
     * Delete a detached Curs from the database.
     * @param curs
     */
    public boolean delete(Integer id) throws MyDaoException {
    	return super.delete(Curs.class, id);
    }

    /**
     * Find an Curs by its primary key.
     * @param id
     * @return
     */
    public Curs retrieve(Integer id) throws MyDaoException {
        return (Curs) super.retrieve(Curs.class, id);
    }

    /**
     * Updates the state of a detached Curs.
     *
     * @param curs
     */
    public boolean update(Curs curs) throws MyDaoException {
        return super.create(curs);
    }

    /**
     * Finds all Events in the database.
     * @return
     */
    @SuppressWarnings("unchecked")
	public List<Curs> retrieve() throws MyDaoException{
        return (List<Curs>) super.retrieve(Curs.class);
    }
    
    @SuppressWarnings("unchecked")
    public List<Curs> retrieve(int start, int maxRecords) throws MyDaoException{
        return (List<Curs>)super.retrieve(Curs.class, start, maxRecords);
    }
    
public Long countSize() throws MyDaoException {
		
		return super.countSize(Curs.class);
	}
}
