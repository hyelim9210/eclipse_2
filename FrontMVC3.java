package com.mvc2;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class FrontMVC3 extends HttpServlet {
	Logger logger = Logger.getLogger(FrontMVC3.class);
	public void doService(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doService 호출성공");
		// ==> dev_jsp/member/memberList.mvc2
		String requestURI = req.getRequestURI();//  /member/memberList.jsp
		logger.info("requestURI 호출성공: " + requestURI);
		// ==> dev_jsp
		String contextPath = req.getContextPath();   //
		logger.info("contextPath 호출성공: " + contextPath);
		// ==> /member/memberList.mvc2					
		String command = requestURI.substring(contextPath.length()+1);  // member/memberList.jsp => 어떤 경로로 타는지는 폴더이름으로 결정함 - member
		Controller controller = null;
		logger.info("command 호출성공: " + command);
		String crud = null;
		crud = req.getParameter("crud");
		logger.info("crud: " + crud);
		//insert here - 인스턴스화 and process call
		try {
			controller = ControllerMapper.getController(command, crud);///목적지 설정
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(controller instanceof MemberController) {///설정된 목적지로 보내기  , instanceof : 객체타입 확인.  
			logger.info("MemberController 타입이면 회원관리 업무임.");
			String path = controller.process(req, res);
			String pageMove[] = null;
			pageMove = path.split(":");
			for(int i=0; i<pageMove.length; i++) {
				logger.info("pageMove: " + pageMove[i]);
			}
			if(pageMove != null) {
				String path2 = pageMove[1];
				if("redirect".equals(pageMove[0])) {
					res.sendRedirect(path2);
				}
				else {
					RequestDispatcher view = req.getRequestDispatcher(path2);
					req.getAttribute("memList");
					view.forward(req, res);//페이지이동
				}
			}
		}
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doGet 호출성공");
		doService(req,res);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doPost 호출성공");
		doService(req,res);
	}
}
