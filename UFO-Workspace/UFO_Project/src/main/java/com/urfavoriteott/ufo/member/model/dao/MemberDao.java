package com.urfavoriteott.ufo.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.urfavoriteott.ufo.member.model.vo.Member;


@Component
public class MemberDao {

	/**
	 * 로그인용 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @param m : 로그인할 사용자의 계정
	 * @return
	 */
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
		
	}
	
	/**
	 * 회원가입용 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @param m : 회원가입할 사용자의 계정
	 * @return
	 */
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int nicknameCheck(SqlSessionTemplate sqlSession, String checkNickname) {
		
		return sqlSession.selectOne("memberMapper.nicknameCheck", checkNickname);
	}
	
	/**
	 * 아이디 중복체크용 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @param checkId : 중복체크할 사용자의 아이디
	 * @return
	 */
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
		
	}
	
	/**
	 * 비밀번호 재설정 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @param m : 비밀번호 재설정할 사용자 정보
	 * @return
	 */
	public int passwordUpdate(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.passwordUpdate", m);
	}
	
	/**
	 * 사용자 - 회원 정보 수정용 메소드 - 작성자 : 장희연
	 * @param sqlSession
	 * @param m : 사용자의 수정할 회원 정보(아이디, 회원번호, 프로필, 닉네임)
	 * @return
	 */
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	/**
	 * 사용자 - 회원 탈퇴 처리용 메소드 - 작성자 : 장희연 
	 * @param sqlSession
	 * @param userNo : 로그인한 사용자(탈퇴할 회원)의 회원 번호
	 * @return
	 */
	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.update("memberMapper.deleteMember", userNo);
	}
}
