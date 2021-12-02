package com.spring.board.service;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.dao.MemberDao;
import com.spring.board.dto.MemberDto;
 
@Service
public class MemberService {
 
	protected final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
    private MemberDao memberDao;
 
	public MemberDto insertMember(MemberDto memberDto ) throws Exception {
		memberDao.insertMember(memberDto);
 
        return memberDto;
    }
	
	public int checkMember(MemberDto memberDto) throws Exception {
		int aaa = memberDao.checkMember(memberDto);
        return aaa;
    }
	
	public MemberDto emailVaild(MemberDto memberDto) throws Exception {
		memberDao.emailVaild(memberDto);
 
        return memberDto;
    }
    
 
    
 
    
}