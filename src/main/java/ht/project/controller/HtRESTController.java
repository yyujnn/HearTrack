package ht.project.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import ht.project.entity.Comment;
import ht.project.entity.Community;
import ht.project.entity.Likes;
import ht.project.mapper.HtMapper;

@RestController
public class HtRESTController {
	@Autowired
	private HtMapper mapper;

	// 커뮤니티 좋아요
	@RequestMapping(value = "/postLike", method = { RequestMethod.POST, RequestMethod.GET })
	public Community postLike(@RequestParam(value = "p_num", required = false) Integer p_num,
			@RequestParam(value = "likes", required = false) Integer likes,
			@RequestParam(value = "action", required = false) Integer action, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");

		System.out.println("누른 id :" + user_id);

		System.out.println("받아온like " + p_num + likes);
		System.out.println("받아온 action: " + action);

		if (action != null) {
			if (action == 1) {
				mapper.insertLike(p_num, user_id);
			} else if (action == -1) {
				mapper.deleteLike(p_num, user_id);
			}
		}

		mapper.updateLikes(p_num, likes);

		Community community = new Community();
		community.setP_num(p_num);
		community.setLikes(likes);

		System.out.println("update된 like의" + p_num + likes);

		return community;
	}
	
	// 초기 좋아요 띄우기
	@RequestMapping(value = "/likeStatus", method = { RequestMethod.POST, RequestMethod.GET })
	public ArrayList<Likes> likeStatus(HttpSession session) {

		String user_id = (String) session.getAttribute("user_id");
		ArrayList<Likes> likeStatus = mapper.likeStatus(user_id);

		System.out.println("좋아요 상태" + likeStatus);
		return likeStatus;

	}

	// 댓글 등록
	@RequestMapping("/commentReg")
	public ArrayList<Comment> commentReg(Comment comm) { // content 와 p_num

		System.out.println("ajax에서 넘어온 내용과 p_num >>" + comm);

		mapper.commentReg(comm);

		ArrayList<Comment> commRes = mapper.commentShow(comm);

		System.out.println("select p_num 해당되는 댓글들 >> " + commRes);

		return commRes;

	}

	// 초기 댓글리스트 띄우기
	@RequestMapping("/getComments")
	public ArrayList<Comment> getComments() {

		ArrayList<Comment> commRes = mapper.initialComm(); // Comment를 select all -> commRes
		System.out.println("맨 처음 띄울 댓글 객체 select all >> " + commRes);

		return commRes;
	}

	
	// 파일 첨부
	private String uploadFolder = "C:\\Users\\smhrd\\Desktop\\user_ecg";

	@RequestMapping(value = "/upload", method = { RequestMethod.POST, RequestMethod.GET })
	public String uploadFile(@RequestParam("file") MultipartFile file) {

		if (file.isEmpty()) {
			return "업로드할 파일이 없습니다.";
		}

		try {
			System.out.println("saveFile 메서드 실행됨.");
			String fileName = FilenameUtils.getBaseName(file.getOriginalFilename());
			String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename());
			String generatedFileName = fileName + "." + fileExtension;

			Path targetLocation = Paths.get(uploadFolder, generatedFileName);
			Files.createDirectories(targetLocation.getParent()); // 폴더 생성
			Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);
			System.out.println("1." + fileName);
			System.out.println("2." + fileExtension);
			System.out.println("3." + generatedFileName);

			return "SUCCESS!!!";
		} catch (IOException e) {
			e.printStackTrace();
			return "FAIL!!";
		}
	}

}
