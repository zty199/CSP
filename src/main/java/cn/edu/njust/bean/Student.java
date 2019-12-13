package cn.edu.njust.bean;

public class Student {
	
	private String stuID;
	private String stuName;
	private String stuPassword;
	private String stuGrade;
	private Boolean pubFree;
	private int usedNum;
	private int scoreNum;
	private String stuPersonID;

	public String getStuPersonID() {
		return stuPersonID;
	}

	public void setStuPersonID(String stuPersonID) {
		this.stuPersonID = stuPersonID;
	}

	public String getStuID() {
		return stuID;
	}

	public void setStuID(String stuID) {
		this.stuID = stuID;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getStuPassword() {
		return stuPassword;
	}

	public void setStuPassword(String stuPassword) {
		this.stuPassword = stuPassword;
	}

	public String getStuGrade() {
		return stuGrade;
	}

	public void setStuGrade(String stuGrade) {
		this.stuGrade = stuGrade;
	}

	public Boolean getPubFree() {
		return pubFree;
	}

	public void setPubFree(Boolean pubFree) {
		this.pubFree = pubFree;
	}

	public int getUsedNum() {
		return usedNum;
	}

	public void setUsedNum(int usedNum) {
		this.usedNum = usedNum;
	}

	public int getScoreNum() {
		return scoreNum;
	}

	public void setScoreNum(int scoreNum) {
		this.scoreNum = scoreNum;
	}

}
