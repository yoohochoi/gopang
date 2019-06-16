package DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.UserVO;

@Repository
public class UserDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	public void userRegster(UserVO vo) {
		sqlSession.insert("user.insertUser", vo);
	}

	public UserVO finduser(String userid) {
		return sqlSession.selectOne("user.finduser", userid);
	}

	public List<UserVO> userList() {
		return sqlSession.selectList("user.userList");
	}

	public void updateUser(UserVO vo) {
		sqlSession.update("user.updateUser", vo);
	}

	public UserVO finduseremail(String email) {
		return sqlSession.selectOne("user.finduseremail", email);
	}
	
}
