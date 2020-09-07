<%-- 
    Document   : searchedBeers
    Created on : 12 Mar 2020, 18:52:50
    Author     : hyoku
--%>



<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <title><spring:message code="searchedBeers.title" /></title>
    </head>
    <body>
        <div class="container">
        <h2><spring:message code="searchedBeers.header" /></h2>
        <br>
            <div class="table-responsive">     
            <table class="table">
           
            <thead>
            <tr>

            <th align="left"><spring:message code="searchedBeers.id" /></th>
            <th align="left"><spring:message code="searchedBeers.name" /></th>
            <th align="left"><spring:message code="searchedBeers.abv" /></th>
            <th align="left"><spring:message code="searchedBeers.ibu" /></th>
            <th align="left"><spring:message code="searchedBeers.buyPrice" /></th>
            <th align="left"><spring:message code="searchedBeers.sellPrice" /></th>
            <th align="left"><spring:message code="searchedBeers.action" /></th>
            </tr>
            </thead>
            
            <tbody>
            <c:forEach items="${beerList}" var="beer"> 
                <tr>
                    <td>${beer.id}</td>
                    <td>${beer.name}</td>
                    <td>${beer.abv}</td>
                    <td>${beer.ibu}</td>
                    <td><fmt:formatNumber value="${beer.buyPrice}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/> </td>
                    <td><fmt:formatNumber value="${beer.sellPrice}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/> </td>      
                    <td><a href="/A1CRudV2/main/beerDetailsDropdown/${beer.id}">Drill Down<a> </td>
                         
                </tr>
            </c:forEach>
            </tbody>    
            <tfoot>

             </tfoot>
            </table>
        </div>
        </div>
    </body>

</html>

