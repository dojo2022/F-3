package model;
import java.io.Serializable;

public class Mission implements Serializable {
	 private int mission_id;
	  private String mission;
	  private boolean cleared;
	public Mission(int mission_id, String mission, boolean cleared) {
		super();
		this.mission_id = mission_id;
		this.mission = mission;
		this.cleared = cleared;
	}
	public Mission() {
		super();
		this.mission_id = 0;
		this.mission = "";
		this.cleared = false;
	}
	public int getMission_id() {
		return mission_id;
	}
	public void setMission_id(int mission_id) {
		this.mission_id = mission_id;
	}
	public String getMission() {
		return mission;
	}
	public void setMission(String mission) {
		this.mission = mission;
	}
	public boolean getCleared() {
		return cleared;
	}
	public void setCleared(boolean cleared) {
		this.cleared = cleared;
	}

}
