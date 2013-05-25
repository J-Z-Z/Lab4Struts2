package md.victordov.lab.dao;

import java.util.List;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.AbstractDao;
import md.victordov.lab.vo.Universitate;

public class UnivDAO extends AbstractDao{

	public UnivDAO(){
		super();
	}

	 /**
     * Insert a new Student into the database.
     * @param student
     */
    public boolean create(Universitate universitate) throws MyDaoException {
        return super.create(universitate);
        
    }

    /**
     * Delete a detached Universitate from the database.
     * @param universitate
     */
    public boolean delete(Integer id) throws MyDaoException {
    	return super.delete(Universitate.class, id);
    }

    /**
     * Find an Universitate by its primary key.
     * @param id
     * @return
     */
    public Universitate retrieve(Integer id) throws MyDaoException {
        return (Universitate) super.retrieve(Universitate.class, id);
    }

    /**
     * Updates the state of a detached Universitate.
     *
     * @param universitate
     */
    public boolean update(Universitate universitate) throws MyDaoException {
        return super.create(universitate);
    }

    /**
     * Finds all Events in the database.
     * @return
     */
    @SuppressWarnings("unchecked")
	public List<Universitate> retrieve() throws MyDaoException{
        return (List<Universitate>) super.retrieve(Universitate.class);
    }
    
    @SuppressWarnings("unchecked")
    public List<Universitate> retrieve(int start, int maxRecords) throws MyDaoException{
        return (List<Universitate>)super.retrieve(Universitate.class, start, maxRecords);
    }
    
public Long countSize() throws MyDaoException {
		
		return super.countSize(Universitate.class);
	}
}
