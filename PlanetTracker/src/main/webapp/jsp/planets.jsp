<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Planet Tracker</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">        
    </head>
    <body>
        <div class="container">
            <h1>Planet Tracker</h1>
            <hr/>
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation"> 
                        <a href="${pageContext.request.contextPath}/index.jsp">
                            Home
                        </a>
                    </li>
                    <li role="presentation"
                        class="active">
                        <a href="${pageContext.request.contextPath}/displayPlanetsPage">
                            Planets
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="${pageContext.request.contextPath}/displaySearchPage">
                            Search
                        </a>
                    </li>
                </ul>    
            </div>
            <div class="row">
                <div class="col-md-6">
                    <h2>Planets</h2>
                    <table id="planetTable" class="table table-hover">
                        <tr>
                            <th width="40%">Name</th>
                            <th width="30%">Planet Type</th>
                            <th width="15%"></th>
                            <th width="15%"></th>
                        </tr>
                        <c:forEach var="currentPlanet" items="${planetList}">
                            <tr>
                                <td>
                                    <a href="displayPlanetDetails?planetId=${currentPlanet.planetId}">
                                        <c:out value="${currentPlanet.name}"/>
                                    </a>
                                </td>
                                <td>
                                    <c:out value="${currentPlanet.planetType}"/>
                                </td>
                                <td>
                                    Edit
                                </td>
                                <td>
                                    <a href="deletePlanet?planetId=${currentPlanet.planetId}">
                                        Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>                    
                </div>
                <div class="col-md-6">
                    <h2>Add New Planet</h2>
                    <form class="form-horizontal" 
                          role="form" method="POST" 
                          action="createPlanet">
                        <div class="form-group">
                            <label for="add-name" class="col-md-4 control-label">Name:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="name" placeholder="Name"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add-avg-temp" class="col-md-4 control-label">Average Temp:</label>
                            <div class="col-md-8">
                                <input type="number" class="form-control" name="avgTemp" placeholder="Average Temp (F)"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add-rad-level" class="col-md-4 control-label">Radiation Level:</label>
                            <div class="col-md-8">
                                <input type="number" class="form-control" name="radLevel" placeholder="Radiation Level (Sv)"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add-planet-type" class="col-md-4 control-label">Planet Type:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="planetType" placeholder="Planet Type"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add-life-type" class="col-md-4 control-label">Life Type:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="lifeType" placeholder="Life Type"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-8">
                                <input type="submit" class="btn btn-default" value="Add Planet"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>