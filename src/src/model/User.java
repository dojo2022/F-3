package model;
import java.io.Serializable;

public class User implements Serializable{
	private int user_id;
	private String user_pass;
	private int point;
	private int char_id;

	public User(int user_id, String user_pass, int point, int char_id) {
		super();
		this.user_id = user_id;
		this.user_pass = user_pass;
		this.point = point;
		this.char_id = char_id;
	}

	public User() {
		super();
		this.user_id = 0;
		this.user_pass = "";
		this.point = 0;
		this.char_id = 0;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_pass() {
		return user_pass;
	}

	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getChar_id() {
		return char_id;
	}

	public void setChar_id(int char_id) {
		this.char_id = char_id;
	}

}
