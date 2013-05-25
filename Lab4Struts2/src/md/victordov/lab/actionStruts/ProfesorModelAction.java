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
import md.victordov.lab.services.ProfesorService;
import md.victordov.lab.services.GenericService;
import md.victordov.lab.view.model.ProfesorModel;
import md.victordov.lab.vo.Profesor;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;

public class ProfesorModelAction extends ActionSupport implements SessionAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Logger logger = LogManager.getLogger(ProfesorModelAction.class);
	private ProfesorModel profesorModel;
	public GenericService<ProfesorModel, Profesor> genService;
	private List<ProfesorModel> profesorModelList;
	private Long countTotal = 0L;
	private List<Long> pgArray = new ArrayList<Long>();
	private Integer pgNr = 0;
	private int perPage = 5;
	private int[] perPageArray = new int[]{5,10,25};
	private SessionMap<String, Object> session;
	
	public String execute() throws MyDaoException {
		this.profesorModelList = genService.retrieve();
		return SUCCESS;
	}

	@SkipValidation
	public String listAllProfesorModel() throws MyDaoException {
		logger.info("Starting listAllProfesorModel method");
		//Set preferred records per page
		if (session.get("perPage") != null) {
			perPage = (Integer) session.get("perPage");
		}
		Integer totalNrPages;
		countTotal = genService.countSize();
		totalNrPages = (int) Math.ceil((double) countTotal / perPage) - 1;
		if(pgNr > totalNrPages) {
			pgNr = 	totalNrPages;
		}
		for (int i = 0; i < Math.ceil((double) countTotal / perPage); i++) {
			pgArray.add((long) i);
		}
		//Retreive profesors from database
		this.profesorModelList = genService.retrieve(pgNr*perPage,perPage);
		logger.info("listAllProfesorModel executed");
		return SUCCESS;
	}

	public String addProfesorModel() throws MyDaoException {
		boolean rezultat = false;
		if(profesorModel!=null){
			rezultat = genService.create(profesorModel);
		} else{
			logger.debug("addProfesor: profesor model is null");
		}
		if(rezultat){
			logger.info("profesor object was persisted to dabase");
			return "success";
		} else {
			return "validate";
		}
	}

	public String deleteProfesorModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		boolean rezult = false;
		Integer id = null;
		//Get the id from request
		if(request.getParameter("id")!=null){
			try{
				id = Integer.parseInt(request.getParameter("id"));
				rezult = genService.delete(id);
			}catch(NumberFormatException nfe){
				logger.debug("Profesor Id is null");
			}
			
		}else{
			logger.debug("Id of the Profesor to delete not received");
		}
		if(rezult){
			logger.info("profesor was deleted from database");
			return "success";
		} else {
			return "validate";
		}
	}

	public String editProfesorModel() throws MyDaoException {
		logger.info("editProfesorModel started");
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		boolean rezult = false;
		Integer id = null;
		//Get the id from request
		if(request.getParameter("id") != null){
			try {
				id = Integer.parseInt(request.getParameter("id"));
				profesorModel = genService.retrieve(id);
				rezult = (profesorModel != null) ? true :false; 
			} catch (NumberFormatException nfe) {
				logger.debug("Edit profesor: Id is null");
			}
		}
		if(rezult){
			logger.info("profesor successfuly retrieved for updating");
		}
		logger.info("editProfesorModel end");
		return rezult ? "success" : "validate";
	}

	public String updateProfesorModel() throws MyDaoException {
		logger.info("update profesor begin");
		boolean rezult = false; 
		if(this.profesorModel!=null){
			rezult = genService.update(this.profesorModel);
		}
		logger.info("update profesor end");
		if(rezult) {
			return "success";
		} else {
			return "validate";
		}
	}

	public List<ProfesorModel> getProfesorModelList() {
		return this.profesorModelList;
	}

	public ProfesorModel getProfesorModel() {
		return profesorModel;
	}

	public void setProfesorModel(ProfesorModel profesorModel) {
		this.profesorModel = profesorModel;
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

	public Integer getPgNr() {
		return pgNr;
	}

	public void setPgNr(Integer pgNr) {
		this.pgNr = pgNr;
	}
	
	public int[] getPerPageArray() {
		return perPageArray;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		session.put("perPage", perPage);
		this.perPage = perPage;
	}

	public ProfesorModelAction() {
		this.genService = new ProfesorService();
	}

	@Override
	public void setSession(Map<String, Object> sessionInjected) {
		session = (SessionMap<String, Object>) sessionInjected;
	}
}
