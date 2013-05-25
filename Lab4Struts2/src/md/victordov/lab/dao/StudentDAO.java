package md.victordov.lab.dao;

import java.util.List;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.AbstractDao;
import md.victordov.lab.vo.Student;

public class StudentDAO extends AbstractDao{

	public StudentDAO(){
		super();
	}

	 /**
     * Insert a new Student into the database.
     * @param student
     */
    public boolean create(Student student) throws MyDaoException {
        return super.create(student);
        
    }

    /**
     * Delete a detached Student from the database.
     * @param student
     */
    public boolean delete(Integer id) throws MyDaoException {
    	return super.delete(Student.class, id);
    }

    /**
     * Find an Student by its primary key.
     * @param id
     * @return
     */
    public Student retrieve(Integer id) throws MyDaoException {
        return (Student) super.retrieve(Student.class, id);
    }

    /**
     * Updates the state of a detached Student.
     *
     * @param student
     */
    public boolean update(Student student) throws MyDaoException {
        return super.create(student);
    }

    /**
     * Finds all Events in the database.
     * @return
     */
    @SuppressWarnings("unchecked")
	public List<Student> retrieve() throws MyDaoException{
        return (List<Student>) super.retrieve(Student.class);
    }
    
    @SuppressWarnings("unchecked")
    public List<Student> retrieve(int start, int maxRecords) throws MyDaoException{
        return (List<Student>)super.retrieve(Student.class, start, maxRecords);
    }
    
public Long countSize() throws MyDaoException {
		
		return super.countSize(Student.class);
	}
}
