package com.mvc2;

import org.apache.log4j.Logger;

public class ControllerMapper {				//member/memberList.jsp
	public static Controller getController(String command, String crud) { //crud = ins, upd, del, sel 라고 설계함.
		Logger logger = Logger.getLogger(ControllerMapper.class); 
		logger.info("command: " + command + ", crud: " + crud);
		Controller controller = null;
		//Controller controller = new Controller(); -> 인터페이스 이므로 이렇게 인스턴스화는 불가하다.
		String commands[] = command.split("/");
		//배열이 오는 이유는 첫번째 방에는 업무가 온다 - member, order, price, 등등.. -> 이것이 work   두번째 방에는 그 업무이름이 온다. -> 이것이 밑에 있는 requestName
		for(String str : commands) {
			logger.info("str: " + str);
		}
		if(commands.length == 2) {
			//work와 requestName은 잊으면 안된다.
			String work = commands[0]; //첫번째 방에는 업무가 담긴다. 
			String requestName = commands[1]; //두번째 방에는 업무 이름이 담긴다.
			if("member".equals(work)) { //member에 담겨있는 것을 비교.
				controller = new MemberController(crud);
			}
		}
		return controller;
	} //end of Controller
}
