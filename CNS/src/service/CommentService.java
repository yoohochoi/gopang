package service;

import java.util.List;

import vo.CommentVO;

public interface CommentService {
	
	void addComment(CommentVO vo);
	List<CommentVO> listcomment(int imageseq);
	void delcomment(int commentseq);
	void addCommentsec(CommentVO vo);
}
