package md.victordov.lab.services;

import java.util.ArrayList;
import java.util.List;

import md.victordov.lab.common.exception.MyDaoException;
import md.victordov.lab.dao.CursDAO;
import md.victordov.lab.dao.GenericDAO;
import md.victordov.lab.view.model.CursModel;
import md.victordov.lab.vo.Curs;
import md.victordov.lab.vo.Profesor;
import md.victordov.lab.vo.Universitate;

public class CursService implements GenericService<CursModel, Curs> {

	/**
	 * @author victor dovgaliuc Curs. @ Service handles all DAO request but
	 *         returns and receives different object CursModel object
	 */

	@Override
	public List<CursModel> retrieve() throws MyDaoException {
		GenericDAO<Curs> gDao = new CursDAO();
		return this.transformList(gDao.retrieve());
	}

	@Override
	public List<CursModel> retrieve(Integer start, Integer maxRecords)
			throws MyDaoException {
		GenericDAO<Curs> gDao = new CursDAO();
		return this.transformList(gDao.retrieve(start, maxRecords));
	}

	@Override
	public CursModel retrieve(Integer id) throws MyDaoException {
		GenericDAO<Curs> gDao = new CursDAO();
		return this.transform(gDao.retrieve(id));
	}

	@Override
	public boolean create(CursModel t) throws MyDaoException {
		GenericDAO<Curs> gDao = new CursDAO();
		return gDao.create(this.transformBack(t));
	}

	@Override
	public boolean update(CursModel t) throws MyDaoException {
		GenericDAO<Curs> gDao = new CursDAO();
		return gDao.update(this.transformBack(t));

	}

	@Override
	public boolean delete(Integer id) throws MyDaoException {
		GenericDAO<Curs> gDao = new CursDAO();
		gDao.delete(id);
		return true;

	}

	@Override
	public Long countSize() throws MyDaoException {
		GenericDAO<Curs> gDao = new CursDAO();
		return gDao.countSize();
	}

	@Override
	public List<CursModel> transformList(List<Curs> r) {
		List<CursModel> cursModelList = new ArrayList<CursModel>();
		for (Curs c : r) {
			CursModel cursModelTemp = new CursModel();
			cursModelTemp.setCursId(c.getCId());
			cursModelTemp.setNumeCurs(c.getNumeCurs());

			cursModelTemp.setUniversitateId(c.getUniversitate().getUId());
			if (c.getUniversitate().getNumeUniver() != null) {
				cursModelTemp
						.setUniverNume(c.getUniversitate().getNumeUniver());
			}
			cursModelTemp.setProfesorId(c.getProfesor().getPId());
			if ((c.getProfesor().getNume() != null)
					&& (c.getProfesor().getPrenume() != null))
				cursModelTemp.setProfesorNume(c.getProfesor().getNume() + " "
						+ c.getProfesor().getPrenume());
			cursModelList.add(cursModelTemp);
		}
		return cursModelList;
	}

	@Override
	public CursModel transform(Curs c) {
		CursModel cursModel = new CursModel();
		cursModel.setCursId(c.getCId());
		cursModel.setNumeCurs(c.getNumeCurs());
		cursModel.setUniversitateId(c.getUniversitate().getUId());
		cursModel.setUniverNume(c.getUniversitate().getNumeUniver());
		cursModel.setProfesorId(c.getProfesor().getPId());
		cursModel.setProfesorNume(c.getProfesor().getNume() + " "
				+ c.getProfesor().getPrenume());

		return cursModel;
	}

	@Override
	public Curs transformBack(CursModel t) {
		Curs curs = new Curs();
		Profesor profesor = new Profesor();
		Universitate univ = new Universitate();

		curs.setCId(t.getCursId());
		curs.setNumeCurs(t.getNumeCurs());

		univ.setUId(t.getUniversitateId());
		curs.setUniversitate(univ);

		profesor.setPId(t.getProfesorId());
		curs.setProfesor(profesor);

		return curs;
	}

}
