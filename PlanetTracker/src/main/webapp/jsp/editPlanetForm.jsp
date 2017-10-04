<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
                    <li role="presentation">
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
            <sf:form class="form-horizontal" role="form" modelAttribute="planet"
                     action="editPlanet" method="POST">
                <div class="form-group">
                    <label for="add-name" class="col-md-4 control-label">Name:</label>
                    <div class="col-md-8">
                        <sf:input type="text" class="form-control" id="add-name"
                                  path="name" placeholder="Name"/>
                        <sf:errors path="name" cssclass="error"></sf:errors>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-avg-temp" class="col-md-4 control-label">Average Temp:</label>
                        <div class="col-md-8">
                        <sf:input type="number" min="-459" max="10000" class="form-control" id="add-avg-temp"
                                  path="avgTemp" placeholder="Average Temp (F)"/>
                        <sf:errors path="avgTemp" cssclass="error"></sf:errors>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-rad-level" class="col-md-4 control-label">Radiation Level:</label>                          
                        <div class="col-md-8">
                        <sf:input type="number" min="0" max="10000" class="form-control" id="add-rad-level"
                                  path="radLevel" placeholder="Radiation Level (Sv)"/>
                        <sf:errors path="radLevel" cssclass="error"></sf:errors>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-planet-type" class="col-md-4 control-label">Planet Type:</label>
                        <div class="col-md-8">
                        <sf:input type="text" class="form-control" id="add-planet-type"
                                  path="planetType" placeholder="Planet Type"/>
                        <sf:errors path="planetType" cssclass="error"></sf:errors>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-life-type" class="col-md-4 control-label">Life Type:</label>
                        <div class="col-md-8">
                        <sf:input type="text" class="form-control" id="add-life-type"
                                  path="lifeType" placeholder="Life Type"/>
                        <sf:errors path="lifeType" cssclass="error"></sf:errors>
                        <sf:hidden path="planetId"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-4 col-md-8">
                        <input type="submit" class="btn btn-default" value="Update Planet"/>
                    </div>
                </div>
            </sf:form>    
        </div>
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>
