package md.victordov.lab.actionStruts;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	private ProfesorModel profesorModel;
	public GenericService<ProfesorModel, Profesor> genService;
	private List<ProfesorModel> profesorModelList;
	private static final int MAX_PER_PAGE = 5;
	private Long countTotal = 0L;
	private List<Long> pgArray = new ArrayList<Long>();

	public ProfesorModelAction() {
		this.genService = new ProfesorService();
	}

	public String execute() throws MyDaoException {

		this.profesorModelList = genService.retrieve();
		return SUCCESS;
	}

	public String listAllProfesorModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Integer pgNr = 0;
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
		
		this.profesorModelList = genService.retrieve(pgNr,MAX_PER_PAGE);

		return SUCCESS;
	}

	public String addProfesorModel() throws MyDaoException {

		genService.create(profesorModel);
		this.profesorModelList = genService.retrieve();

		return SUCCESS;

	}

	public String deleteProfesorModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		genService.delete(Integer.parseInt(request.getParameter("id")));

		return SUCCESS;
	}

	public String editProfesorModel() throws MyDaoException {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		profesorModel = genService.retrieve(Integer.parseInt(request
				.getParameter("id")));
		return SUCCESS;
	}

	public String updateProfesorModel() throws MyDaoException {

		genService.update(this.profesorModel);
		this.profesorModelList = genService.retrieve();

		return SUCCESS;
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
}
