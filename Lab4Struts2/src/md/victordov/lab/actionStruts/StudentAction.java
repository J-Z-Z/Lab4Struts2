package md.victordov.lab.actionStruts;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.GenericDAO;
import md.victordov.lab.dao.StudentDAO;
import md.victordov.lab.vo.Student;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.ActionContext;

public class StudentAction extends ActionSupport implements
		ModelDriven<Student> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Student student;
	public GenericDAO<Student> genDao;
	private List<Student> studenList;

	public StudentAction() {
		this.genDao = new StudentDAO();
	}

	public String execute() {
		try {
			this.studenList = genDao.retrieve();
			// this.student = genDao.retrieve(2);

		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String listAllStudent() {
		try {
			this.studenList = genDao.retrieve();

		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addStudent() {
		try {
			genDao.create(student);
			this.studenList = genDao.retrieve();
		} catch (MyDaoException e) {
			System.out.println("Eroare in add Student");
		}

		return SUCCESS;

	}

	public String deleteStudent() {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			genDao.delete(Integer.parseInt(request.getParameter("id")));
		} catch (NumberFormatException e) {
		} catch (MyDaoException e) {
		}

		return SUCCESS;
	}

	public String editStudent() {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			student = genDao.retrieve(Integer.parseInt(request
					.getParameter("id")));
		} catch (NumberFormatException e) {
		} catch (MyDaoException e) {
		}
		return SUCCESS;
	}

	public String updateStudent() {
		try {
			genDao.update(this.student);
			this.studenList = genDao.retrieve();
		} catch (MyDaoException e) {
			System.out.println("Eroare in Update Student");
		}

		return SUCCESS;
	}

	public List<Student> getStudentList() {
		return this.studenList;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	@Override
	public Student getModel() {
		// TODO Auto-generated method stub
		return this.student;
	}

}
