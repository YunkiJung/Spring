package com.kh.airline.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.airline.member.service.AirMemberService;
import com.kh.airline.member.vo.AirMemberVO;
import com.kh.airline.member.vo.CountryVO;
import com.kh.airline.member.vo.MemImgVO;
import com.kh.airline.member.vo.MyTicketVO;

import oracle.jdbc.proxy.annotation.Post;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource(name = "airMemberService")
	private AirMemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//회원가입
	@PostMapping("/join")
	public String postJoin(AirMemberVO AirMemberVO) {
		
		memberService.insertMember(AirMemberVO);
		return "redirect:/ticket/search";
	}
	//로그인
	@PostMapping("/login")
	public String login(AirMemberVO airMemberVO, HttpSession session) {
		AirMemberVO result = memberService.login(airMemberVO);
		
		if(result != null) {
			session.setAttribute("loginInfo", result);
		}
		return "redirect:/ticket/search";
	}
	//내정보보기로 이동
	@GetMapping("/memberDetail")
	public String memDetail(Model model, AirMemberVO airMemberVO,HttpSession session) {
		String memId = ((AirMemberVO)session.getAttribute("loginInfo")).getMemId();
		airMemberVO.setMemId(memId);
		model.addAttribute("memDetail", memberService.selectMemInfo(airMemberVO));
		model.addAttribute("selectMemImg", memberService.selectMemImg(memId));
		session.removeAttribute("searchInfo");
		return "member/mem_detail";
	}
	//내정보보기 수정하기 페이지로 이동
	@GetMapping("/memDetailEdit")
	public String memDetailEdit(Model model, AirMemberVO airMemberVO) {
		model.addAttribute("memDetail", memberService.selectMemInfo(airMemberVO));
		model.addAttribute("selectMemImg", memberService.selectMemImg(airMemberVO.getMemId()));
		return "member/mem_detail_edit";
	}
	//수정한 정보 저장
	@PostMapping("/memDetailEdit")
	public String memDetailEdit(AirMemberVO airMemberVO,HttpSession session) {
		String memId = ((AirMemberVO)session.getAttribute("loginInfo")).getMemId();
		airMemberVO.setMemId(memId);
		memberService.updateMemInfo(airMemberVO);
		return "redirect:/member/memberDetail";
	}
	//아이디 찾기
	@ResponseBody
	@PostMapping("/findId")
	public void findId(AirMemberVO airMemberVO) {
		String memId = memberService.selectMemId(airMemberVO);
		
		try {
			//메일보내기
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper;
			messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("");
			messageHelper.setTo(airMemberVO.getMemEmail());
			messageHelper.setSubject("아이디입니다.");
			messageHelper.setText(memId);
			mailSender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//비밀번호 찾기
	@ResponseBody
	@PostMapping("/findPw")
	public void findPw(AirMemberVO airMemberVO) {
		String getTempPw = getTempPw();
		airMemberVO.setMemPw(getTempPw);
		memberService.updateMemPw(airMemberVO);
		try {
			//메일보내기
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper;
			messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("");
			messageHelper.setTo(airMemberVO.getMemEmail());
			messageHelper.setSubject("임시 비밀번호 입니다.");
			messageHelper.setText(getTempPw);
			mailSender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	//아이디 중복확인
	@ResponseBody
	@PostMapping("/idConfirm")
	public AirMemberVO idConfirm(AirMemberVO airMemberVO) {
		return  memberService.idConfirm(airMemberVO);
	}
	//회원가입창에 나라조회
	@ResponseBody
	@PostMapping("/selectCountry")
	public List<CountryVO> selectCountry() {
		return memberService.listCountry();
	}
	//로그 아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:/ticket/search";
	}
	//비밀번호 변경 페이지로 이동
	@GetMapping("/chPasswordPage")
	public String changePwPage(Model model,HttpSession session) {
		session.removeAttribute("searchInfo");
		
		return "member/ch_password_page";
	}
	@ResponseBody
	@PostMapping("pwConfirm")
	public boolean pwConfirm(HttpSession session, AirMemberVO airMemberVO, String currentPw) {
		String memId = ((AirMemberVO)session.getAttribute("loginInfo")).getMemId();
		airMemberVO.setMemId(memId);
		airMemberVO.setMemPw(currentPw);
		String id = memberService.selectMemPw(airMemberVO);
		if(id != null) {
			return true;
		}
		else {
			return false;
		}
	}
	//비밀번호 변경
	@PostMapping("/chPassword")
	public String chPassword(AirMemberVO airMemberVO, String newPw,HttpSession session) {
		airMemberVO.setMemPw(newPw);
		memberService.updateMemPw(airMemberVO);
		return "redirect:/member/memberDetail";
	}
	
	//임시비밀번호 지정 메소드
	public String getTempPw() {
		String lowerCase = "abcdefghijklmnopqrstuvwxyz";
		String upperCase = lowerCase.toUpperCase();
		String number = "0123456789";
		String baseStr = lowerCase + upperCase + number;
		
		//String imsiPw = "";
		StringBuilder getTempPw = new StringBuilder();		
		for (int i = 0; i < 8; i++) {
			
			int index = (int)(Math.random()* baseStr.length());
			char c = baseStr.charAt(index);
			getTempPw.append(String.valueOf(c));
		}
		return getTempPw.toString();
	}
	// 회원 이미지 저장
	@ResponseBody
	@PostMapping("/regMemImg")
	public String regMemImg(MemImgVO memImgVO, HttpSession session, MultipartHttpServletRequest multi) {
			//회원 아이디
			String memId = ((AirMemberVO)session.getAttribute("loginInfo")).getMemId();
			//회원 이미지가 있으면 삭게
			if(memberService.selectMemImg(memId) != null) {
				memberService.deleteMemImg(memId);
			}
			//이미지 통
			List<MemImgVO> memImgList = new ArrayList<MemImgVO>();
			//다음에 들어갈 IMG_CODE 값을 조회
			int nextMemImgCode = memberService.selectNextMemImgCode();
			
			//------------이미지 첨부(파일 업로드)--------------//
			
			//첨부파일이 저장될 위치 지정
			String uploadPath = "D:\\Git\\workspaceSTS\\Airline\\src\\main\\webapp\\resources\\member\\img\\";
			
			//name이 "memImg"인 input태그의 파일 정보를 가져 옴. 
			MultipartFile file = multi.getFile("memImg");
			
			//첨부하고자 하는 파일명
			String originFileName = file.getOriginalFilename();

			MemImgVO vo = new MemImgVO();
			
			if(!originFileName.equals("")) {
				//첨부할 파일명
				String attachedFileName = System.currentTimeMillis() + "_" + originFileName;
				//파일 업로드
				//매개변수로 경로 및 파일명을 넣어줌
				try {
					file.transferTo(new File(uploadPath + attachedFileName));
					vo.setMemImgCode(nextMemImgCode++);
					vo.setOriginMemImgName(originFileName);
					vo.setAttachedMemImgName(attachedFileName);
					vo.setMemId(memId);
					memImgList.add(vo);
					System.out.println(vo.getMemId());
					System.out.println(vo.getMemImgCode());
					System.out.println(vo);
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			//------------이미지 첨부 끝!!!!!!!--------------//
			
			//회원 이미지 등록
			memberService.insertMemImg(vo);
			
		return memberService.selectMemImg(memId);
	}
	
	@GetMapping("myTicket")
	public String myTicket(Model model,HttpSession session, MyTicketVO myTicketVO) {
		String memId = ((AirMemberVO)session.getAttribute("loginInfo")).getMemId();
		myTicketVO.setDepartureDate(getCurrentDateToString());
		myTicketVO.setMemId(memId);
		session.removeAttribute("searchInfo");
		model.addAttribute("ticketInfoList", memberService.selectMyTicket(myTicketVO));
		
		return "member/my_ticket";
	}
	@GetMapping("pastMyTicket")
	public String selectPastMyTicket(Model model,HttpSession session, MyTicketVO myTicketVO) {
		String memId = ((AirMemberVO)session.getAttribute("loginInfo")).getMemId();
		myTicketVO.setDepartureDate(getCurrentDateToString());
		myTicketVO.setMemId(memId);
		session.removeAttribute("searchInfo");
		model.addAttribute("ticketInfoList", memberService.selectPastMyTicket(myTicketVO));
		
		return "member/past_my_ticket";
	}
	
	public String getCurrentDateToString() {
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMddHHmmss");
		Date time = new Date();
		
		String time1 = format1.format(time);
		
		return time1;
	}
}

