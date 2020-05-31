package com.mvc2;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class MemberDao2 {
	Logger logger = Logger.getLogger(MemberLogic.class);
	SqlSessionFactory sqlMapper = null;
	
	///////마이바티스를 공통코드로 처리하기
	public MemberDao2() {
		sqlMapper = MyBatisCommonFactory.getSqlSessionFactory();
	}
	
	public String login(Map<String, Object> pMap) {
		String s_name = null;
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			s_name = (String)sqlSes.selectOne("login_t", pMap);
			System.out.println("s_name: " + s_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s_name;
	}

	public List<Map<String, Object>> memberList(Map<String, Object> pMap) {
		logger.info("MemberDao memberList() 호출 성공");
		List<Map<String, Object>> memList = null;
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			memList = sqlSes.selectList("memList", pMap);
			logger.info("memList.size() : " + memList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memList;
	}
	
	public int memberInsert(Map<String, Object> pMap) {
		logger.info("memInsert 호출 성공");
		int insertResult = 0;
		try {
			SqlSession sqlSes = sqlMapper.openSession(true);
			sqlSes.selectOne("memInsert", pMap);
		//	insertResult = Integer.parseInt(sqlSes.selectOne("memInsert", pMap).toString());
			System.out.println("insertResult: " + insertResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertResult;
	}
	
}
