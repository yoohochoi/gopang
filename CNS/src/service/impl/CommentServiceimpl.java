package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DAO.CommentDAO;
import service.CommentService;
import vo.CommentVO;

@Service
public class CommentServiceimpl implements CommentService{
	
	@Autowired
	private CommentDAO commentdao;

	@Override
	public void addComment(CommentVO vo) {
		commentdao.addComment(vo);
	}

	@Override
	public List<CommentVO> listcomment(int imageseq) {
		return commentdao.listcomment(imageseq); 
	}

	@Override
	public void delcomment(int commentseq) {
		commentdao.delcomment(commentseq);
	}

	@Override
	public void addCommentsec(CommentVO vo) {
		CommentVO parent = commentdao.findparent(vo.getParent());
		if(parent == null || parent.getDepth() == 0) {
			vo.setDepth(1);
		}else {
			vo.setDepth(parent.getDepth()+1);
		}
		commentdao.addCommentsec(vo);
	}

}
