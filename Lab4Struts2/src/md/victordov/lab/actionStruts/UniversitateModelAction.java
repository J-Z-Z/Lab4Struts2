package md.victordov.lab.actionStruts;

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

	public UniversitateModelAction() {
		this.genService = new UniversitateService();
	}

	public String execute() {
		try {
			this.universitateModelList = genService.retrieve();

		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String listAllUniversitateModel() {
		try {
			this.universitateModelList = genService.retrieve();

		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addUniversitateModel() {
		try {
			genService.create(universitateModel);
			this.universitateModelList = genService.retrieve();
		} catch (MyDaoException e) {
			System.out.println("Eroare in add Universitate");
		}

		return SUCCESS;

	}

	public String deleteUniversitateModel() {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			genService.delete(Integer.parseInt(request.getParameter("id")));
		} catch (NumberFormatException e) {
		} catch (MyDaoException e) {
		}

		return SUCCESS;
	}

	public String editUniversitateModel() {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			universitateModel = genService.retrieve(Integer.parseInt(request
					.getParameter("id")));
		} catch (NumberFormatException e) {
		} catch (MyDaoException e) {
		}
		return SUCCESS;
	}

	public String updateUniversitateModel() {
		try {
			genService.update(this.universitateModel);
			this.universitateModelList = genService.retrieve();
		} catch (MyDaoException e) {
			System.out.println("Eroare in Update Universitate");
		}

		return SUCCESS;
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

}
