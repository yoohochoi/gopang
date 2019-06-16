package Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class MainCoroller {
	
	//메인페이지 이동
	@RequestMapping(value="/home/home.do", method = RequestMethod.GET)
	public String mainhome(HttpServletRequest request, HttpServletResponse response) throws Exception{
		return "home/homepage";
	}

}
