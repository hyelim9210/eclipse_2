<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.restaurant.RestaurantDao" %>    
<%-- 스크립틀릿 - 자바코드를 쓸수 있는 땅 --%>
<%
	RestaurantDao rDao = new RestaurantDao();
	List<Map<String,Object>> mrList = rDao.mapRestList();
	Gson g = new Gson();
	String imsi = g.toJson(mrList);
	out.print(imsi);
	//out.print(mrList);
%>