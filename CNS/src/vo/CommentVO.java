package vo;

import java.util.List;

public class CommentVO {
	
	private int commentseq;
	private int parent;
	private int depth;
	private int seq;
	private int imageseq;
	private String userid;
	private String username;
	private String comment;
	private String regdate;
	
	private List<CommentVO> listsec;
	
	
	public CommentVO() {}
	
	
	

	public List<CommentVO> getListsec() {
		return listsec;
	}




	public void setListsec(List<CommentVO> listsec) {
		this.listsec = listsec;
	}




	public int getCommentseq() {
		return commentseq;
	}


	public void setCommentseq(int commentseq) {
		this.commentseq = commentseq;
	}


	public int getParent() {
		return parent;
	}


	public void setParent(int parent) {
		this.parent = parent;
	}


	public int getDepth() {
		return depth;
	}


	public void setDepth(int depth) {
		this.depth = depth;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getImageseq() {
		return imageseq;
	}


	public void setImageseq(int imageseq) {
		this.imageseq = imageseq;
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


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	

}
