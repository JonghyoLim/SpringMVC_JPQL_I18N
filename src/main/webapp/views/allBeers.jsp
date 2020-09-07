<%-- 
    Document   : allBeers
    Created on : 9 Mar 2020, 16:40:45
    Author     : hyoku
--%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<!--            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">-->
              <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
            <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css"></script>
            <script src="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"></script>
           
        <title>Display All Beers</title>
    </head>
    <body>
        
        <h1>Display All Beers</h1>
        <table id="example" class="table table-striped table-bordered" style="width:80%" >
            <thead>
            <tr>

            <th align="left">ID</th>
            <th align="left">Brewery_Id</th>
            <th align="left">name</th>
            <th align="left">Cat_Id</th>
             <th align="left">Style_Id</th>
            <th align="left">ABV</th>
            <th align="left">IBU</th>
            <th align="left">SRM</th>
            <th align="left">Add User</th>
            <th align="left">Last_mode</th>
            <th align="left">Image</th>
            <th align="left">Buy Price</th>
            <th align="left">Sell price</th>

            </tr>
            </thead>
            
            <tbody>
            <c:forEach items="${beerList}" var="beer"> 
                <tr>
                    <td>${beer.id}</td>
                    <td>${beer.breweryId}</td>
                    <td>${beer.name}</td>
                    <td>${beer.catId}</td>
                    <td>${beer.styleId}</td>
                    <td>${beer.abv}</td>
                    <td>${beer.ibu}</td>
                    <td>${beer.srm}</td>       
                    <td>${beer.addUser}</td>
                    <td>${beer.lastMod}</td>
                    <td><img src="/A1CrudV2/assets/${beer.image}" width="60" height="60" > </td>

                    <td><fmt:formatNumber value="${beer.buyPrice}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/> </td>
                    <td><fmt:formatNumber value="${beer.sellPrice}" type="currency" currencySymbol="&euro;" maxFractionDigits="2"/> </td>
                                
                </tr>
            </c:forEach>
            </tbody>    
            <tfoot>
            <tr>
                <th align="left">ID</th>
                <th align="left">Brewery_Id</th>
                <th align="left">name</th>
                <th align="left">Cat_Id</th>
                <th align="left">ABV</th>
                <th align="left">IBU</th>
                <th align="left">SRM</th>
                <th align="left">Add User</th>
                <th align="left">Last_mode</th>
                <th align="left">Image</th>
                <th align="left">Buy Price</th>
                <th align="left">Sell price</th>
    
            </tr>
             </tfoot>
        </table>
    </body>

</html>
    
<script type="text/javascript">        
    $(document).ready(function() {
        $('#example').DataTable();
    } );
</script>    
