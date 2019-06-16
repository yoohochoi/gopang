package service;

import java.util.List;

import vo.ImagVO;

public interface ImageService {
	
	void addimg(ImagVO vo);
	List<ImagVO> listImage(ImagVO vo);
	ImagVO detailimage(String imagseq);
	void deleteimage(String imageseq);
	void updateimage(ImagVO vo);
	int totalcount();
}
