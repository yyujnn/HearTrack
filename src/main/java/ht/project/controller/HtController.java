package ht.project.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ht.project.entity.Community;
import ht.project.entity.Ecg;
import ht.project.entity.Health;
import ht.project.entity.User;
import ht.project.mapper.HtMapper;

@Controller
public class HtController {

	@Autowired
	HtMapper mapper;

	// login 페이지로 이동
	@RequestMapping("/login")
	public String login(@RequestParam(required = false) String returnUrl, HttpSession session) {
		// returnUrl을 세션에 저장
		if (returnUrl != null && !returnUrl.isEmpty()) {
			session.setAttribute("returnUrl", returnUrl);
		}
		return "login";
	}

	// 로그인 프로세스 (로그인 로직)
	@RequestMapping("/loginProcess")
	public String loginProcess(@ModelAttribute("user") User user, HttpSession session) {
		User loginUser = mapper.login(user);
		mapper.access(user);
		if (loginUser != null) {
			session.setAttribute("user_id", loginUser.getUser_id());
			// returnUrl을 세션에서 읽어와서 리다이렉트합니다.
			String returnUrl = (String) session.getAttribute("returnUrl");
			if (returnUrl != null && !returnUrl.isEmpty()) {
				session.removeAttribute("returnUrl"); // 사용 후 세션에서 해당 정보를 제거
				return "redirect:" + returnUrl;
			}
			// 로그인 후 기본 페이지로 이동합니다.
			return "redirect:/index";
		}
		// 로그인 실패 시 로그인 페이지로 리다이렉트합니다.
		return "redirect:/login";
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		// 세션에서 로그인 정보를 제거합니다.
		session.removeAttribute("user_id");
		// 세션을 완전히 무효화하여 초기화합니다.
		session.invalidate();
		// 로그아웃 후 리다이렉트할 페이지를 지정합니다.
		return "redirect:/index";
	}

	// 회원가입 기능 - db에 insert
	@RequestMapping("/join")
	public String join(User vo) {

		System.out.println("회원가입 user " + vo);
		mapper.join(vo);

		return "redirect:/login";
	}

	// 메인 페이지
	@RequestMapping("/index")
	public String hearTrack(HttpSession session) {

		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			// 로그인이 되어 있는 경우
			System.out.println("인덱스 userid : " + user_id);
		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("인덱스: 로그인되어 있지 않음");
		}
		return "index";
	}

	// 커뮤니티 페이지
	@RequestMapping("/community")
	public String community(HttpSession session, Model model, Community vo) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			// 로그인이 되어 있는 경우
			System.out.println("커뮤니티 userid : " + user_id);
			User userInfo = mapper.getUserInfo(user_id);
			model.addAttribute("userInfo", userInfo);
		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("커뮤니티: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/community";
		}

		// 커뮤니티 페이지 로직 처리 (리스트 출력)
		ArrayList<Community> list = mapper.getCommunityList();

		for (Community community : list) {
			User user = mapper.getUserInfo(community.getUser_id());
			community.setUser(user);
		}

		// p_num 컬럼을 내림차순으로 정렬
		list.sort(Comparator.comparingInt(Community::getP_num).reversed());

		model.addAttribute("comlist", list);

		System.out.println("comlist : " + list);

		return "community";
	}

	// 건강 기록
	@RequestMapping("/healthRecord")
	public String healthRecord(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			// 로그인이 되어 있는 경우
			System.out.println("건강기록 userid : " + user_id);
			User userInfo = mapper.getUserInfo(user_id);
			model.addAttribute("userInfo", userInfo);
			
			Ecg LatestEcg = mapper.getLatestEcg(user_id);
			Health LatestBp = mapper.getLatestBp(user_id);
			Health LatestBs = mapper.getLatestBs(user_id);

			model.addAttribute("LatestEcg", LatestEcg);
			model.addAttribute("LatestBp", LatestBp);
			model.addAttribute("LatestBs", LatestBs);
			
			ArrayList<Health> MyBpList = mapper.getMyBpList(user_id);
			ArrayList<Health> MyBsList = mapper.getMyBsList(user_id);
			ArrayList<Ecg> MyEcgList = mapper.getMyEcgList(user_id);
			
			model.addAttribute("MyBpList", MyBpList);
			model.addAttribute("MyBsList", MyBsList);
			model.addAttribute("MyEcgList", MyEcgList);
			
			
		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("건강기록: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/healthRecord";
		}

		return "healthRecord";
	}

	// ecg 검사
	@RequestMapping("/ecgCheck")
	public String ecgCheck(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			System.out.println("심전도 검사 userid : " + user_id);
		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("심전도 검사: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/ecgCheck";
		}

		return "ecgCheck";
	}

	// ecg 결과
	@RequestMapping("/ecgResult")
	public String ecgResult(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			System.out.println("심전도 결과 userid : " + user_id);
			User userInfo = mapper.getUserInfo(user_id);
			model.addAttribute("userInfo", userInfo);
			
			Ecg LatestEcg = mapper.getLatestEcg(user_id);
			model.addAttribute("LatestEcg", LatestEcg);
			
		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("심전도 결과: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/ecgResult";
		}

		return "ecgResult";
	}

	// 혈압 검사
	@RequestMapping("/bpCheck")
	public String bpCheck(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			System.out.println("혈압 검사 userid : " + user_id);
		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("혈압 검사: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/bpCheck";
		}

		return "bpCheck";
	}

	// 혈압 결과
	@RequestMapping("/bpResult")
	public String bpResult(HttpSession session, Model model, Health vo) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			System.out.println("혈압 결과 userid : " + user_id);
			vo.setUser_id(user_id);
			System.out.println(vo);
			// 사용자가 입력한 혈압 데이터 가져오기
			System.out.println("최고 혈압" + vo.getBp_high()+"최저 혈압" + vo.getBp_low());
			
			// 등록
			mapper.bpRegister(vo);

			// select 
			Health health =mapper.getLatestHealt(vo);
			System.out.println("select임"+health);
			// Model에 HealthInfo 데이터담 기
            model.addAttribute("health", health);
	

		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("혈압 결과: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/bpResult";
		}
		return "bpResult";
	}

	// 혈당 검사
	@RequestMapping("/bsCheck")
	public String bsCheck(HttpSession session, Model model) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			System.out.println("혈당 검사 userid : " + user_id);
		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("혈당 검사: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/bsCheck";
		}

		return "bsCheck";
	}

	// 혈당 결과
	@RequestMapping("/bsResult")
	public String bsResult(HttpSession session, Model model, Health vo) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id != null) {
			System.out.println("혈당 결과 userid : " + user_id);
			vo.setUser_id(user_id);
			System.out.println(vo);
			// 사용자가 입력한 혈압 데이터 가져오기
			System.out.println("공복 혈당" + vo.getBs_emp()+"식후 혈당" + vo.getBs_ful());
			
			// 등록
			mapper.bsRegister(vo);

			// select 
			Health health =mapper.getLatestHealt(vo);
			System.out.println("혈당 select임"+health);
			// Model에 HealthInfo 데이터담 기
            model.addAttribute("health", health);
	

		} else {
			// 로그인이 되어 있지 않은 경우
			System.out.println("혈압 결과: 로그인되어 있지 않음");
			return "redirect:/login?returnUrl=/bsResult";
		}
		return "bsResult";
	}

}
