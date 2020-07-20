package com.compHuman.demo;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FrontController {

	public String uname = "";
	public String password = "";
	
	

	@RequestMapping("/")
	String login(Model model) {
		System.out.println("loginPage method");

		return "login";
	}

	@RequestMapping("/hi")
	String welcome(@RequestParam String username, @RequestParam String pass) {

		uname = username.toString().trim().toLowerCase();
		password = pass.toString().trim().toLowerCase();
		System.out.println("welcome" + username + " " + pass);
		return null;

	}



	@RequestMapping("/logout")
	String logout() {
		System.out.println("logout called method");
		uname = "";
		password = "";
		return "login";
	}

	@RequestMapping(value = "/ValidateLogin", method = RequestMethod.POST)
	public String method(HttpServletResponse httpServletResponse) {
		httpServletResponse.setHeader("Location", "http://localhost:8080/p");
		httpServletResponse.setStatus(302);
		return "true";
	}

}
