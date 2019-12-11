package cn.edu.njust.bean;

public class Score {
	
	private String stuID;
	private String stuName;
	private String examNO;
	private int stuScore;
	
	public Score(String stuID, String stuName, String examNO, int stuScore) {
		super();
		this.stuID = stuID;
		this.stuName = stuName;
		this.examNO = examNO;
		this.stuScore = stuScore;
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



	public String getExamNO() {
		return examNO;
	}



	public void setExamNO(String examNO) {
		this.examNO = examNO;
	}



	public int getStuScore() {
		return stuScore;
	}



	public void setStuScore(int stuScore) {
		this.stuScore = stuScore;
	}



	public Score() {
		// TODO 自动生成的构造函数存根
	}

}
