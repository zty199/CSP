package cn.edu.njust.bean;

public class Score {
	
	private String stuID;
	private String stuName;
	private String session;
	private int total_score;
	private int score_1;
	private int score_2;
	private int score_3;
	private int score_4;
	private int score_5;
	private String cur_rank;
	private String all_rank;

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

	public String getSession() {
		return session;
	}

	public void setSession(String session) {
		this.session = session;
	}

	public int getTotal_score() {
		return total_score;
	}

	public void setTotal_score(int total_score) {
		this.total_score = total_score;
	}

	public int getScore_1() {
		return score_1;
	}

	public void setScore_1(int score_1) {
		this.score_1 = score_1;
	}

	public int getScore_2() {
		return score_2;
	}

	public void setScore_2(int score_2) {
		this.score_2 = score_2;
	}

	public int getScore_3() {
		return score_3;
	}

	public void setScore_3(int score_3) {
		this.score_3 = score_3;
	}

	public int getScore_4() {
		return score_4;
	}

	public void setScore_4(int score_4) {
		this.score_4 = score_4;
	}

	public int getScore_5() {
		return score_5;
	}

	public void setScore_5(int score_5) {
		this.score_5 = score_5;
	}

	public String getCur_rank() {
		return cur_rank;
	}

	public void setCur_rank(String cur_rank) {
		this.cur_rank = cur_rank;
	}

	public String getAll_rank() {
		return all_rank;
	}

	public void setAll_rank(String all_rank) {
		this.all_rank = all_rank;
	}

}
