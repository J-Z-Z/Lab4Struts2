package md.victordov.lab.actionStruts;

import java.util.ArrayList;
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
import com.opensymphony.xwork2.Validateable;
import com.opensymphony.xwork2.ValidationAware;

public class StudentModelAction extends ActionSupport implements
		ModelDriven<StudentModel>, Validateable, ValidationAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StudentModel studentModel;
	public GenericService<StudentModel, Student> genService;
	private List<StudentModel> studentModelList;
	private static final int MAX_PER_PAGE = 5;
	private Long countTotal = 0L;
	private List<Long> pgArray = new ArrayList<Long>();
	private Integer pgNr = 0;

	public Integer getPgNr() {
		return pgNr;
	}

	public void setPgNr(Integer pgNr) {
		this.pgNr = pgNr;
	}

	public StudentModelAction() {
		this.genService = new StudentService();
	}

	public String execute() throws MyDaoException {

		this.studentModelList = genService.retrieve();

		return SUCCESS;
	}

	public String listAllStudentModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		Integer totalNrPages;
		countTotal = genService.countSize();
		totalNrPages = (int) Math.ceil((double) countTotal / MAX_PER_PAGE);
		try {
			if (request.getParameter("pgNr") != null) {
				pgNr = Integer.parseInt(request.getParameter("pgNr"));
				pgNr = pgNr > totalNrPages ? totalNrPages : pgNr;

			}
		} catch (NumberFormatException nfe) {
			System.out.println("Page Exception");
		}
		for (int i = 0; i < Math.ceil((double) countTotal / MAX_PER_PAGE); i++) {
			pgArray.add((long) i);
		}

		this.studentModelList = genService.retrieve(pgNr, MAX_PER_PAGE);

		return SUCCESS;
	}

	public String addStudentModel() throws MyDaoException {
		boolean rezultat = false;
		if(studentModel!=null){
			rezultat = genService.create(studentModel);	
		}
		return	rezultat?"success":"validate";

	}

	public String deleteStudentModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		boolean rezult = false;
		Integer id = null;
		if(request.getParameter("id")!=null){
			try{
				id = Integer.parseInt(request.getParameter("id"));
				rezult = genService.delete(id);
			}catch(NumberFormatException nfe){
				System.out.println("Student Id is null");
			}
			
		}else{
			System.out.println("Id of the Student to delete not received");
		}

		return rezult ? "success":"validate";
	}

	public String editStudentModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		studentModel = genService.retrieve(Integer.parseInt(request
				.getParameter("id")));
		return SUCCESS;
	}

	public String updateStudentModel() throws MyDaoException {
		boolean rezult = false;
		if(this.studentModel!=null){
			try{
				rezult = genService.update(this.studentModel);
			}
				catch(MyDaoException mde){
					throw mde;
				}
			}
		
		return rezult ? "success" : "validate";
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

	@Override
	public void validate() {

		super.validate();
	}

	public Long getCountTotal() {
		return countTotal;
	}

	public void setCountTotal(Long countTotal) {
		this.countTotal = countTotal;
	}

	public List<Long> getPgArray() {
		return pgArray;
	}

	public void setPgArray(List<Long> pgArray) {
		this.pgArray = pgArray;
	}

}
