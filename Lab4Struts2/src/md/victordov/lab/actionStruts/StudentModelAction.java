package md.victordov.lab.actionStruts;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.services.GenericService;
import md.victordov.lab.services.StudentService;
import md.victordov.lab.view.model.StudentModel;
import md.victordov.lab.vo.Student;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.ActionContext;

public class StudentModelAction extends ActionSupport implements
		ModelDriven<StudentModel> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StudentModel studentModel;
	public GenericService<StudentModel, Student> genService;
	private List<StudentModel> studentModelList;

	public StudentModelAction() {
		this.genService = new StudentService();
	}

	public String execute() {
		try {
			this.studentModelList = genService.retrieve();
		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String listAllStudentModel() {
		try {
			this.studentModelList = genService.retrieve();

		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addStudentModel() {
		System.out.println("ID: " + studentModel.getSId());
		System.out.println("Email: " + studentModel.getEmail());
		System.out.println("Grupa: " + studentModel.getGrupa());
		System.out.println("Nume: " + studentModel.getNume());
		System.out.println("Prenume: " + studentModel.getPrenume());
		System.out.println("Tel Fix: " + studentModel.getTelFix());
		try {
			genService.create(studentModel);

			this.studentModelList = genService.retrieve();
		} catch (MyDaoException e) {
			System.out.println("Eroare in add StudentModel");
		}

		return SUCCESS;

	}

	public String deleteStudentModel() {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			genService.delete(Integer.parseInt(request.getParameter("id")));
		} catch (NumberFormatException e) {
		} catch (MyDaoException e) {
		}

		return SUCCESS;
	}

	public String editStudentModel() {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			studentModel = genService.retrieve(Integer.parseInt(request
					.getParameter("id")));
		} catch (NumberFormatException e) {
		} catch (MyDaoException e) {
		}
		return SUCCESS;
	}

	public String updateStudentModel() {
		try {
			genService.update(this.studentModel);

			System.out.println(studentModel.getSId());
			System.out.println(studentModel.getEmail());
			System.out.println(studentModel.getGrupa());
			System.out.println(studentModel.getNume());
			System.out.println(studentModel.getPrenume());
			System.out.println(studentModel.getTelFix());

			this.studentModelList = genService.retrieve();
		} catch (MyDaoException e) {
			System.out.println("Eroare in Update StudentModel");
		}

		return SUCCESS;
	}

	public List<StudentModel> getStudentModelList() {
		return this.studentModelList;
	}

	public StudentModel getStudentModel() {
		return studentModel;
	}

	public void setStudentModel(StudentModel studentModel) {
		this.studentModel = studentModel;
	}

	@Override
	public StudentModel getModel() {
		return this.studentModel;
	}

}
