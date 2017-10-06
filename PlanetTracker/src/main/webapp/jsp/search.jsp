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
                    <li role="presentation">
                        <a href="${pageContext.request.contextPath}/displayPlanetsPage">
                            Planets
                        </a>
                    </li>
                    <li role="presentation" class="active">
                        <a href="${pageContext.request.contextPath}/displaySearchPage">
                            Search
                        </a>
                    </li>
                </ul>    
            </div>
            <ul class="list-group" id="errorMessages"></ul>
            <div class="row">

                <!-- PLANET RESULTS TABLE PLANET RESULTS TABLE -->               

                <div class="col-md-6">                    
                    <h2>Search Results</h2>
                    <table id="planetTable" class="table table-hover">
                        <tr>
                            <th width="40%">Name</th>
                            <th width="30%">Planet Type</th>
                            <th width="15%"></th>
                            <th width="15%"></th>
                        </tr>
                        <tbody id="searchResultRows"></tbody>
                    </table>                    
                </div>

                <!-- PLANET RESULTS TABLE PLANET RESULTS TABLE -->               

                <!-- SEARCHING PLANET SEARCHING PLANET SEARCHING PLANET SEARCHING PLANET -->

                <div class="col-md-6">
                    <h2>Search</h2>
                    <form class="form-horizontal" role="form" id="search-form">
                        <div class="form-group">
                            <label for="search-name" class="col-md-4 control-label">Name:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="search-name" maxlength="50" placeholder="Name"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="search-avg-temp" class="col-md-4 control-label">Average Temp:</label>
                            <div class="col-md-8">
                                <input type="number" class="form-control" id="search-avg-temp" min="-459" max="10000" placeholder="Average Temp (F)"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="search-rad-level" class="col-md-4 control-label">Radiation Level:</label>
                            <div class="col-md-8">
                                <input type="number" class="form-control" id="search-rad-level" min="0" max="10000" placeholder="Radiation Level (Sv)"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="search-planet-type" class="col-md-4 control-label">Planet Type:</label>
                            <div class="col-md-8">
                                <select class="form-control" id="search-planet-type">
                                    <option value="" selected disabled hidden>Select Planet Type</option>
                                    <option value="Rocky Planet">Rocky Planet</option>
                                    <option value="Gas Planet">Gas Planet</option>
                                    <option value="Ice Planet">Ice Planet</option>
                                    <option value="Iron Planet">Iron Planet</option>
                                    <option value="Lava Planet">Lava Planet</option>
                                    <option value="Ocean Planet">Ocean Planet</option>
                                    <option value="Terrestrial Planet">Terrestrial Planet</option>
                                    <option value="">All</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="search-life-type" class="col-md-4 control-label">Life Type:</label>
                            <div class="col-md-8">
                                <select class="form-control" id="search-life-type">
                                    <option value="" selected disabled hidden>Select Life Type</option>
                                    <option value="Rocky Planet">Devoid</option>
                                    <option value="Gas Planet">Microbial</option>
                                    <option value="Ice Planet">Primitive</option>
                                    <option value="Iron Planet">Advanced</option>
                                    <option value="Lava Planet">Intelligent</option>
                                    <option value="Ocean Planet">Hyper-Intelligent</option>
                                    <option value="">All</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-8">
                                <input type="button" class="btn btn-default" id="search-button" value="Search"/>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- SEARCHING PLANET SEARCHING PLANET SEARCHING PLANET SEARCHING PLANET -->

            </div> <!-- END OF ROW -->
        </div> <!-- END OF CONTAINER -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/planetTracker.js"></script>
    </body>
</html>
