package Controller;

  import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.Base64Decoder;
import com.oreilly.servlet.Base64Encoder;

import service.UserService;
import vo.UserVO;

@Controller
public class UserCotroller {
	
	@Autowired
	private UserService userservice;
	
	//�α��� ������ �̵�
	@RequestMapping("/user/UserLogin.do")
	public String login() throws Exception{
		return "user/UserLogin";
	}
	
	//ȸ�������������̵�
	@RequestMapping("/user/regsterpage.do")
	public String regster(String userid, Model model) throws Exception{
		
		UserVO user = userservice.finduser(userid);
		
		if(user == null) {
			return "user/regsterpage";
		}else {
			model.addAttribute("user", user);
			return "user/updateUserPage";
		}
	}
	
	//ȸ������
	@RequestMapping("/user/UserRegster.do")
	@ResponseBody
	public String userregster(UserVO vo) throws Exception{
		
		UserVO user = userservice.finduser(vo.getUserid());
		
		if(user == null) {
			vo.setPassword(Base64Encoder.encode(vo.getPassword()));
			userservice.userRegster(vo);
			return "0";
		}else {
			return "1";
		}
		
	}
	
	//�α���
	@RequestMapping("/user/login.do")
	@ResponseBody
	public int userlogin(String userid, String pw, HttpSession session, Model model) throws Exception{
		UserVO vo = userservice.finduser(userid);
		
		if(vo == null) {
			return 6;
		}
		if(vo.getLogin_cnt() == 5 || vo.getLogin_YN().equals("N")) {
			return 7;
		}
		
		String base = Base64Decoder.decode(vo.getPassword());
		
		if(vo.getUserid().equals(userid) & base.equals(pw)) {
			session.setAttribute("user", vo);
			return 8;
		}else {
			vo.setLogin_cnt(vo.getLogin_cnt()+1);
			if(vo.getLogin_cnt() == 5) {
				vo.setLogin_YN("N");
			}
			userservice.updateUser(vo);
			return vo.getLogin_cnt();
		}
	}
	
	//�α׾ƿ�
	@RequestMapping("/user/logout.do")
	public String userlogout(HttpSession session) throws Exception{
		session.invalidate();
		return "/home/homepage";
	}
	
	//ȸ�� ���� ����Ʈ ������
	@RequestMapping("/user/userList.do")
	public String userList(Model model) throws Exception{
		
		List<UserVO> list = userservice.userList();
		
		model.addAttribute("list", list);
		
		return "/user/userListPage";
	}
	
	//���� �ٿ�ε�
	
	// ���� �ٿ�ε�
	@RequestMapping("/user/excelDowm.do")
	public void excelDown(HttpServletResponse res) throws Exception{

		
		// �Խ��� ��� ��ȸ
		List<UserVO> list = userservice.userList();
		
		// ��ũ�� ����
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("�Խ���");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
		
		//���̺� ����� ��Ÿ��
		CellStyle headStyle = wb.createCellStyle();

		//���� ��輱�� �����ϴ�.
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);
		
		//������ ������Դϴ�.
		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		//�����ʹ� ����� �����մϴ�.
		headStyle.setAlignment(HorizontalAlignment.CENTER);
		
		//�����Ϳ� ��� ��Ÿ�� �׵θ��� ����
		CellStyle bodyStyle = wb.createCellStyle();
		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);
		
		//��� ����
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("seq");
		
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("���̵�");
		
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("�̸�");
		
		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("�̸���");
		
		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("��� ��¥");
		
		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("����Ʈ");
		
		//������ �κ� ����
		for(UserVO vo : list) {
			row = sheet.createRow(rowNo++);
			
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getUserseq());
			
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getUserid());
			
			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getUsername());
			
			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getEmail());
			
			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getRegdate());
			
			cell = row.createCell(5);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getPoint());
		}
		
		//������ Ÿ�԰� ���ϸ� ����
		res.setContentType("application/vnd.ms-excel");
		res.setHeader("Content-Disposition", "attachment;filename=test.xls");

		//���� ���
		wb.write(res.getOutputStream());
		wb.close();
	}
	
	//���� ���ε� ������ �̵�
	@RequestMapping("/user/uploadExcelPage.do")
	public String uploadExcelPage() {
		return "/user/uploadExcelPage";
	}
	
	//���� ���ε�
	@ResponseBody
	@RequestMapping(value="/user/excelUploadAjax.do", method = RequestMethod.POST)
	public String excelUploadAjax(MultipartHttpServletRequest req) throws Exception{
		
		MultipartFile excelFile = req.getFile("excelFile");
		System.out.println("���� ���� ���ε�");
		
		if(excelFile == null || excelFile.isEmpty()) {
			return "2";
		}
		
		
		return null;
	}
	
	//��й�ȣ ã�� ������ �̵�
	@RequestMapping("/user/findPassword.do")
	public String findPassword() throws Exception{
		return "/user/findPasswordPage";
	}
	
	
	//���� �߼�
	@ResponseBody
	@RequestMapping("/user/emailAuth.do")
	public String emailAuth(HttpServletRequest req, Model model, String email) throws Exception {
		
		UserVO vo = userservice.finduseremail(email);
		if(vo == null) {
			return "2";
		}
		//���� ���� ����
		String host = "smtp.gmail.com";
		String username = "kkymg92@gmail.com";
		String password = "jtvvjmyzaqsffgdf";
		
		//���� ����
		String recipient = email;
		String subject = "�ӽ� ��й�ȣ �Դϴ�.";
		String uuid = null;
		
		for(int i=0; i<5; i++) {
			uuid = UUID.randomUUID().toString().replaceAll("", "");
			uuid = uuid.substring(0, 10);
		}
		
		String body = "����� �ӽ� ��й�ȣ�� " + uuid + " �Դϴ�.";
		
		vo.setPassword(Base64Encoder.encode(uuid));
		userservice.updateUser(vo);
		
		
		
		//properties ����
		Properties props = new Properties();
		props.put("mail.smtps.auth", "true");
		
		//���� ����
		Session session = Session.getDefaultInstance(props);
		MimeMessage msg = new MimeMessage(session);
		
		//���� ����
		msg.setSubject(subject);
		msg.setText(body);
		msg.setFrom(new InternetAddress(username));
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		
		//�߼�ó��
		Transport tr = session.getTransport("smtps");
		tr.connect(host, username, password);
		tr.sendMessage(msg, msg.getAllRecipients());
		tr.close();
		
		return "1";
		
	}
	
	
	
	
	
	
	

}
