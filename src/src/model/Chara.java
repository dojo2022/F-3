package model;
import java.io.Serializable;

public class Chara implements Serializable{
	private int char_id;
	private String name;
	private int Ex_point;
	private String file_pass;

	public Chara(int char_id, String name, int ex_point, String file_pass) {
		super();
		this.char_id = char_id;
		this.name = name;
		Ex_point = ex_point;
		this.file_pass = file_pass;
	}

	public Chara() {
		super();
		this.char_id = 0;
		this.name = "";
		Ex_point = 0;
		this.file_pass = "";
	}

	public int getChar_id() {
		return char_id;
	}

	public void setChar_id(int char_id) {
		this.char_id = char_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getEx_point() {
		return Ex_point;
	}

	public void setEx_point(int ex_point) {
		Ex_point = ex_point;
	}

	public String getFile_pass() {
		return file_pass;
	}

	public void setFile_pass(String file_pass) {
		this.file_pass = file_pass;
	}



}
