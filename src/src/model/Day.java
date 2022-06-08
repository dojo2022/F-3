package model;
import java.io.Serializable;
import java.util.Date;

public class Day implements Serializable {
	  private int date_id;
	  private Date date;
	public Day(int date_id, Date date) {
		super();
		this.date_id = date_id;
		this.date = date;
	}

	public Day() {
		super();
		this.date_id = 0;
		this.date = new Date();
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

	public void setDate(Date date) {
		this.date = date;
	}
}


