package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DAO.ImageDAO;
import service.ImageService;
import vo.ImagVO;


@Service
public class ImageServiceimpl implements ImageService{
	
	@Autowired
	private ImageDAO imagedao; 

	@Override
	public void addimg(ImagVO vo) {
		imagedao.addimg(vo);
	}

	@Override
	public List<ImagVO> listImage(ImagVO vo) {
		return imagedao.listImage(vo);
	}

	@Override
	public ImagVO detailimage(String imagseq) {
		return imagedao.detailimage(imagseq);
	}

	@Override
	public void deleteimage(String imageseq) {
		imagedao.deleteimage(imageseq);
	}

	@Override
	public int totalcount() {
		return imagedao.totalcount();
	}

	@Override
	public void updateimage(ImagVO vo) {
		imagedao.updateimage(vo);
	}

}
