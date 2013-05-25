package md.victordov.lab.dao;

import java.util.List;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.AbstractDao;
import md.victordov.lab.vo.Profesor;

public class ProfesorDAO extends AbstractDao{

	public ProfesorDAO(){
		super();
	}

	 /**
     * Insert a new Student into the database.
     * @param student
     */
    public boolean create(Profesor profesor) throws MyDaoException {
        return super.create(profesor);
        
    }

    /**
     * Delete a detached Profesor from the database.
     * @param profesor
     */
    public boolean delete(Integer id) throws MyDaoException {
    	return super.delete(Profesor.class, id);
    }

    /**
     * Find an Profesor by its primary key.
     * @param id
     * @return
     */
    public Profesor retrieve(Integer id) throws MyDaoException {
        return (Profesor) super.retrieve(Profesor.class, id);
    }

    /**
     * Updates the state of a detached Profesor.
     *
     * @param profesor
     */
    public boolean update(Profesor profesor) throws MyDaoException {
        return super.create(profesor);
    }

    /**
     * Finds all Events in the database.
     * @return
     */
    @SuppressWarnings("unchecked")
	public List<Profesor> retrieve() throws MyDaoException{
        return (List<Profesor>) super.retrieve(Profesor.class);
    }
    
    @SuppressWarnings("unchecked")
    public List<Profesor> retrieve(int start, int maxRecords) throws MyDaoException{
        return (List<Profesor>)super.retrieve(Profesor.class, start, maxRecords);
    }
    
public Long countSize() throws MyDaoException {
		
		return super.countSize(Profesor.class);
	}
}
