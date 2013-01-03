package md.victordov.lab.actionStruts;

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

	public StudCursModelAction() {
		this.genService = new StudCursService();
	}

	public String execute() {
		try {
			this.studCursModelList = genService.retrieve();

		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String listAllStudCursModel() {
		try {
			this.studCursModelList = genService.retrieve();

		} catch (MyDaoException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String addStudCursModel() {
		try {
			genService.create(studCursModel);
			this.studCursModelList = genService.retrieve();
		} catch (MyDaoException e) {
			System.out.println("Eroare in add StudCursModel");
		}

		return SUCCESS;

	}

	public String deleteStudCursModel() {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			genService.delete(Integer.parseInt(request.getParameter("id")));
		} catch (NumberFormatException e) {
		} catch (MyDaoException e) {
		}

		return SUCCESS;
	}

	public String editStudCursModel() {
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			studCursModel = genService.retrieve(Integer.parseInt(request
					.getParameter("id")));
		} catch (NumberFormatException e) {
		} catch (MyDaoException e) {
		}
		return SUCCESS;
	}

	public String updateStudCursModel() {
		try {
			genService.update(this.studCursModel);
			this.studCursModelList = genService.retrieve();
		} catch (MyDaoException e) {
			System.out.println("Eroare in Update StudCursModel");
		}

		return SUCCESS;
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

}
