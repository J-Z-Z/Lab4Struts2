package md.victordov.lab.services;

import java.util.ArrayList;
import java.util.List;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.ProfesorDAO;
import md.victordov.lab.view.model.ProfesorModel;
import md.victordov.lab.vo.Profesor;

public class ProfesorService implements GenericService<ProfesorModel, Profesor> {

	private ProfesorDAO gDao = new ProfesorDAO();
	
	@Override
	public List<ProfesorModel> retrieve() throws MyDaoException {
		return this.transformList(gDao.retrieve());
	}

	@Override
	public List<ProfesorModel> retrieve(Integer start, Integer maxRecords)
			throws MyDaoException {
		return this.transformList(gDao.retrieve(start, maxRecords));
	}

	@Override
	public ProfesorModel retrieve(Integer id) throws MyDaoException {
		return this.transform(gDao.retrieve(id));
	}

	@Override
	public boolean create(ProfesorModel t) throws MyDaoException {
		return gDao.create(this.transformBack(t));

	}

	@Override
	public boolean update(ProfesorModel t) throws MyDaoException {
		return gDao.update(this.transformBack(t));
	}

	@Override
	public boolean delete(Integer id) throws MyDaoException {
		gDao.delete(id);
		return true;
	}

	@Override
	public Long countSize() throws MyDaoException {
		return gDao.countSize();
	}

	@Override
	public List<ProfesorModel> transformList(List<Profesor> r) {
		List<ProfesorModel> profesorModelList = new ArrayList<ProfesorModel>();
		for (Profesor p : r) {
			ProfesorModel profesorModelTemp = new ProfesorModel();
			profesorModelTemp.setPId(p.getPId());
			profesorModelTemp.setNume(p.getNume());
			profesorModelTemp.setPrenume(p.getPrenume());
			profesorModelTemp.setAdresa(p.getAdresa());

			profesorModelList.add(profesorModelTemp);
		}
		return profesorModelList;
	}

	@Override
	public ProfesorModel transform(Profesor p) {
		ProfesorModel profesorModel = new ProfesorModel();
		profesorModel.setPId(p.getPId());
		profesorModel.setNume(p.getNume());
		profesorModel.setPrenume(p.getPrenume());
		profesorModel.setAdresa(p.getAdresa());

		return profesorModel;
	}

	@Override
	public Profesor transformBack(ProfesorModel t) {
		Profesor profesor = new Profesor();
		profesor.setPId(t.getPId());
		profesor.setNume(t.getNume());
		profesor.setPrenume(t.getPrenume());
		profesor.setAdresa(t.getAdresa());
		return profesor;
	}

}
