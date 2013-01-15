package md.victordov.lab.actionStruts;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	private static final long serialVersionUID = 1L;
	private CursModel cursModel;
	public GenericService<CursModel, Curs> genService;
	private List<CursModel> cursModelList;

	public CursModelAction() {
		this.genService = new CursService();
	}

	public String execute() throws MyDaoException {

		this.cursModelList = genService.retrieve();

		return SUCCESS;
	}

	public String listAllCursModel() throws MyDaoException {

		this.cursModelList = genService.retrieve();

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

}
