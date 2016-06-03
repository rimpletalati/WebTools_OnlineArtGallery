package com.neu.edu.validator;

import com.neu.edu.model.UserAccount;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class UserValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return UserAccount.class.equals(arg0);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		UserAccount user = (UserAccount) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username",
				"validate.username", "Username is Incorrect");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password",
				"validate.password", "Password Is Incorrect");
	}

}
