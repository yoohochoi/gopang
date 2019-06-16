package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DAO.UserDAO;
import service.UserService;
import vo.UserVO;

@Service
public class UserServiceimpl implements UserService{
	
	@Autowired
	private UserDAO userdao;

	@Override
	public void userRegster(UserVO vo) {
		userdao.userRegster(vo);
	}

	@Override
	public UserVO finduser(String userid) {
		return userdao.finduser(userid);
	}

	@Override
	public List<UserVO> userList() {
		return userdao.userList();
	}

	@Override
	public void updateUser(UserVO vo) {
		userdao.updateUser(vo);
	}

	@Override
	public UserVO finduseremail(String email) {
		return userdao.finduseremail(email);
	}


}
