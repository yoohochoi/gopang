package DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ImagVO;

@Repository
public class ImageDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	public void addimg(ImagVO vo) {
		sqlSession.insert("image.addimg", vo);
	}

	public List<ImagVO> listImage(ImagVO vo) {
		return sqlSession.selectList("image.listImage", vo);
	}

	public ImagVO detailimage(String imagseq) {
		return sqlSession.selectOne("image.detailimage", imagseq);
	}
	
	public void deleteimage(String imageseq) {
		sqlSession.delete("image.deleteimage", imageseq);
	}

	public int totalcount() {
		return sqlSession.selectOne("image.totalcount");
	}
	
	public void updateimage(ImagVO vo) {
		sqlSession.update("image.updateimage", vo);
	}
	
	

}
