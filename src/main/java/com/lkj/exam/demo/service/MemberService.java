package com.lkj.exam.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lkj.exam.demo.repository.MemberRepository;
import com.lkj.exam.demo.util.Ut;
import com.lkj.exam.demo.vo.Member;
import com.lkj.exam.demo.vo.ResultData;

@Service
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;
	
	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	public ResultData<Integer> join(String loginId, String loginPw, String name, String nickname,
			String cellphoneNum, String email) {
		// 로그인아이디 중복체크
		Member existsMember = getMemberByLoginId(loginId);
		
		if (existsMember != null) {
			return ResultData.from("F-7", Ut.f("%s은(는) 이미 사용중인 아이디입니다.", loginId));
		}
		
		// 이름 + 이메일 중복체크
		existsMember = getMemberByNameAndEmail(name, email);
		
		if (existsMember != null) {
			return ResultData.from("F-8", Ut.f("이미 사용중인 이름(%s)과 이메일(%s)입니다.", name, email));
		}
		
		memberRepository.join(loginId, loginPw, name, nickname, cellphoneNum, email);
		int id = memberRepository.getLastInsertId();
		
		return ResultData.from("S-1", "회원가입이 완료되었습니다.", id);
	}

	private Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name, email);
	}

	private Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}

	public ResultData login(String loginId, String loginPw) {
		Member existsMember = getMemberByLoginId(loginId);
		
		if (existsMember == null) {
			return ResultData.from("F-3", Ut.f("%s은(는) 존재하지 않는 아이디입니다.", loginId));
		}
		
		if (existsMember.getLoginPw().equals(loginPw) == false) {
			return ResultData.from("F-4", "비밀번호를 확인해주세요.");
		}
		
		return ResultData.from("S-1", "%s님 환영합니다.", (String)existsMember.getName());
	}
	
}
