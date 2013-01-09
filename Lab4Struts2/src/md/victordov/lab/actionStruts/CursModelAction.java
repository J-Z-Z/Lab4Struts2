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

	public String execute() {
		try {
			this.cursModelList = genService.retrieve();
			// this.cursModel = genService.retrieve(2);

		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String listAllCursModel() {
		try {
			this.cursModelList = genService.retrieve();

		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addCursModel() {
		try {
			genService.create(cursModel);
			this.cursModelList = genService.retrieve();
		} catch (MyDaoException e) {
			
			System.out.println("Eroare in add CursModel");
			return "daoException";
		}

		return SUCCESS;

	}

	public String deleteCursModel() {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			genService.delete(Integer.parseInt(request.getParameter("id")));
		} catch (NumberFormatException e) {
		} catch (MyDaoException e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}

	public String editCursModel() {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			cursModel = genService.retrieve(Integer.parseInt(request
					.getParameter("id")));
		} catch (NumberFormatException e) {
		} catch (MyDaoException e) {
		}
		return SUCCESS;
	}

	public String updateCursModel() {
		try {
			genService.update(this.cursModel);
			this.cursModelList = genService.retrieve();
		} catch (MyDaoException e) {
			System.out.println("Eroare in Update CursModel");
		}

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
