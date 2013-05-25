package md.victordov.lab.dao;

import java.util.List;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.AbstractDao;
import md.victordov.lab.vo.StudCurs;

public class StudCursDAO extends AbstractDao{

	public StudCursDAO(){
		super();
	}

	 /**
     * Insert a new Student into the database.
     * @param student
     */
    public boolean create(StudCurs studCurs) throws MyDaoException {
        return super.create(studCurs);
        
    }

    /**
     * Delete a detached StudCurs from the database.
     * @param studCurs
     */
    public boolean delete(Integer id) throws MyDaoException {
    	return super.delete(StudCurs.class, id);
    }

    /**
     * Find an StudCurs by its primary key.
     * @param id
     * @return
     */
    public StudCurs retrieve(Integer id) throws MyDaoException {
        return (StudCurs) super.retrieve(StudCurs.class, id);
    }

    /**
     * Updates the state of a detached StudCurs.
     *
     * @param studCurs
     */
    public boolean update(StudCurs studCurs) throws MyDaoException {
        return super.create(studCurs);
    }

    /**
     * Finds all Events in the database.
     * @return
     */
    @SuppressWarnings("unchecked")
	public List<StudCurs> retrieve() throws MyDaoException{
        return (List<StudCurs>) super.retrieve(StudCurs.class);
    }
    
    @SuppressWarnings("unchecked")
    public List<StudCurs> retrieve(int start, int maxRecords) throws MyDaoException{
        return (List<StudCurs>)super.retrieve(StudCurs.class, start, maxRecords);
    }
    
public Long countSize() throws MyDaoException {
		
		return super.countSize(StudCurs.class);
	}
}
