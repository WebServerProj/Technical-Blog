<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Magazine"%>
<%@ page import="dao.MagazineRepository"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String filename="";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
	
	//데이터베이스와 연동해서 가져오는 코드 작성대기
	String magazineID;
	String magTitle;
	String magTag;
	String magContent;
	
	Magazine newMag = new Magazine();
	//newMag.setTitle(magTitle);
	//newMag.setCategory(category);
	//newMag.setDescription(magContent);
	
%>