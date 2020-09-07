<%-- 
    Document   : searchBeers
    Created on : 11 Mar 2020, 10:20:13
    Author     : hyoku
--%>

<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <title><spring:message code="searchedBeers.title"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    </head>
    <body>
        <div class="container">
            <h2><spring:message code="searchedBeers.header"/></h2>

            <form method="POST" action="/A1CRudV2/main/searchedBeers">

                Beer name: <input type="text" name="name" >

                <input type="submit" value="Submit"/>

            </form>
        </div>
    </body>
    
	
</html>