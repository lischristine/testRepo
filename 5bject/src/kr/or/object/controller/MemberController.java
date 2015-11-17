package kr.or.object.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.object.service.MemberService;
import kr.or.object.validator.MemberValidator;
import kr.or.object.vo.Members;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService service;

	@RequestMapping("/main.do")
	public String main() {
		return "/WEB-INF/script/main.jsp";
	}
	
	@RequestMapping(value="/register_form_validate.do", method=RequestMethod.POST)
	public String registerValidate(@ModelAttribute Members member, Errors errors) {
		MemberValidator validate = new MemberValidator();

		validate.validate(member, errors);

		System.out.printf("Total Error Count [ %d ]\n", errors.getErrorCount());

		if ( errors.hasErrors() ) {
			return "/WEB-INF/script/login/register_form_validate.jsp";
		}

		System.out.printf("EmailAddress[ %s ] EmailId[ %s ]\n",
											member.getEmailAddress(), member.getEmailId());

		service.insertMember(member);

		// return "/WEB-INF/script/login/register_success.jsp";
		return "/member/register_success.do";
	}
	
	@RequestMapping("/login.do")
	public String login(HttpSession session, @RequestParam String id, @RequestParam String password) {
		// 로그인 체크 - 모델 요청
		// 성공 : HttpSession에 로그인 여부 체크할 Attribute를 binding
		// login = service.findMemberById(id);	// 회원의 정보가 넘어온다.
		Members login = service.findMemberById(id);
		
		if ( login != null ) {
			if ( id.equals(login.getId()) && password.equals(login.getPassword()) ) {
				session.setAttribute("id", id);
				session.setAttribute("member", login);
			}
		} else {
			String error = "아이디 또는 비밀번호를 확인하세요.";
			
			session.setAttribute("error", error);
		}
		return "/WEB-INF/script/main.jsp";
	}
	
	@RequestMapping("update_form.do")
	public void update(HttpSession session, Members member) {
		service.updateMemberById(member);
	}
	
/*	@RequestMapping(value= "login.do", method = RequestMethod.POST)
	public String login(HttpSession session, @RequestParam String id, @RequestParam String password, Errors errors){
		//이동할 url
		String url = "";

	    
		Map <String, String> map = new HashMap <String, String>();
        map.put("id", id);
        map.put("password", password);
        
        System.out.println(id);
        
        MemberValidator validate = new MemberValidator();
        validate.validate2(map, errors);
        
		if(errors.hasErrors()){
			 url = "/main.jsp";
		}else{	
			session.setAttribute("id", id);
			session.setAttribute("loginFlag", "로그인이 되셨습니다.");
			url = "/WEB-INF/login/login_success.jsp";
		}
		return url;
	}*/
	
	
	
/*	@RequestMapping("login.do")
	public String login2(HttpSession session, @RequestParam String id, @RequestParam String password, Errors errors){
		//이동할 url
		String url = "";
		//DB랑 연동하여 해당 아이디와 연결하여 검사
		Members login = service.findMemberById(id);
		
		Map <String, String> map = new HashMap <String, String> ();
        map.put("id", id);
        map.put("password", password);
        
		if(id.equals(login.getId())&&password.equals(login.getPassword())){
			session.setAttribute("id", id);
			session.setAttribute("loginFlag", "로그인이 되셨습니다.");
			url = "/WEB-INF/login/login_success.jsp";
		}else{	
			//실패했을 시 main이 그냥 뜬다. 
	        MemberValidator validate = new MemberValidator();
	        validate.validate2(map, errors);
			url = "/main.jsp";
		}
		return url;
	}*/
}
