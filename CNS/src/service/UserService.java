package service;

import java.util.List;

import vo.UserVO;

public interface UserService {
	
	public void userRegster(UserVO vo);
	public UserVO finduser(String userid);
	List<UserVO> userList();
	public void updateUser(UserVO vo);
	public UserVO finduseremail(String email);

}
