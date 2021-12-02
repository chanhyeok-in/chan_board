package com.spring.board.dao;
 
import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.board.dto.MemberDto;
 
@Repository
public class MemberDao {
 
    @Resource(name = "sqlSession")
    private SqlSession sqlSession;
 
    private static final String NAMESPACE = "com.spring.board.memberMapper";
 
    public int insertMember(MemberDto memberDto) throws Exception { 
        return sqlSession.insert(NAMESPACE + ".insertMember", memberDto);
    }
    
    public int checkMember(MemberDto memberDto) throws Exception { 
    	System.out.println(memberDto.getUSER_ID()+"여기까진도미");
        return sqlSession.selectOne(NAMESPACE + ".checkMember", memberDto);
    }
    
    public int emailVaild(MemberDto memberDto) throws Exception { 
        return sqlSession.update(NAMESPACE + ".emailVaild", memberDto);
    }
}