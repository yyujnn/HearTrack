package ht.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ht.project.entity.Community;
import ht.project.entity.Health;
import ht.project.entity.User;
import ht.project.mapper.HtMapper;

@Controller
public class HtController {

	@Autowired
	HtMapper mapper;

	@RequestMapping("/login")
	public String login() {

		return "login";
	}

	@PostMapping("/index")
	public String main(User vo, HttpSession session, Model model) {

		System.out.println(vo.getUser_id());

		User us = mapper.login(vo);

		if (us != null) {

			if (vo.getUser_id().equals("admin1")) {
				
				 ArrayList<User> userlist = mapper.getUserList();
	        	 model.addAttribute("userlist", userlist);
	        	 
			
				return "register"; // admin인 경우 register 페이지로 리다이렉트
			} else {
				session.setAttribute("user_id", vo.getUser_id());
				return "index"; // 다른 사용자인 경우 index 페이지로 이동
			}
		} else {
			return "redirect:/login"; // 로그인 실패 시 login 페이지로 리다이렉트
		}
	}

	@RequestMapping("/care")
	public String care(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		System.out.println("로그인 아이디: " + user_id);

		ArrayList<Health> result = mapper.care(user_id);
		model.addAttribute("result", result);

		System.out.println("로그인 아이디: " + user_id);
		System.out.println("건강정보: " + result);

		return "care";
	}
	
	 @RequestMapping("/userInfo")
	   public String userInfo(User vo, Model model) {
		  
		   ArrayList<Health> result = mapper.care(vo.getUser_id());
		   model.addAttribute("result", result);
		   
		  ArrayList<Community> list = mapper.userCom(vo.getUser_id());
		  model.addAttribute("comlist", list);
		   
		   return "userInfo";
	   }
	
	
	

}
