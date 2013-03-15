package md.victordov.lab.actionStruts;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.services.ProfesorService;
import md.victordov.lab.services.GenericService;
import md.victordov.lab.view.model.ProfesorModel;
import md.victordov.lab.vo.Profesor;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.ActionContext;

public class ProfesorModelAction extends ActionSupport implements
		ModelDriven<ProfesorModel> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Logger logger = LogManager.getLogger(ProfesorModelAction.class);
	private ProfesorModel profesorModel;
	public GenericService<ProfesorModel, Profesor> genService;
	private List<ProfesorModel> profesorModelList;
	private static final int MAX_PER_PAGE = 5;
	private Long countTotal = 0L;
	private List<Long> pgArray = new ArrayList<Long>();
	private Integer pgNr = 0;

	public ProfesorModelAction() {
		this.genService = new ProfesorService();
	}

	public String execute() throws MyDaoException {

		this.profesorModelList = genService.retrieve();
		return SUCCESS;
	}

	public String listAllProfesorModel() throws MyDaoException {
		logger.info("Starting listAllProfesorModel method");
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
			logger.debug("Page Exception, value of pageNr is not a number");
		}
		for (int i = 0; i < Math.ceil((double) countTotal / MAX_PER_PAGE); i++) {
			pgArray.add((long) i);
		}
		
		this.profesorModelList = genService.retrieve(pgNr,MAX_PER_PAGE);
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
		}
		
		return	rezultat?"success":"validate";
	}

	public String deleteProfesorModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		boolean rezult = false;
		Integer id = null;
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
		}

		return rezult ? "success":"validate";
	}

	public String editProfesorModel() throws MyDaoException {
		logger.info("editProfesorModel started");
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		boolean rezult = false;
		Integer id = null;
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
		return rezult ? "success" : "validate";
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

	@Override
	public ProfesorModel getModel() {
		return this.profesorModel;
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
}
