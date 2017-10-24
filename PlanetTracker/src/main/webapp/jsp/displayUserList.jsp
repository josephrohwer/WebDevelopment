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
        <link rel="shortcut icon" href="/favicon.ico">
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
                        <li>                        
                            <a href="${pageContext.request.contextPath}/displayPlanetsPage">Planets</a>
                        </li>
                        <li>                        
                            <a href="${pageContext.request.contextPath}/displaySearchPage">Search</a>
                        </li>
                        <li>                        
                            <a href="#">About</a>
                        </li> 
                        <li class="active"> 
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <a href="${pageContext.request.contextPath}/displayUserList">Admin</a>
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
            <noscript>
            <div class="error message">
                <h3>This site looks best with JavaScript, please enable it.</h3>
            </div>    
            </noscript>
            <h1>Users</h1>
            <a href="displayUserForm">Add a User</a><br/>
            <hr/>
            <c:forEach var="user" items="${users}">
                <c:out value="${user.username}"/> |
                <a href="deleteUser?username=${user.username}">Delete</a><br/><br/>
            </c:forEach>
        </div>
        <footer class="container-fluid text-center">
            <div class="col-xs-4 col-xs-offset-4">
                <div class="col-xs-3">
                    <a href="http://josephrohwer.com/" target="_blank"><i class="fa fa-home" aria-hidden="true"></i></a>
                </div>
                <div class="col-xs-3">
                    <a href="https://github.com/josephrohwer" target="_blank"><i class="fa fa-github" aria-hidden="true"></i></a>
                </div>
                <div class="col-xs-3">
                    <a href="https://twitter.com/josephrohwer" target="_blank"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                </div>
                <div class="col-xs-3">
                    <a href="https://www.linkedin.com/in/joseph-rohwer/" target="_blank"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                </div>
            </div>
        </footer>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
