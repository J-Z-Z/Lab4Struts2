package md.victordov.lab.actionStruts;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;


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
	private static final Logger logger = Logger.getLogger(CursModelAction.class);
	
	private static final long serialVersionUID = 1L;
	private CursModel cursModel;
	public GenericService<CursModel, Curs> genService;
	private List<CursModel> cursModelList;
	private static final int MAX_PG = 5;
	private Long countTotal = 0L;
	private List<Long> pgArray = new ArrayList<Long>();

	public CursModelAction() {
		this.genService = new CursService();
	}

	public String execute() throws MyDaoException {
		
		
		this.cursModelList = genService.retrieve();
		return SUCCESS;
	}

	public String listAllCursModel() throws MyDaoException {
		logger.debug("debugging list all curs model");
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Integer pgNr = 0;
		countTotal = genService.countSize();
		try{
			if(request.getParameter("pgNr")!=null){
				pgNr =Integer.parseInt(request.getParameter("pgNr"));				
			}
		}catch(NumberFormatException nfe){
			System.out.println("Page Exception");
		}
		for(int i =0; i<Math.ceil((double)countTotal/MAX_PG); i++){
			pgArray.add((long)i);
		}
		
		this.cursModelList = genService.retrieve(pgNr,MAX_PG);

		return SUCCESS;
	}

	public String addCursModel() throws MyDaoException {

		genService.create(cursModel);
		this.cursModelList = genService.retrieve();
				
		return SUCCESS;

	}

	public String deleteCursModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		genService.delete(Integer.parseInt(request.getParameter("id")));

		return SUCCESS;
	}

	public String editCursModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		cursModel = genService.retrieve(Integer.parseInt(request
				.getParameter("id"))); 
		return SUCCESS;
	}

	public String updateCursModel() throws MyDaoException {

		genService.update(this.cursModel);
		this.cursModelList = genService.retrieve();

		return SUCCESS;
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

	@Override
	public CursModel getModel() {
		return this.cursModel;
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
