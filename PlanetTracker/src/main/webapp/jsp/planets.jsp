<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Planet Tracker</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid" id="navHeader"></div>
        <nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="200" id="mainNavbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#subNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Planet Tracker</a>
                </div>
                <div class="collapse navbar-collapse" id="subNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active">                        
                            <a href="${pageContext.request.contextPath}/jsp/planets.jsp">Planets</a>
                        </li>
                        <li>                        
                            <a href="#">About</a>
                        </li> 
                        <li> 
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <a href="${pageContext.request.contextPath}/jsp/admin.jsp">Admin</a>
                            </sec:authorize>
                        </li> 
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <sec:authorize access="isAnonymous()"> 
                            <li>
                                <a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/signIn"><span class="glyphicon glyphicon-log-in"></span> Login</a>
                            </li>
                        </sec:authorize>
                        <sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_USER')"> 
                            <li>
                                <a href="${pageContext.request.contextPath}/j_spring_security_logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a>
                            </li>
                        </sec:authorize>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="col-md-8 col-md-offset-2">
                <noscript>
                <div class="error message">
                    <h3>This site looks best with JavaScript, please enable it.</h3>
                </div>    
                </noscript>
                <ul class="list-group" id="errorMessages"></ul>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-2">

                    <!-- PLANET TABLE PLANET TABLE PLANET TABLE PLANET TABLE -->               

                    <div id="planetTableDiv">
                        <div class="row">
                            <div class="col-md-8">
                                <h2 id="addHeader">Planets</h2>  
                            </div>
                            <div class="col-md-4">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addPlanetModal" id ="addButton">Add Planet</button>  
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table id="planetTable" class="table table-hover">
                                <tr>
                                    <th width="40%">Name</th>
                                    <th width="40%">Planet Type</th>
                                    <th width="10%"></th>
                                    <th width="10%"></th>
                                </tr>
                                <tbody id="contentRows"></tbody>
                            </table>
                        </div>
                    </div>

                    <!-- PLANET TABLE PLANET TABLE PLANET TABLE PLANET TABLE -->               

                    <!-- EDITING PLANET EDITING PLANET EDITING PLANET EDITING PLANET -->               

                    <div id="editFormDiv" style="display: none">
                        <h2>Edit Planet</h2>
                        <form class="form-horizontal" role="form" id="edit-form">
                            <div class="form-group">
                                <div class="col-md-12">
                                    <p>Image URL</p>
                                    <input type="url" class="form-control" id="edit-image-url" maxlength="256" placeholder="Image URL" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <p>Name</p>
                                    <input type="text" class="form-control" id="edit-name" maxlength="50" placeholder="Name" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <p>Average Temp</p>
                                    <input type="number" class="form-control" id="edit-avg-temp" min="-459" max="10000" placeholder="Average Temp (F)" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <p>Radiation Level</p>
                                    <input type="number" class="form-control" id="edit-rad-level" min="0" max="10000" placeholder="Radiation Level (Sv)" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <p>Planet Type</p>
                                    <select class="form-control" id="edit-planet-type" required>
                                        <option value="" selected disabled hidden>- Select Planet Type -</option>
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
                                <div class="col-md-12">
                                    <p>Life Type</p>
                                    <select class="form-control" id="edit-life-type" required>
                                        <option value="" selected disabled hidden>- Select Life Type -</option>
                                        <option value="Devoid">Devoid</option>
                                        <option value="Microbial">Microbial</option>
                                        <option value="Primitive">Primitive</option>
                                        <option value="Advanced">Advanced</option>
                                        <option value="Intelligent">Intelligent</option>
                                        <option value="Hyper-Intelligent">Hyper-Intelligent</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12" align="right">
                                    <button type="button" id="edit-button" class="btn btn-primary">Update Planet</button>
                                    <input type="hidden" id="edit-planet-id">
                                    <button type="button" id="edit-cancel-button" class="btn btn-default" onclick="hideEditForm()">Cancel</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- EDITING PLANET EDITING PLANET EDITING PLANET EDITING PLANET -->
                <!-- SEARCHING PLANET SEARCHING PLANET SEARCHING PLANET SEARCHING PLANET -->

                <div class="col-md-4">
                    <h2>Search</h2>
                    <form class="form-horizontal" role="form" id="search-form">
                        <div class="form-group">
                            <div class="col-md-12">
                                <p>Name</p>
                                <input type="text" class="form-control" id="search-name" maxlength="50" placeholder="Name"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <p>Average Temp</p>
                                <input type="number" class="form-control" id="search-avg-temp" min="-459" max="10000" placeholder="Average Temp (F)"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <p>Radiation Level</p>
                                <input type="number" class="form-control" id="search-rad-level" min="0" max="10000" placeholder="Radiation Level (Sv)"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <p>Planet Type</p>
                                <select class="form-control" id="search-planet-type">
                                    <option value="" selected disabled hidden>- Select Planet Type -</option>
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
                            <div class="col-md-12">
                                <p>Life Type</p>
                                <select class="form-control" id="search-life-type">
                                    <option value="" selected disabled hidden>- Select Life Type -</option>
                                    <option value="Devoid">Devoid</option>
                                    <option value="Microbial">Microbial</option>
                                    <option value="Primitive">Primitive</option>
                                    <option value="Advanced">Advanced</option>
                                    <option value="Intelligent">Intelligent</option>
                                    <option value="Hyper-Intelligent">Hyper-Intelligent</option>
                                    <option value="">All</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12" align="right">
                                <input type="button" class="btn btn-primary" id="search-button" value="Search"/>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- SEARCHING PLANET SEARCHING PLANET SEARCHING PLANET SEARCHING PLANET -->

            </div> <!-- END OF ROW -->
        </div> <!-- END OF CONTAINER -->
        <footer class="container-fluid text-center">
            <div class="col-md-4 col-md-offset-4">
                <div class="col-md-3 col-xs-6">
                    <a href="http://josephrohwer.com/" target="_blank"><i class="fa fa-home" aria-hidden="true"><p>Joseph</p></i></a>
                </div>
                <div class="col-md-3 col-xs-6">
                    <a href="https://github.com/josephrohwer" target="_blank"><i class="fa fa-github" aria-hidden="true"><p>GitHub</p></i></a>
                </div>
                <div class="col-md-3 col-xs-6">
                    <a href="https://twitter.com/josephrohwer" target="_blank"><i class="fa fa-twitter" aria-hidden="true"><p>Twitter</p></i></a>
                </div>
                <div class="col-md-3 col-xs-6">
                    <a href="https://www.linkedin.com/in/joseph-rohwer/" target="_blank"><i class="fa fa-linkedin" aria-hidden="true"><p>LinkedIn</p></i></a>
                </div>
            </div>
        </footer>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <%@include file="addPlanetModal.jsp"%>
        <%@include file="planetDetailsModal.jsp"%>
        <script src="${pageContext.request.contextPath}/js/planetTracker.js"></script>
    </body>
</html>
