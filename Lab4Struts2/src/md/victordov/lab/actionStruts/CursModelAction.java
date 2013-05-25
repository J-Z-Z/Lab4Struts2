package md.victordov.lab.actionStruts;

import java.util.ArrayList;
import java.util.Map;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.services.CursService;
import md.victordov.lab.services.GenericService;
import md.victordov.lab.services.ProfesorService;
import md.victordov.lab.services.UniversitateService;
import md.victordov.lab.view.model.CursModel;
import md.victordov.lab.view.model.ProfesorModel;
import md.victordov.lab.view.model.UniversitateModel;
import md.victordov.lab.vo.Curs;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.Preparable;

public class CursModelAction extends ActionSupport implements Preparable, SessionAware {
	/**
	 * 
	 */
	private static Logger logger = LogManager.getLogger(CursModelAction.class);

	private static final long serialVersionUID = 1L;
	public GenericService<CursModel, Curs> genService;
	private CursModel cursModel;
	private List<CursModel> cursModelList;
	private List<ProfesorModel> profesorList;
	private List<UniversitateModel> universitateList;
	private SessionMap<String, Object> session;
	private Integer id;
	private Long countTotal = 0L;
	private Integer pgNr=0;
	private List<Long> pgArray = new ArrayList<Long>();
	private Integer perPage = 5;
	private int[] perPageArray = new int[]{5,10,25};
		
	public String execute() throws MyDaoException {

		this.cursModelList = genService.retrieve();
		return SUCCESS;
	}

	@SkipValidation
	public String listAllCursModel() throws MyDaoException {
		/** Get records per page from session*/
		if (session.get("perPage") != null) {
			perPage = (Integer) session.get("perPage");
		}
		Integer totalNrPages;		//Total number of pages
		countTotal = genService.countSize(); //Total number of records
		totalNrPages = (int) Math.ceil((double) countTotal / perPage) - 1;
		//Right number of pages in case user provided a higher number than the total nr of pages
		if(pgNr > totalNrPages) {
			pgNr = totalNrPages;
		}
		//fill the array with page numbers
		for (int i = 0; i < Math.ceil((double) countTotal / perPage); i++) {
			pgArray.add((long) i);
		}
		//Get the records to display
		this.cursModelList = genService.retrieve(pgNr * perPage, perPage);
		return SUCCESS;
	}

	public String addCursModel() throws MyDaoException {
		boolean rezultat = false;
		//Check if object is not null
		if (cursModel != null) {
			rezultat = genService.create(cursModel);
		} else {
			logger.debug("cursModel was received null");
		}
		//Check if records was created
		if (rezultat) {
			logger.info("cursModel was added to database");
			return "success";
		} else {
			return "validate";
		}
	}

	public String deleteCursModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		//Check to which page number to return
		if (request.getParameter("pgNr") != null) {
			try {
				pgNr = Integer.parseInt(request.getParameter("pgNr"));
			} catch (NumberFormatException nfe) {
				pgNr = 0;
			}
		}
		boolean rezult = false;
		Integer id = null;
		//id of the object to be deleted from request
		if (request.getParameter("id") != null) {
			try {
				id = Integer.parseInt(request.getParameter("id"));
				rezult = genService.delete(id);
			} catch (NumberFormatException nfe) {
				logger.info("Curs Id is null");
			}
		} else {
			logger.info("Id of the Curs to delete not received");
		}
		if(rezult) {
			return "success";
		} else {
			return "validate";
		} 
	}

	public String editCursModel() throws MyDaoException {

		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		boolean rezult = false;
		Integer id = null;
		//id of the object to be edited from request
		if (request.getParameter("id") != null) {
			try {
				id = Integer.parseInt(request.getParameter("id"));
				cursModel = genService.retrieve(id);
				rezult = (cursModel != null) ? true : false;
			} catch (NumberFormatException nfe) {
				logger.debug("Edit curs: Id is null");
			}
		}
		if (rezult) {
			logger.info("curs successfuly retrieved for updating");
		}
		if(rezult) {
			return "success";
		} else {
			return "validate";
		} 
	}

	public String updateCursModel() throws MyDaoException {
		boolean rezult = false;
		if (this.cursModel != null && this.cursModel.getCursId() != null) {
			rezult = genService.update(this.cursModel);
		}
		if(rezult) {
			return "success";
		} else {
			return "validate";
		}
	}

	@Override
	public void prepare() throws Exception {
		profesorList = new ArrayList<ProfesorModel>();
		profesorList = new ProfesorService().retrieve();

		universitateList = new ArrayList<UniversitateModel>();
		universitateList = new UniversitateService().retrieve();

	}
	
	public CursModelAction() {
		this.genService = new CursService();
	}

	public List<UniversitateModel> getUniversitateList() {
		return universitateList;
	}

	public void setUniversitateList(List<UniversitateModel> universitateList) {
		this.universitateList = universitateList;
	}

	public List<ProfesorModel> getProfesorList() throws MyDaoException {

		return profesorList;
	}

	public void setProfesorList(List<ProfesorModel> profesorList) {
		this.profesorList = profesorList;
	}

	public List<CursModel> getCursModelList() {
		return this.cursModelList;
	}

	public CursModel getCursModel() {
		return cursModel;
	}

	public void setCursModel(CursModel cursModel) {
		this.cursModel = cursModel;
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

	public Integer getId() {
		return id;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(Integer perPage) {
		session.put("perPage", perPage);
		this.perPage = perPage;
	}

	public Integer getPgNr() {
		return pgNr;
	}

	public void setPgNr(Integer pgNr) {
		this.pgNr = pgNr;
	}
	
	public int[] getPerPageArray(){
		return perPageArray;
	}

	@Override
	public void setSession(Map<String, Object> sessionInjected) {
		session = (SessionMap<String, Object>) sessionInjected;
	}
}
