package md.victordov.lab.actionStruts;

import java.util.ArrayList;
import java.util.Map;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.services.GenericService;
import md.victordov.lab.services.StudentService;
import md.victordov.lab.view.model.StudentModel;
import md.victordov.lab.vo.Student;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;

public class StudentModelAction extends ActionSupport implements SessionAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Logger logger = LogManager
			.getLogger(StudentModelAction.class);
	private StudentModel studentModel;
	public GenericService<StudentModel, Student> genService;
	private List<StudentModel> studentModelList;
	private Integer perPage = 5;
	private Long countTotal = 0L;
	private List<Long> pgArray = new ArrayList<Long>();
	private Integer pgNr = 0;
	private Integer[] perPageArray = new Integer[] {5,10,25};
	private SessionMap<String, Object> session;
	
	public StudentModelAction() {
		this.genService = new StudentService();
	}

	public String execute() throws MyDaoException {

		this.studentModelList = genService.retrieve();
		logger.info("Execute was successful");
		return SUCCESS;
	}

	@SkipValidation
	public String listAllStudentModel() throws MyDaoException {
		//Get per page preference from request
		if (session.get("perPage") != null) {
			perPage = (Integer) session.get("perPage");
		}
		logger.info("Started listAllStudentModel method");
		Integer totalNrPages;
		countTotal = genService.countSize();
		totalNrPages = (int) Math.ceil((double) countTotal / perPage) - 1;
		if(pgNr > totalNrPages) {
			pgNr = totalNrPages;
		}
		for (int i = 0; i < Math.ceil((double) countTotal / perPage); i++) {
			pgArray.add((long) i);
		}
		//Get records from database
		this.studentModelList = genService.retrieve(pgNr * perPage, perPage);
		logger.info("listAllStudentModel - executed with success");
		return SUCCESS;
	}

	public String addStudentModel() throws MyDaoException {
		boolean rezultat = false;
		if (studentModel != null) {
			rezultat = genService.create(studentModel);
		} else {
			logger.debug("Cannot add object to database null received");
		}
		if(rezultat) {
			return "success";
		} else {
			return "validate";
		}
	}

	public String deleteStudentModel() throws MyDaoException {
		logger.info("Started deleteStudentModel method");
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		boolean rezult = false;
		Integer id = null;
		//Get id from request
		if (request.getParameter("id") != null) {
			try {
				id = Integer.parseInt(request.getParameter("id"));
				rezult = genService.delete(id);
			} catch (NumberFormatException nfe) {
				logger.debug("Student Id is null");
			}

		} else {
			logger.debug("Id of the Student to delete not received");
		}
		if(rezult){
			return "success";
		} else {
			return "validate";
		}
	}

	public String editStudentModel() throws MyDaoException {
		
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		boolean rezult = false;
		Integer id = null;
		//Get the id of object from request
		if(request.getParameter("id") != null){
			try {
				id = Integer.parseInt(request.getParameter("id"));
				studentModel = genService.retrieve(id);
				rezult = (studentModel != null) ? true :false; 
			} catch (NumberFormatException nfe) {
				logger.debug("Edit student: Id is null");
			}
		}
		if(rezult){
			logger.info("student successfuly retrieved for updating");
			return "success";
		} else {
			return "validate";
		}
	}

	public String updateStudentModel() throws MyDaoException {
		boolean rezult = false;
		if (this.studentModel != null) {
			try {
				rezult = genService.update(this.studentModel);
			} catch (MyDaoException mde) {
				logger.debug(mde.getMessage(), mde);
				throw mde;
			}
		}
		if(rezult){
			logger.info("Student was updated");
			return "success";
		} else {
			return "validate";
		}
	}


	public Integer getPerPage() {
		return perPage;
	}

	public void setPerPage(Integer perPage) {
		session.put("perPage", perPage);
		this.perPage = perPage;
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
	public Integer[] getPerPageArray() {
		return perPageArray;
	}

	public Integer getPgNr() {
		return pgNr;
	}

	public void setPgNr(Integer pgNr) {
		this.pgNr = (Integer)pgNr;
	}

	@Override
	public void setSession(Map<String, Object> sessionInjected) {
		session = (SessionMap<String, Object>) sessionInjected;
		
	}

}
