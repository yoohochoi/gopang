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
	
	//로그인 페이지 이동
	@RequestMapping("/user/UserLogin.do")
	public String login() throws Exception{
		return "user/UserLogin";
	}
	
	//회원가입페이지이동
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
	
	//회원가입
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
	
	//로그인
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
	
	//로그아웃
	@RequestMapping("/user/logout.do")
	public String userlogout(HttpSession session) throws Exception{
		session.invalidate();
		return "/home/homepage";
	}
	
	//회원 정보 리스트 페이지
	@RequestMapping("/user/userList.do")
	public String userList(Model model) throws Exception{
		
		List<UserVO> list = userservice.userList();
		
		model.addAttribute("list", list);
		
		return "/user/userListPage";
	}
	
	//엑셀 다운로드
	
	// 엑셀 다운로드
	@RequestMapping("/user/excelDowm.do")
	public void excelDown(HttpServletResponse res) throws Exception{

		
		// 게시판 목록 조회
		List<UserVO> list = userservice.userList();
		
		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("게시판");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;
		
		//테이블 헤더용 스타일
		CellStyle headStyle = wb.createCellStyle();

		//가는 경계선을 가집니다.
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);
		
		//배경색은 노란색입니다.
		headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		//데이터는 가운데로 정렬합니다.
		headStyle.setAlignment(HorizontalAlignment.CENTER);
		
		//데이터용 경계 스타일 테두리만 지정
		CellStyle bodyStyle = wb.createCellStyle();
		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);
		
		//헤더 생성
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("seq");
		
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("아이디");
		
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("이름");
		
		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("이메일");
		
		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("등록 날짜");
		
		cell = row.createCell(5);
		cell.setCellStyle(headStyle);
		cell.setCellValue("포인트");
		
		//데이터 부분 생성
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
		
		//컨텐츠 타입과 파일명 지정
		res.setContentType("application/vnd.ms-excel");
		res.setHeader("Content-Disposition", "attachment;filename=test.xls");

		//엑셀 출력
		wb.write(res.getOutputStream());
		wb.close();
	}
	
	//엑셀 업로드 페이지 이동
	@RequestMapping("/user/uploadExcelPage.do")
	public String uploadExcelPage() {
		return "/user/uploadExcelPage";
	}
	
	//엑셀 업로드
	@ResponseBody
	@RequestMapping(value="/user/excelUploadAjax.do", method = RequestMethod.POST)
	public String excelUploadAjax(MultipartHttpServletRequest req) throws Exception{
		
		MultipartFile excelFile = req.getFile("excelFile");
		System.out.println("엑셀 파일 업로드");
		
		if(excelFile == null || excelFile.isEmpty()) {
			return "2";
		}
		
		
		return null;
	}
	
	//비밀번호 찾기 페이지 이동
	@RequestMapping("/user/findPassword.do")
	public String findPassword() throws Exception{
		return "/user/findPasswordPage";
	}
	
	
	//메일 발송
	@ResponseBody
	@RequestMapping("/user/emailAuth.do")
	public String emailAuth(HttpServletRequest req, Model model, String email) throws Exception {
		
		UserVO vo = userservice.finduseremail(email);
		if(vo == null) {
			return "2";
		}
		//메일 관련 정보
		String host = "smtp.gmail.com";
		String username = "kkymg92@gmail.com";
		String password = "jtvvjmyzaqsffgdf";
		
		//메일 내용
		String recipient = email;
		String subject = "임시 비밀번호 입니다.";
		String uuid = null;
		
		for(int i=0; i<5; i++) {
			uuid = UUID.randomUUID().toString().replaceAll("", "");
			uuid = uuid.substring(0, 10);
		}
		
		String body = "당신의 임시 비밀번호는 " + uuid + " 입니다.";
		
		vo.setPassword(Base64Encoder.encode(uuid));
		userservice.updateUser(vo);
		
		
		
		//properties 설정
		Properties props = new Properties();
		props.put("mail.smtps.auth", "true");
		
		//메일 세션
		Session session = Session.getDefaultInstance(props);
		MimeMessage msg = new MimeMessage(session);
		
		//매일 관련
		msg.setSubject(subject);
		msg.setText(body);
		msg.setFrom(new InternetAddress(username));
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		
		//발송처리
		Transport tr = session.getTransport("smtps");
		tr.connect(host, username, password);
		tr.sendMessage(msg, msg.getAllRecipients());
		tr.close();
		
		return "1";
		
	}
	
	
	
	
	
	
	

}
