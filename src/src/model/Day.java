package model;
import java.io.Serializable;


public class Day implements Serializable {
	  private int date_id;
	  private String date;

	public Day(int date_id, String date) {
		super();
		this.date_id = date_id;
		this.date = date;
	}

	public Day() {
		super();
		this.date_id = 0;
		this.date="";

	}

	public int getDate_id() {
		return date_id;
	}

	public void setDate_id(int date_id) {
		this.date_id = date_id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}


