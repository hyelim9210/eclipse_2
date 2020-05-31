package com.mvc2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class MemberController  implements Controller { //Controller의 구현체 클래스 
	Logger logger = Logger.getLogger(MemberController.class);
	String crud = null;
	MemberLogic memLogic = null;
	String processResult = null;
	public MemberController(String crud) {
		this.crud = crud;
		memLogic = new MemberLogic();
	}
	MemberLogic mLogic = new MemberLogic();
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
		logger.info("process 호출 성공, crud: " + crud);
		if("login".equals(crud)) {
			String u_id = req.getParameter("mem_id");
			String u_pw = req.getParameter("mem_pw");
			Map<String, Object> pMap = new HashMap<String, Object>();
			pMap.put("mem_id", u_id);
			//pMap.put("mem_pw", u_pw);
			String s_name = memLogic.login(pMap);
			HttpSession session = req.getSession();
			session.setAttribute("s_name", s_name);
			processResult = "forward:mapDesign3.jsp";
		}
		else if("memberList".equals(crud)) {
			List<Map<String, Object>> memList = null;
			Map<String, Object> pMap = new HashMap<String, Object>();
			memList = memLogic.memberList(pMap);
			System.out.println("req.setAttribute");
			req.setAttribute("memList", memList);
			processResult ="forward:memberList.jsp";
		}
		else if("memberInsert".equals(crud)) {
			int insertResult = -1;
			Map<String, Object> pMap = new HashMap<String, Object>();
			String u_id = req.getParameter("mem_id");
			String u_pw = req.getParameter("mem_pw");
			String u_name = req.getParameter("mem_name");
			pMap.put("mem_id", u_id);
			pMap.put("mem_pw", u_pw);
			pMap.put("mem_name", u_name);
			
			insertResult = memLogic.memberInsert(pMap);
			processResult ="redirect:memberList.mvc3?crud=memberList";
		}
		return processResult;
	}
	
}
