<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String, Object>> memList = null;
	memList = (List<Map<String, Object>>)request.getAttribute("memList");
	
	System.out.println(memList.size());
	Gson g = new Gson();
	String result = g.toJson(memList);
	System.out.println("------------------------------------");
	System.out.println(result);
	System.out.println("------------------------------------");
	out.print(result);
	
%>