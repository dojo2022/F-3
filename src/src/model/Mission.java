package model;
import java.io.Serializable;

public class Mission implements Serializable {
	 private int mission_id;
	  private String mission;
	public Mission(int mission_id, String mission) {
		super();
		this.mission_id = mission_id;
		this.mission = mission;
	}
	public Mission() {
		super();
		this.mission_id = 0;
		this.mission = "";
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
}
