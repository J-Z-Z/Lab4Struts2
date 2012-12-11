package md.victordov.lab.actionStruts;

import java.util.List;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.GenericDAO;
import md.victordov.lab.dao.StudentDAO;
import md.victordov.lab.vo.Student;
import com.opensymphony.xwork2.ActionSupport;

public class StudentAction extends ActionSupport {
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

	public List<Student> getStudentList() {
		return this.studenList;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Integer getSId() {
		return this.student.getSId();
	}


	public String getNume() {
		return this.student.getNume();
	}

	public String getPrenume() {
		return this.student.getPrenume();
	}

	public String getGrupa() {
		return this.student.getGrupa();
	}


	public String getEmail() {
		return this.student.getEmail();
	}


	public String getTelFix() {
		return this.student.getTelFix();
	}

}
