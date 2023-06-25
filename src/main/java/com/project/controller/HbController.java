package com.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.entity.Community;
import com.project.entity.Health;
import com.project.entity.Users;
import com.project.mapper.HbMapper;

@Controller
public class HbController {

	@Autowired
	HbMapper mapper;

	@RequestMapping("/login")
	public String login() {

		return "login";
	}

	@PostMapping("/index")
	public String main(Users vo, HttpSession session, Model model) {

		System.out.println(vo.getId());

		Users us = mapper.login(vo);

		if (us != null) {

			if (vo.getId().equals("admin")) {
				
				 ArrayList<Users> userlist = mapper.getUserList();
	        	 model.addAttribute("userlist", userlist);
	        	 
			
				return "register"; // admin인 경우 register 페이지로 리다이렉트
			} else {
				session.setAttribute("id", vo.getId());
				return "index"; // 다른 사용자인 경우 index 페이지로 이동
			}
		} else {
			return "redirect:/login"; // 로그인 실패 시 login 페이지로 리다이렉트
		}
	}

	@RequestMapping("/care")
	public String care(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		System.out.println("로그인 아이디: " + id);

		ArrayList<Health> result = mapper.care(id);
		model.addAttribute("result", result);

		System.out.println("로그인 아이디: " + id);
		System.out.println("건강정보: " + result);

		return "care";
	}
	
	 @RequestMapping("/userInfo")
	   public String userInfo(Users vo, Model model) {
		  
		   ArrayList<Health> result = mapper.care(vo.getId());
		   model.addAttribute("result", result);
		   
		  ArrayList<Community> list = mapper.userCom(vo.getId());
		  model.addAttribute("comlist", list);
		   
		   return "userInfo";
	   }
	
	
	

}
