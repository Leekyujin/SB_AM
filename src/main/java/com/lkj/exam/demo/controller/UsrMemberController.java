package com.lkj.exam.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lkj.exam.demo.service.MemberService;
import com.lkj.exam.demo.util.Ut;
import com.lkj.exam.demo.vo.Member;
import com.lkj.exam.demo.vo.ResultData;

@Controller
public class UsrMemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public ResultData doJoin(String loginId, String loginPw, String name,
			String nickname, String cellphoneNum, String email) {
		
		if (Ut.empty(loginId)) {
			return ResultData.from("F-3", Ut.f("아이디를 입력해주세요."));
		}
		if (Ut.empty(loginPw)) {
			return ResultData.from("F-4", Ut.f("비밀번호를 입력해주세요."));
		}
		if (Ut.empty(name)) {
			return ResultData.from("F-5", Ut.f("이름을 입력해주세요."));
		}
		if (Ut.empty(nickname)) {
			return ResultData.from("F-6", Ut.f("닉네임을 입력해주세요."));
		}
		if (Ut.empty(cellphoneNum)) {
			return ResultData.from("F-7", Ut.f("전화번호를 입력해주세요."));
		}
		if (Ut.empty(email)) {
			return ResultData.from("F-8", Ut.f("이메일을 입력해주세요."));
		}
		
		int id = memberService.join(loginId, loginPw, name, nickname, cellphoneNum, email);
		// resultCode
		// msg
		// data1

		if (id == -1) {
			return ResultData.from("F-1", Ut.f("%s은(는) 이미 사용중인 아이디입니다.", loginId));
		}
		
		if (id == -2) {
			return ResultData.from("F-2", Ut.f("이미 사용중인 이름(%s)과 이메일(%s)입니다.", name, email));
		}
		
		Member member = memberService.getMemberById(id);
		
		return ResultData.from("S-1", Ut.f("%s 회원님 환영합니다.", name), member);
	}

}
