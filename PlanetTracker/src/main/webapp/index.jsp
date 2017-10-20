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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container col-md-12">
            <img src="${pageContext.request.contextPath}/img/space.jpg" class="img-responsive" alt="Space" style="max-width: 100%">
            <nav class="navbar navbar-inverse navbar-static-top" data-spy="affix" data-offset-top="197">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span> 
                        </button>
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Planet Tracker</a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
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
                            <li> 
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
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <p>Hello: ${pageContext.request.userPrincipal.name}</p>
            </c:if>
            <p>
                Recent Discoveries
            </p>
        </div>
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>
