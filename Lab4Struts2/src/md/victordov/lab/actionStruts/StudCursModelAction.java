package md.victordov.lab.actionStruts;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.services.GenericService;
import md.victordov.lab.services.StudCursService;
import md.victordov.lab.view.model.StudCursModel;
import md.victordov.lab.vo.StudCurs;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.ActionContext;

public class StudCursModelAction extends ActionSupport implements
		ModelDriven<StudCursModel> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StudCursModel studCursModel;
	public GenericService<StudCursModel, StudCurs> genService;
	private List<StudCursModel> studCursModelList;
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

	public StudCursModelAction() {
		this.genService = new StudCursService();
	}

	public String execute() throws MyDaoException {

		this.studCursModelList = genService.retrieve();

		return SUCCESS;
	}

	public String listAllStudCursModel() throws MyDaoException {
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
		
		this.studCursModelList = genService.retrieve(pgNr,MAX_PER_PAGE);
		
		return SUCCESS;
	}

	public String addStudCursModel() throws MyDaoException {
		boolean rezultat = false;
		if(studCursModel!=null){
			rezultat = genService.create(studCursModel);			
		}
		
		return	rezultat?"success":"validate";

	}

	public String deleteStudCursModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		boolean rezult = false;
		Integer id = null;
		if(request.getParameter("id")!=null){
			try{
				id = Integer.parseInt(request.getParameter("id"));
				rezult = genService.delete(id);
			}catch(NumberFormatException nfe){
				System.out.println("Student-Curs Id is null");
			}
			
		}else{
			System.out.println("Id of the Student-Curs to delete not received");
		}

		return rezult ? "success":"validate";
	}

	public String editStudCursModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		studCursModel = genService.retrieve(Integer.parseInt(request
				.getParameter("id")));

		return SUCCESS;
	}

	public String updateStudCursModel() throws MyDaoException {
		boolean rezult = false;
		if(this.studCursModel != null){
			rezult = genService.update(this.studCursModel);	
		}
		
		this.studCursModelList = genService.retrieve();

		return rezult ? "success" : "validate";
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

	@Override
	public StudCursModel getModel() {
		return this.studCursModel;
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
