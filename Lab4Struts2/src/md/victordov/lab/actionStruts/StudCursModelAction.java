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
import md.victordov.lab.services.CursService;
import md.victordov.lab.services.GenericService;
import md.victordov.lab.services.StudCursService;
import md.victordov.lab.services.StudentService;
import md.victordov.lab.view.model.CursModel;
import md.victordov.lab.view.model.StudCursModel;
import md.victordov.lab.view.model.StudentModel;
import md.victordov.lab.vo.StudCurs;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.Preparable;

public class StudCursModelAction extends ActionSupport implements Preparable, SessionAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Logger logger = LogManager
			.getLogger(StudCursModelAction.class);
	private StudCursModel studCursModel;
	public GenericService<StudCursModel, StudCurs> genService;
	private List<StudCursModel> studCursModelList;
	private Long countTotal = 0L;
	private List<Long> pgArray = new ArrayList<Long>();
	private Integer pgNr = 0;
	private List<StudentModel> studentList;
	private List<CursModel> cursList;
	private Integer perPage = 5;
	private int[] perPageArray = new int[] { 5, 10, 25 };
	private SessionMap<String, Object> session;

	public StudCursModelAction() {
		this.genService = new StudCursService();
	}

	public String execute() throws MyDaoException {

		this.studCursModelList = genService.retrieve();
		logger.info("execute methos was sucessfull");
		return SUCCESS;
	}

	@SkipValidation
	public String listAllStudCursModel() throws MyDaoException {
		logger.info("listAllStudCursModel started");
		//Get records per page from session
		if (session.get("perPage") != null) {
			perPage = (Integer) session.get("perPage");
		}
		Integer totalNrPages;
		countTotal = genService.countSize();
		totalNrPages = (int) Math.ceil((double) countTotal / perPage)-1;
		if(pgNr > totalNrPages) {
			pgNr = totalNrPages;
		}
		//fill the array with page numbers
		for (int i = 0; i < Math.ceil((double) countTotal / perPage); i++) {
			pgArray.add((long) i);
		}
		//Retrieve data from database
		this.studCursModelList = genService.retrieve(pgNr * perPage, perPage);
		logger.info("listAllStudCursModel was executed");
		return SUCCESS;
	}

	public String addStudCursModel() throws MyDaoException {
		boolean rezultat = false;
		if (studCursModel != null) {
			rezultat = genService.create(studCursModel);
		} else {
			logger.debug("student was received null, cannot persist");
		}

		return rezultat ? "success" : "validate";

	}

	public String deleteStudCursModel() throws MyDaoException {
		logger.info("deleteStudent started");

		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		boolean rezult = false;
		Integer id = null;
		if (request.getParameter("id") != null) {
			try {
				id = Integer.parseInt(request.getParameter("id"));
				rezult = genService.delete(id);
			} catch (NumberFormatException nfe) {
				logger.debug("Student-Curs Id is null");
			}

		} else {
			logger.debug("Id of the Student-Curs to delete not received");
		}
		logger.info("deleteStudent was executed");

		return rezult ? "success" : "validate";
	}

	public String editStudCursModel() throws MyDaoException {

		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		boolean rezult = false;
		Integer id = null;
		//Get id of object from request
		if (request.getParameter("id") != null) {
			try {
				id = Integer.parseInt(request.getParameter("id"));
				studCursModel = genService.retrieve(id);
				rezult = (studCursModel != null) ? true : false;
			} catch (NumberFormatException nfe) {
				logger.debug("Edit student-curs: Id is null");
			}
		}
		if (rezult) {
			logger.info("student-curs successfuly retrieved for updating");
			return "success";
		} else{
			return "validate";
		}
	}

	public String updateStudCursModel() throws MyDaoException {
		boolean rezult = false;
		if (this.studCursModel != null) {
			rezult = genService.update(this.studCursModel);
		}
		if(rezult) {
			return "success";
		} else {
			return "validate";
		}
	}

	public List<StudCursModel> getStudCursModelList() {
		return this.studCursModelList;
	}

	public StudCursModel getStudCursModel() {
		return studCursModel;
	}

	public void setStudCursModel(StudCursModel studCursModel) {
		this.studCursModel = studCursModel;
	}

	public Long getCountTotal() {
		return countTotal;
	}

	public List<Long> getPgArray() {
		return pgArray;
	}

	public void setPgArray(List<Long> pgArray) {
		this.pgArray = pgArray;
	}

	@Override
	public void prepare() throws Exception {
		setStudentList(new ArrayList<StudentModel>());
		setStudentList(new StudentService().retrieve());

		setCursList(new ArrayList<CursModel>());
		setCursList(new CursService().retrieve());
	}

	public List<StudentModel> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<StudentModel> studentList) {
		this.studentList = studentList;
	}

	public List<CursModel> getCursList() {
		return cursList;
	}

	public void setCursList(List<CursModel> cursList) {

		this.cursList = cursList;
	}
	public void setPgNr(Integer pgNr){
		this.pgNr = pgNr;
	}
	public int[] getPerPageArray() {
		return perPageArray;
	}

	public Integer getPerPage() {
		return perPage;
	}

	public void setPerPage(Integer perPage) {
		session.put("perPage", perPage);
		this.perPage = perPage;
	}

	public Integer getPgNr() {
		return pgNr;
	}

	@Override
	public void setSession(Map<String, Object> sessionInjected) {
		session = (SessionMap<String, Object>) sessionInjected;
		
	}

}
