<%-- 
    Document   : beerDetailsDropdown
    Created on : 14 Mar 2020, 23:43:04
    Author     : hyoku
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
       

        <title><spring:message code="drilldown.title" /></title>
    </head>
    <body>
        <div class="container">
        <h2><spring:message code="drilldown.header" /></h2>
        <br>
            <div class="table-responsive">     
            <table class="table">
              
                <tr><td><spring:message code="drilldown.id" />      </td> <td>${beer.id}</td></tr>
                <tr><td><spring:message code="drilldown.name" />    </td> <td>${beer.name}</td></tr>
                <tr><td><spring:message code="drilldown.abv" />     </td> <td>${beer.abv}</td><tr>    
                <tr><td><spring:message code="drilldown.buyprice" /></td> <td><fmt:formatNumber value="${beer.buyPrice}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/> </td></tr>
                <tr>
                <td><spring:message code="drilldown.sellprice" /></td>
                    <td><fmt:formatNumber type="currency" currencySymbol="&euro;" maxFractionDigits="2" value="${beer.sellPrice}" />
                          <button onclick="showForm()"><spring:message code="drilldown.sellingPricePercentage.label" /></button>
                        <form action="/A1CRudV2/main/sellPriceUpdate" method="POST" id="formElement" style="display: none;" />
                         
                      
                            <input type="text" name="id" hidden="true" value="${beer.id}">
                            <select name = "option">
                                <option value="increasing"><spring:message code="drilldown.option.increase" /></option>
                                <option value="decreasing"><spring:message code="drilldown.option.decrease" /></option>
                            </select>
                            <br>
                            <input type="text" name="percentage" size="1" required="true" >
                            <input type="text" name="price" hidden="true" value="${beer.sellPrice}">
                            <input type="submit" value="<spring:message code="drilldown.updateSellprice.button" />">
                        </form>
                    </td>
                    
                    
                    
                </tr>
             
                <tr><td><spring:message code="drilldown.lastmod" />   </td> <td>${beer.lastMod}</td><tr>
                <tr><td><spring:message code="drilldown.description" />:</td> <td>${beer.description}</td><tr>
                <tr><td><spring:message code="drilldown.image" />      </td> <td><img src="/A1CRudV2/assets/${beer.image}" width="50" height="50" /> </td></tr>
                <tr><td><spring:message code="drilldown.style" />      </td> <td>${style.styleName}</td></tr>
                <tr><td><spring:message code="drilldown.category" />   </td> <td>${category.catName}</td></tr>
            </table>
        </div>
        </div>
    </body>

</html>

    <script type="text/javascript">
        function showForm() {
            document.getElementById('formElement').style.display = 'block';
        }
        
        
        $(document).ready(function() {
             $('#example').DataTable();
        } );
        
    </script>
