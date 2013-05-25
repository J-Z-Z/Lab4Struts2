package md.victordov.lab.actionStruts;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.services.GenericService;
import md.victordov.lab.services.UniversitateService;
import md.victordov.lab.view.model.UniversitateModel;
import md.victordov.lab.vo.Universitate;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;

public class UniversitateModelAction extends ActionSupport implements SessionAware{
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	private static Logger logger = LogManager.getLogger(CursModelAction.class);
	private UniversitateModel universitateModel;
	public GenericService<UniversitateModel, Universitate> genService;
	private List<UniversitateModel> universitateModelList;
	private Long countTotal = 0L;
	private List<Long> pgArray = new ArrayList<Long>();
	private Integer pgNr = 0;
	private int perPage = 5;
	private final int[] perPageArray = new int[]{5,10,25};
	private SessionMap<String, Object> session;
	
	public UniversitateModelAction() {
		this.genService = new UniversitateService();
	}

	public String execute() throws MyDaoException {

		this.universitateModelList = genService.retrieve();
		logger.info("Universitate List successfuly execute - > method execute");
		return SUCCESS;
	}

	@SkipValidation
	public String listAllUniversitateModel() throws MyDaoException {
		logger.info("Starting listAllUniversityModel method");
		//Check & get records per page preference
		if(session.get("perPage")!= null){
			perPage = (Integer) session.get("perPage");
		}
		Integer totalNrPages;
		countTotal = genService.countSize();
		totalNrPages = (int) Math.ceil((double) countTotal / perPage) - 1;
		if(pgNr > totalNrPages) {
			pgNr = totalNrPages;
		}
		for (int i = 0; i < Math.ceil((double) countTotal / perPage); i++) {
			pgArray.add((long) i);
		}
		//Retreive data from database
		this.universitateModelList = genService.retrieve(pgNr * perPage, perPage);
		
		logger.info("listAllUniversitateModel executed");
		return SUCCESS;
	}

	public String addUniversitateModel() throws MyDaoException {
		boolean rezultat = false;
		if(universitateModel!=null){
			rezultat = genService.create(universitateModel);
			logger.info("University Object was successfully persisted to database");
		} else {
			logger.debug("University Model was received null, cannot create");
		}
		
		return	rezultat?"success":"validate";

	}
	
	public String deleteUniversitateModel() throws MyDaoException {
		logger.info("Starting deleteUniversitateModel method");
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		boolean rezult = false;
		Integer id = null;
		if(request.getParameter("id")!=null){
			try{
				id = Integer.parseInt(request.getParameter("id"));
				rezult = genService.delete(id);
				
			}
			catch(NumberFormatException nfe){
				logger.debug(nfe.getMessage(),nfe);
			}
		}else{
			logger.info("Id of the University to delete not received");
		}
		if(rezult){
			logger.info("University model successfully deleted");
			return "success";
		} else {
			return "validate";
		}
	}

	public String editUniversitateModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		boolean rezult = false;
		Integer id = null;
		//id of object from request
		if(request.getParameter("id") != null){
			try {
				id = Integer.parseInt(request.getParameter("id"));
				universitateModel = genService.retrieve(id);
				rezult = (universitateModel != null) ? true :false; 
			} catch (NumberFormatException nfe) {
				logger.debug("Edit Universitate: Id is null");
			}
		}
		if(rezult){
			logger.info("University successfuly retrieved for updating");
			return "success";
		} else {
			return "validate";
		}
	}

	public String updateUniversitateModel() throws MyDaoException {
		boolean rezult = false;
		if(this.universitateModel != null){
			rezult = genService.update(this.universitateModel);	
		}
		else{
			logger.debug("University cannot be updated because it is null");
		}
		if(rezult){
			return "success";
		} else { 
			return "validate";
		}
	}

	public List<UniversitateModel> getUniversitateModelList() {
		return this.universitateModelList;
	}

	public UniversitateModel getUniversitateModel() {
		return universitateModel;
	}

	public void setUniversitateModel(UniversitateModel universitateModel) {
		this.universitateModel = universitateModel;
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

	public int[] getPerPageArray(){
		return perPageArray;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		session.put("perPage", perPage);
		this.perPage = perPage;
	}

	public Integer getPgNr() {
		return pgNr;
	}

	public void setPgNr(Integer pgNr) {
		this.pgNr = pgNr;
	}

	@Override
	public void setSession(Map<String, Object> injectedSession) {
		session = (SessionMap<String, Object>) injectedSession;
	}

}
