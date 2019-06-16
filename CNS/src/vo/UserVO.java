package vo;

public class UserVO {
	
	private int userseq;
	private String username;
	private String email;
	private String password;
	private String regdate;
	private String point;
	private String userid;
	private String login_YN;
	private int login_cnt;
	
	public UserVO() {}
	
	
	
	public int getUserseq() {
		return userseq;
	}




	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}




	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}



	public String getLogin_YN() {
		return login_YN;
	}



	public void setLogin_YN(String login_YN) {
		this.login_YN = login_YN;
	}



	public int getLogin_cnt() {
		return login_cnt;
	}



	public void setLogin_cnt(int login_cnt) {
		this.login_cnt = login_cnt;
	}
	
	
	
	

}
