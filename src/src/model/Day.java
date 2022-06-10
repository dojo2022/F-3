package model;
import java.io.Serializable;
import java.util.Date;


public class Day implements Serializable {
	  private int date_id;
	  private java.sql.Date date;

	public Day(int date_id, java.sql.Date date) {
		super();
		this.date_id = date_id;
		this.date = date;
	}

	public Day() {
		super();
		this.date_id = 0;
		long looooong=date.getTime();
		java.sql.Date jsd=new java.sql.Date(looooong);
		this.date =jsd;

	}

	public int getDate_id() {
		return date_id;
	}

	public void setDate_id(int date_id) {
		this.date_id = date_id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(java.sql.Date date) {
		this.date = date;
	}
}


