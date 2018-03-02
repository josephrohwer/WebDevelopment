<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Planet Tracker</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid" id="nav-header"></div>
        <nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="200" id="main-navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#sub-navbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Planet Tracker</a>
                </div>
                <div class="collapse navbar-collapse" id="sub-navbar">
                    <ul class="nav navbar-nav">
                        <li class="active">                        
                            <a href="${pageContext.request.contextPath}/jsp/planets.jsp">Planets</a>
                        </li>
                        <li>                        
                            <a href="${pageContext.request.contextPath}/jsp/about.jsp">About</a>
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
                                <a href="${pageContext.request.contextPath}/signUp"><span class="glyphicon glyphicon-user"></span> Sign Up</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/signIn"><span class="glyphicon glyphicon-log-in"></span> Sign In</a>
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
                <%@include file="errorMessageFragment.jsp"%>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <div id="planet-table-div">
                        <div class="row">
                            <div class="col-md-8">
                                <h2 id="add-header">Planets</h2>  
                            </div>
                            <div class="col-md-4">
                                <sec:authorize access="hasAnyRole('ROLE_ADMIN, ROLE_USER')"> 
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add-planet-modal" id="add-button">Add Planet</button>  
                                </sec:authorize>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table id="planet-table" class="table table-hover">
                                <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                                    <input id="is-admin" type="text" class="hide" value="true"/>
                                    <tr>
                                        <th width="40%">Name</th>
                                        <th width="40%">Planet Type</th>
                                        <th width="10%"></th>
                                        <th width="10%"></th>
                                    </tr>
                                </sec:authorize>
                                <sec:authorize access="!hasRole('ROLE_ADMIN')"> 
                                    <input id="is-admin" type="text" class="hide" value="false"/>
                                    <tr>
                                        <th width="50%">Name</th>
                                        <th width="50%">Planet Type</th>
                                    </tr>
                                </sec:authorize>
                                <tbody id="content-rows"></tbody>
                            </table>
                        </div>
                    </div>
                    <div id="edit-form-div" style="display: none">
                        <h2>Edit Planet</h2>
                        <%@include file="editFormFragment.jsp"%>
                    </div>
                </div>
                <div class="col-md-4">
                    <h2>Search</h2>
                    <%@include file="searchFormFragment.jsp"%>
                </div>
            </div>
        </div>
        <footer class="container-fluid text-center">
            <%@include file="footerFragment.jsp"%>
        </footer>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <%@include file="addPlanetModal.jsp"%>
        <%@include file="planetDetailsModal.jsp"%>
        <script src="${pageContext.request.contextPath}/js/planetTracker.js"></script>
    </body>
</html>
