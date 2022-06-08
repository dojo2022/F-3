package model;
import java.io.Serializable;

public class Date implements Serializable {
	  private int date_id;
	  private Date date;
	public Date(int date_id, Date date) {
		super();
		this.date_id = date_id;
		this.date = date;
	}

	public Date() {
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

