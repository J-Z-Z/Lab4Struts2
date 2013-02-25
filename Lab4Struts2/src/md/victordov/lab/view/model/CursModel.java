package md.victordov.lab.view.model;

public class CursModel implements java.io.Serializable {

	private static final long serialVersionUID = 6462054439131634000L;
	public CursModel() {

	}


	public String getNumeCurs() {
		return numeCurs;
	}

	public void setNumeCurs(String numeCurs) {
		this.numeCurs = numeCurs;
	}

	public String getUniverNume() {
		return univerNume;
	}

	public void setUniverNume(String univerNume) {
		this.univerNume = univerNume;
	}


	public String getProfesorNume() {
		return profesorNume;
	}

	public void setProfesorNume(String profesorNume) {
		this.profesorNume = profesorNume;
	}

	public Integer getUniversitateId() {
		return universitateId;
	}

	public void setUniversitateId(Integer universitateId) {
		this.universitateId = universitateId;
	}

	public Integer getProfesorId() {
		return profesorId;
	}

	public void setProfesorId(Integer profesorId) {
		this.profesorId = profesorId;
	}

	public Integer getCursId() {
		return cursId;
	}


	public void setCursId(Integer cursId) {
		this.cursId = cursId;
	}

	private Integer cursId; // Curs Id
	private String numeCurs; // Denumirea cursului
	private Integer universitateId; // Universitate Id
	private String univerNume;
	private Integer profesorId; // Profesor Id
	private String profesorNume;

}
