package md.victordov.lab.actionStruts;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.services.CursService;
import md.victordov.lab.services.GenericService;
import md.victordov.lab.view.model.CursModel;
import md.victordov.lab.vo.Curs;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.ActionContext;

public class CursModelAction extends ActionSupport implements
		ModelDriven<CursModel> {
	/**
	 * 
	 */
	private static Logger logger = LogManager.getLogger(CursModelAction.class);
	
	private static final long serialVersionUID = 1L;
	private CursModel cursModel;
	public GenericService<CursModel, Curs> genService;
	private List<CursModel> cursModelList;
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

	public CursModelAction() {
		this.genService = new CursService();
	}

	public String execute() throws MyDaoException {

		this.cursModelList = genService.retrieve();
		return SUCCESS;
	}

	public String listAllCursModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		logger.info("AXVFD");
		logger.debug("AXVFDEBUG");
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

		this.cursModelList = genService.retrieve(pgNr, MAX_PER_PAGE);

		return SUCCESS;
	}

	public String addCursModel() throws MyDaoException {
		boolean rezultat = false;
		if(cursModel!=null){
			rezultat = genService.create(cursModel);	
		} else{
			logger.debug("cursModel was received null");
		}
		if(rezultat){
			logger.info("cursModel was added to database");
		}
		return	rezultat?"success":"validate";
	}

	public String deleteCursModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		boolean rezult = false;
		Integer id = null;
		if(request.getParameter("id")!=null){
			try{
				id = Integer.parseInt(request.getParameter("id"));
				rezult = genService.delete(id);
			}catch(NumberFormatException nfe){
				logger.info("Curs Id is null");
			}
			
		}else{
			logger.info("Id of the Curs to delete not received");
		}

		return rezult ? "success":"validate";
	}

	public String editCursModel() throws MyDaoException {

		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		
		boolean rezult = false;
		Integer id = null;
		if(request.getParameter("id") != null){
			try {
				id = Integer.parseInt(request.getParameter("id"));
				cursModel = genService.retrieve(id);
				rezult = (cursModel != null) ? true :false; 
			} catch (NumberFormatException nfe) {
				logger.debug("Edit curs: Id is null");
			}
		}
		if(rezult){
			logger.info("curs successfuly retrieved for updating");
		}
		
		return rezult ? "success" : "validate";
	}

	public String updateCursModel() throws MyDaoException {
		boolean rezult = false;
		if (this.cursModel != null) {
			rezult = genService.update(this.cursModel);
		}

		this.cursModelList = genService.retrieve();
		return rezult ? "success" : "validate";
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

	@Override
	public CursModel getModel() {

		return cursModel;
	}

}
