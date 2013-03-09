package md.victordov.lab.actionStruts;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.services.GenericService;
import md.victordov.lab.services.UniversitateService;
import md.victordov.lab.view.model.UniversitateModel;
import md.victordov.lab.vo.Universitate;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.ActionContext;

public class UniversitateModelAction extends ActionSupport implements
		ModelDriven<UniversitateModel> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UniversitateModel universitateModel;
	public GenericService<UniversitateModel, Universitate> genService;
	private List<UniversitateModel> universitateModelList;
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

	public UniversitateModelAction() {
		this.genService = new UniversitateService();
	}

	public String execute() throws MyDaoException {

		this.universitateModelList = genService.retrieve();

		return SUCCESS;
	}

	public String listAllUniversitateModel() throws MyDaoException {
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

		this.universitateModelList = genService.retrieve(pgNr, MAX_PER_PAGE);

		return SUCCESS;
	}

	public String addUniversitateModel() throws MyDaoException {
		boolean rezultat = false;
		if(universitateModel!=null){
			rezultat = genService.create(universitateModel);
		}
		return	rezultat?"success":"validate";

	}

	public String deleteUniversitateModel() throws MyDaoException {
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
				System.out.println("Universitate Id is null");
			}
		}else{
			System.out.println("Id of the University to delete not received");
		}

		
		return	rezult?"success":"validate";
	}

	public String editUniversitateModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		boolean rezult = false;
		Integer id = null;
		if(request.getParameter("id") != null){
			try {
				id = Integer.parseInt(request.getParameter("id"));
				universitateModel = genService.retrieve(id);
				rezult = (universitateModel != null) ? true :false; 
			} catch (NumberFormatException nfe) {
				System.out.println("Edit Universitate: Id is null");
			}
		}
		
		return rezult ? "success" : "validate";

	}

	public String updateUniversitateModel() throws MyDaoException {
		boolean rezult = false;
		if(this.universitateModel != null){
			rezult = genService.update(this.universitateModel);	
		}
		
		this.universitateModelList = genService.retrieve();

		return rezult ? "success" : "validate";
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

	@Override
	public UniversitateModel getModel() {
		return this.universitateModel;
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
