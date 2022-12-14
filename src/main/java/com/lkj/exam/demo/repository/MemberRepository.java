package com.lkj.exam.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;

import com.lkj.exam.demo.vo.Member;

@Mapper
public interface MemberRepository {

	public void join(String loginId, String loginPw, String name, String nickname, String cellphoneNum, String email);

	public int getLastInsertId();

	public Member getMemberById(int id);

	public Member getMemberByLoginId(String loginId);

	public Member getMemberByNameAndEmail(String name, String email);

	public void modify(int id, String loginPw, String name, String nickname, String cellphoneNum, String email);

	public List<Member> getForPrintMembers();

	public int getMembersCount();

	public void deleteMember(int id);

}
