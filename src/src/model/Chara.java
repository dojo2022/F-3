
package model;
import java.io.Serializable;

public class Chara implements Serializable{
	private int char_id;
	private String name;
	private int Ex_point;
	private String eggimg;
	private String charaimg1;
	private String charaimg2;
	private String charaimg3;
	private String charaimg4;

	public Chara(int char_id, String name, int ex_point, String eggimg, String charaimg1, String charaimg2, String charaimg3, String charaimg4) {
		super();
		this.char_id = char_id;
		this.name = name;
		Ex_point = ex_point;
		this.eggimg = eggimg;
		this.charaimg1 = charaimg1;
		this.charaimg2 = charaimg2;
		this.charaimg3 = charaimg3;
		this.charaimg4 = charaimg4;
	}

	public Chara() {
		super();
		this.char_id = 0;
		this.name = "";
		Ex_point = 0;
		this.eggimg = "";
		this.charaimg1 = "";
		this.charaimg2 = "";
		this.charaimg3 = "";
		this.charaimg4 = "";
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

	public String getEggimg() {
		return eggimg;
	}

	public void setEggimg(String eggimg) {
		this.eggimg = eggimg;
	}

	public String getCharaimg1() {
		return charaimg1;
	}

	public void setCharaimg1(String charaimg1) {
		this.charaimg1 = charaimg1;
	}

	public String getCharaimg2() {
		return charaimg2;
	}

	public void setCharaimg2(String charaimg2) {
		this.charaimg2 = charaimg2;
	}

	public String getCharaimg3() {
		return charaimg3;
	}

	public void setCharaimg3(String charaimg3) {
		this.charaimg3 = charaimg3;
	}

	public String getCharaimg4() {
		return charaimg4;
	}

	public void setCharaimg4(String charaimg4) {
		this.charaimg4 = charaimg4;
	}



}
