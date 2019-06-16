package Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.CommentService;
import vo.CommentVO;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentservice;
	
	//��� ���
	@RequestMapping(value="/commet/addcomment.do")
	@ResponseBody
	public String addcomment(CommentVO vo) {
		commentservice.addComment(vo);
		return "1";
	}
	
	// ��� ����
	@RequestMapping("/comment/delcomment.do")
	@ResponseBody
	public String delcomment(CommentVO vo, HttpSession session) {
		
		commentservice.delcomment(vo.getCommentseq());
		
		return "1";
	}
	
	//���� ��� ������ �̵�
	@RequestMapping("/comment/addcommentsecPage.do")
	public String addcommentsecPage(int commentseq, int imageseq, Model model) {
		
		model.addAttribute("imageseq", imageseq);
		model.addAttribute("commentseq", commentseq);
		return "comment/commentsec";
	}
	
	//���� ���
	@ResponseBody
	@RequestMapping("/comment/addcommentsec.do")
	public String addcommentsec(CommentVO vo) {
		commentservice.addCommentsec(vo);
		return "1";
	}
	
	

}
