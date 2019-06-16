package Controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import service.CommentService;
import service.ImageService;
import vo.CommentVO;
import vo.ImagVO;
import vo.UserVO;


@Controller
public class ImagController {
	
	@Autowired
	private ImageService imageservice;
	@Autowired
	private CommentService commentservice;
	
	//이미지리스트페이지
	@RequestMapping("/imag/imagpage.do")
	public String imagpage(Model model, ImagVO vo) throws Exception{
		
		model.addAttribute("end", vo.getEnd());		
		model.addAttribute("start", vo.getStart());
		int totalcount = imageservice.totalcount();
		int page = (int) Math.ceil((double)totalcount/6);
		
		if(page == 0) {
			page = 1;
		}
		
		if(vo.getStart() == 0 || vo.getStart() == 1) {
			vo.setStart(1);
		}else {
			
			vo.setStart((vo.getStart()+(5*(vo.getStart()-1))));
		}
		if(vo.getEnd() == 0 || vo.getEnd() == 1) {
			vo.setEnd(6);
		}else {
			vo.setEnd((vo.getEnd()+(5*vo.getEnd())));
		}
		
		List<ImagVO> list = imageservice.listImage(vo);
		
		List<Integer> totalpage = new ArrayList<>();
		
		for(int i=1; i<=page; i++) {
			totalpage.add(i);
		}
		
		
		model.addAttribute("page", page);
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("list", list);
		return "imag/listImage";
	}
	
	//이미지 등록 페이지2
	@RequestMapping("/imag/imagpage2.do")
	public String imagpage2() throws Exception{
		return "imag/imagCreate";
	}
	
	//이미지 등록 페이지
	@RequestMapping("/imag/addimagpage.do")
	@ResponseBody
	public String addimagpage(HttpSession session) throws Exception{
		
		UserVO user = (UserVO)session.getAttribute("user");
		if(user == null){
			return "0";
		}else {
			return "1";
		}
	}
	
	//이미지 등록
	@RequestMapping(value="/imag/addimg.do", produces="text/plain")
	@ResponseBody
	public String addimag(MultipartHttpServletRequest file, ImagVO vo, HttpServletRequest request, HttpSession session) throws Exception{
		
		if(file.getFile("imag") == null) {
			return "3";
		}
		
		UserVO user = (UserVO)session.getAttribute("user");
		vo.setUserid(user.getUserid());
		try {
			String path = "C:\\Users\\DaekyoCNS\\Desktop\\eclipse\\workspace\\CNS\\WebContent\\resources\\userImage\\";
			
			MultipartFile mf = file.getFile("imag");
			String Original = mf.getOriginalFilename();
			String safeFile = path + System.currentTimeMillis() + Original;
			String imagefile = System.currentTimeMillis() + Original;
			vo.setImagName(imagefile);
			mf.transferTo(new File(safeFile));
			imageservice.addimg(vo);
			return "1";
		}catch (IllegalStateException e) {
			
		}
		
		return "1";
	}
	
	//이미지 디테일페이지 이동
	@RequestMapping("/img/detailimage.do")
	public String detailimage(String imagseq, Model model) {
		
		ImagVO vo = imageservice.detailimage(imagseq);
		vo.setClickcnt(vo.getClickcnt()+1);
		imageservice.updateimage(vo);
		model.addAttribute("vo", vo);
		
		List<CommentVO> commentlist = commentservice.listcomment(vo.getImagseq());
		model.addAttribute("commentlist", commentlist);
		
		return "imag/detailimagepage";
	}
	
	//이미지 수정페이지 이동
	@RequestMapping("/img/updatepage.do")
	@ResponseBody
	public String updatePage(String imageseq, Model model, HttpSession session) throws Exception{
		UserVO uservo = (UserVO)session.getAttribute("user");
		ImagVO vo = imageservice.detailimage(imageseq);
		if(uservo == null) {
			return "0";
		}else if(!uservo.getUserid().equals(vo.getUserid())) {
			return "1";
		}else {
			model.addAttribute("vo", vo);
			return "2";
		}
	}
	
	//이미지 수정
	@RequestMapping("/img/updatepage2.do")
	public String updatePage2(String imageseq, Model model) throws Exception{
		ImagVO vo = imageservice.detailimage(imageseq);
		
		model.addAttribute("vo", vo);
		
		return "imag/updatePage";
	}
	
	//이미지 삭제페이지 이동
	@RequestMapping("/img/deletepage.do")
	@ResponseBody
	public String deletepage(String imageseq, HttpSession session) throws Exception{
		UserVO uservo = (UserVO)session.getAttribute("user");
		ImagVO vo = imageservice.detailimage(imageseq);
		
		if(uservo == null) {
			return "2";
		}
		
		if(!uservo.getUserid().equals(vo.getUserid())) {
			return "1";
		}else {
			imageservice.deleteimage(imageseq);
			return "0";
		}
	}
	
	

}
