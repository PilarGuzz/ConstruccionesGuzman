<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.jacaranda.models.CRUDMaterial"%>
<%@page import="com.jacaranda.models.CRUDCategory"%>
<%@page import="com.jacaranda.models.Material"%>
<%@page import="com.jacaranda.models.Category"%>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		
		
	
		String name = String.valueOf(request.getParameter("nameMaterial"));
		String description = String.valueOf(request.getParameter("descriptionMaterial"));
		int code = Integer.valueOf(request.getParameter("category"));
		Double price = Double.valueOf(request.getParameter("price"));
		
		Category cat = CRUDCategory.getCategory(code);
		Material mat = new Material(name, description, price, cat);
		
		CRUDMaterial.saveMaterial(mat);
		
		response.sendRedirect(request.getContextPath()+"/Login");
		
	%>
		
</body>
</html>