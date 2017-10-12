<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
                        <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
                    </li>
                    <li role="presentation" class="active">
                        <a href="${pageContext.request.contextPath}/displayPlanetsPage">Planets</a>
                    </li>
                    <li role="presentation">
                        <a href="${pageContext.request.contextPath}/displaySearchPage">Search</a>
                    </li>
                    <li role="presentation">
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <a href="${pageContext.request.contextPath}/displayUserList">
                                User Admin
                            </a>
                        </sec:authorize>
                    </li>                        
                    <li role="presentation">
                        <sec:authorize access="isAnonymous()"> 
                            <a href="${pageContext.request.contextPath}/signIn">Sign In</a>
                        </sec:authorize>
                        <sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_USER')"> 
                            <a href="${pageContext.request.contextPath}/j_spring_security_logout">Sign Out</a>
                        </sec:authorize>
                    </li>
                </ul>    
            </div>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <p>Hello: ${pageContext.request.userPrincipal.name}</p>
            </c:if>
            <ul class="list-group" id="errorMessages"></ul>
            <div class="row">
                <div class="col-md-6">

                    <!-- PLANET TABLE PLANET TABLE PLANET TABLE PLANET TABLE -->               

                    <div id="planetTableDiv">
                        <h2>Planets</h2>
                        <table id="planetTable" class="table table-hover">
                            <tr>
                                <th width="40%">Name</th>
                                <th width="30%">Planet Type</th>
                                <th width="15%"></th>
                                <th width="15%"></th>
                            </tr>
                            <tbody id="contentRows"></tbody>
                        </table>                    
                    </div>

                    <!-- PLANET TABLE PLANET TABLE PLANET TABLE PLANET TABLE -->               

                    <!-- EDITING PLANET EDITING PLANET EDITING PLANET EDITING PLANET -->               

                    <div id="editFormDiv" style="display: none">
                        <h2>Edit Planet</h2>
                        <form class="form-horizontal" role="form" id="edit-form">
                            <div class="form-group">
                                <label for="edit-name" class="col-md-4 control-label">Name:</label>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="edit-name" maxlength="50" placeholder="Name" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit-avg-temp" class="col-md-4 control-label">Average Temp:</label>
                                <div class="col-md-8">
                                    <input type="number" class="form-control" id="edit-avg-temp" min="-459" max="10000" placeholder="Average Temp (F)" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit-rad-level" class="col-md-4 control-label">Radiation Level:</label>
                                <div class="col-md-8">
                                    <input type="number" class="form-control" id="edit-rad-level" min="0" max="10000" placeholder="Radiation Level (Sv)" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit-planet-type" class="col-md-4 control-label">Planet Type:</label>
                                <div class="col-md-8">
                                    <select class="form-control" id="edit-planet-type" required>
                                        <option value="" selected disabled hidden>Select Planet Type</option>
                                        <option value="Rocky Planet">Rocky Planet</option>
                                        <option value="Gas Planet">Gas Planet</option>
                                        <option value="Ice Planet">Ice Planet</option>
                                        <option value="Iron Planet">Iron Planet</option>
                                        <option value="Lava Planet">Lava Planet</option>
                                        <option value="Ocean Planet">Ocean Planet</option>
                                        <option value="Terrestrial Planet">Terrestrial Planet</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit-life-type" class="col-md-4 control-label">Life Type:</label>
                                <div class="col-md-8">
                                    <select class="form-control" id="edit-life-type" required>
                                        <option value="" selected disabled hidden>Select Life Type</option>
                                        <option value="Rocky Planet">Devoid</option>
                                        <option value="Gas Planet">Microbial</option>
                                        <option value="Ice Planet">Primitive</option>
                                        <option value="Iron Planet">Advanced</option>
                                        <option value="Lava Planet">Intelligent</option>
                                        <option value="Ocean Planet">Hyper-Intelligent</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-4 col-md-4">
                                    <input type="hidden" id="edit-planet-id">
                                    <button type="button" id="edit-cancel-button" class="btn btn-default" onclick="hideEditForm()">Cancel</button>
                                </div>
                                <div class="col-md-4">
                                    <button type="button" id="edit-button" class="btn btn-default">Update Planet</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- EDITING PLANET EDITING PLANET EDITING PLANET EDITING PLANET -->

                <!-- ADDING PLANET ADDING PLANET ADDING PLANET ADDING PLANET -->

                <div class="col-md-6">
                    <h2>Add New Planet</h2>
                    <form class="form-horizontal" role="form" id="add-form">
                        <div class="form-group">
                            <label for="add-name" class="col-md-4 control-label">Name:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="add-name" maxlength="50" placeholder="Name" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add-avg-temp" class="col-md-4 control-label">Average Temp:</label>
                            <div class="col-md-8">
                                <input type="number" class="form-control" id="add-avg-temp" min="-459" max="10000" placeholder="Average Temp (F)" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add-rad-level" class="col-md-4 control-label">Radiation Level:</label>
                            <div class="col-md-8">
                                <input type="number" class="form-control" id="add-rad-level" min="0" max="10000" placeholder="Radiation Level (Sv)" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add-planet-type" class="col-md-4 control-label">Planet Type:</label>
                            <div class="col-md-8">
                                <select class="form-control" id="add-planet-type" required>
                                    <option value="" selected disabled hidden>Select Planet Type</option>
                                    <option value="Rocky Planet">Rocky Planet</option>
                                    <option value="Gas Planet">Gas Planet</option>
                                    <option value="Ice Planet">Ice Planet</option>
                                    <option value="Iron Planet">Iron Planet</option>
                                    <option value="Lava Planet">Lava Planet</option>
                                    <option value="Ocean Planet">Ocean Planet</option>
                                    <option value="Terrestrial Planet">Terrestrial Planet</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add-life-type" class="col-md-4 control-label">Life Type:</label>
                            <div class="col-md-8">
                                <select class="form-control" id="add-life-type" required>
                                    <option value="" selected disabled hidden>Select Life Type</option>
                                    <option value="Rocky Planet">Devoid</option>
                                    <option value="Gas Planet">Microbial</option>
                                    <option value="Ice Planet">Primitive</option>
                                    <option value="Iron Planet">Advanced</option>
                                    <option value="Lava Planet">Intelligent</option>
                                    <option value="Ocean Planet">Hyper-Intelligent</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-4 col-md-8">
                                <button type="button" id="add-button" class="btn btn-default">Add Planet</button>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- ADDING PLANET ADDING PLANET ADDING PLANET ADDING PLANET -->

            </div> <!-- END OF ROW -->
        </div> <!-- END OF CONTAINER -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/planetTracker.js"></script>
    </body>
</html>
