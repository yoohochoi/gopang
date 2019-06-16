package DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.CommentVO;

@Repository
public class CommentDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	public void addComment(CommentVO vo) {
		sqlSession.insert("comment.addComment", vo);
	}

	public List<CommentVO> listcomment(int imageseq) {
		return sqlSession.selectList("comment.listcomment", imageseq);
	}

	public void delcomment(int commentseq) {
		sqlSession.delete("comment.delcomment", commentseq);
	}

	public void addCommentsec(CommentVO vo) {
		sqlSession.insert("comment.addCommentsec", vo);
	}

	public CommentVO findparent(int parent) {
		return sqlSession.selectOne("comment.findparent", parent);
	}


}
