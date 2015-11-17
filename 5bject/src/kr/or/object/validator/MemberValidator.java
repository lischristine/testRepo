package kr.or.object.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.or.object.service.MemberService;
import kr.or.object.vo.Members;

public class MemberValidator implements Validator {
	@Autowired
	private MemberService service;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.isAssignableFrom(Members.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		if ( !supports(target.getClass()) ) {
			errors.reject("notsupport", "적절하지 않은 객체입니다.");
		}

		Members member = (Members)target;

		if ( member.getId()==null || member.getId().trim().length() < 8 ) {
			errors.rejectValue("id", "required", new Object[]{"id"}, "8글자 이상되어야합니다.");
		}
		
		if ( member.getPassword()==null || member.getPassword().trim().isEmpty() ) {
			errors.rejectValue("password", "required", new Object[]{"password"}, "password를 입력해주세요.");
		}
		
		if ( member.getMonth().equals("선택하세요") ) {
			errors.rejectValue("month", "birth", "정확하게 설정해주세요.");
		}
		
		if ( member.getDay() == 0 ) {
			errors.rejectValue("day", "birth", "정확하게 설정해주세요.");
		}
		
		if ( member.getEmailAddress() == "선택하세요" ) {
			errors.rejectValue("emailAddress", "emailAddress", "이메일을 정확하게 선택하여 주세요");
		}
		
		if ( member.getEmailId() == null ) {
			errors.rejectValue("emailId", "emailId", "이메일을 정확하게 입력하여 주세요");
		}	
	}
	
	/*	NOT_USED	*/
	/*
	public void validate2(Object target, Errors errors){
		
		if(!supports(target.getClass())){
			errors.reject("notsupport", "적절하지 않은 객체입니다.");
		}
		Members member = (Members)target;
		Members login=service.findMemberById(member.getId());
		
		if(member.getId()==null){
			errors.rejectValue("id", "idChecked", new Object[]{"id"}, "8글자 이상되어야합니다.");
		}if(member.getId()!=login.getId()){
			errors.rejectValue("id", "idChecked2", new Object[]{"id"}, "8글자 이상되어야합니다.");
		}if(member.getPassword()==null||member.getId()!=login.getPassword()){
			errors.rejectValue("password","passwordCheck", new Object[]{"password"}, "password를 입력해주세요.");
		}
	}
	*/
}