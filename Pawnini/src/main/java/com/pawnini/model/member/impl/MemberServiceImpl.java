package com.pawnini.model.member.impl;

import java.util.List;

import org.bouncycastle.jcajce.provider.digest.SHA3;
import org.bouncycastle.util.encoders.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.member.MemberDTO;
import com.pawnini.model.member.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	// 패스워드 암호화
		public void securityPWD(MemberDTO dto) {
			SHA3.DigestSHA3 digestSHA3 = new SHA3.DigestSHA3(512);
			byte[] digest = digestSHA3.digest(dto.getMember_pwd().getBytes());
			String securitypwd = Hex.toHexString(digest);
			dto.setMember_pwd(securitypwd);
		}
		
		public void imsiPW(MemberDTO vo) {
			char[] charSet = new char[] { 
					'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
					'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
					'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
					'U', 'V', 'W', 'X', 'Y', 'Z' };
			int idx = 0;
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < 10; i++) {
				idx = (int) (charSet.length * Math.random());
				sb.append(charSet[idx]);
			}
			String imPW = sb.toString();
		}
	
	// 중복 체크 
	@Override
	public int checkID(MemberDTO dto) {
		return memberDAO.checkID(dto);
	}
	
	// 회원 체크
	@Override
	public int checkMember(MemberDTO dto) {
		securityPWD(dto);
		return memberDAO.checkMember(dto);
	}

	// 회원 가입
	@Override
	public void insertMember(MemberDTO dto) {
		securityPWD(dto);
		memberDAO.insertMember(dto);
	}
	
	@Override
	public void deleteMember(MemberDTO dto) {
		memberDAO.deleteMember(dto);
	}
	
	// 정보 수정
	@Override
	public void updateMember(MemberDTO dto) {
		securityPWD(dto);
		memberDAO.updateMember(dto);
	}
	// 로그인
	@Override
	public MemberDTO login(MemberDTO dto) throws Exception {
		securityPWD(dto);
		return memberDAO.login(dto);
	}
	// 회원 리스트 불러오기
	@Override
	public List<MemberDTO> getMemberList(MemberDTO dto) {
		return memberDAO.getMemberList(dto);
	}
	

}
