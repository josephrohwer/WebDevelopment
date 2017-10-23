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
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body>
        <img src="${pageContext.request.contextPath}/img/space.jpg" class="img-responsive" alt="Space" id="splash-pic">
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
                        
        <div class="container-fluid"> 
            <noscript>
            <div class="error message">
                <h3>This site looks best with JavaScript, please enable it.</h3>
            </div>    
            </noscript>
            <div class="row">
                <div class="col-md-4">
                    <div class="thumbnail">
                        <a href="#">
                            <img class="cover" src="https://exoplanets.nasa.gov/system/resources/detail_files/66_ssc2007-02a_Sm.jpg" alt="Image from NASA." id="recentPlanet">
                            <div class="caption">
                                <p>Lorem ipsum...</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="thumbnail">
                        <a href="#">
                            <img class="cover" src="https://exoplanets.nasa.gov/system/resources/detail_files/286_PIA19833_s.jpg" alt="Image from NASA." id="recentPlanet">
                            <div class="caption">
                                <p>Lorem ipsum...</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="thumbnail">
                        <a href="#">                         
                            <img class="cover" src="https://exoplanets.nasa.gov/system/resources/detail_files/122_PIA17001.jpg" alt="Image from NASA." id="recentPlanet">
                            <div class="caption">
                                <p>Lorem ipsum...</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="thumbnail">
                        <a href="#">
                            <img class="cover" src="https://exoplanets.nasa.gov/system/resources/detail_files/219_607694main_Kepler22bArtwork_full(S).jpg" alt="Image from NASA." id="recentPlanet">
                            <div class="caption">
                                <p>Lorem ipsum...</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="thumbnail">
                        <a href="#">
                            <img class="cover" src="https://exoplanets.nasa.gov/system/resources/detail_files/222_696969main_ExoUpClose-full_full(S).jpg" alt="Image from NASA." id="recentPlanet">
                            <div class="caption">
                                <p>Lorem ipsum...</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="thumbnail">
                        <a href="#">
                            <img class="cover" src="https://exoplanets.nasa.gov/system/resources/detail_files/212_Kepler10b.jpg" alt="Image from NASA." id="recentPlanet">
                            <div class="caption">
                                <p>Lorem ipsum...</p>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <footer class="container-fluid text-center">
            <div class="col-md-3">
                Personal Website
            </div>
            <div class="col-md-3">
                GitHub
            </div>
            <div class="col-md-3">
                Twitter
            </div>
            <div class="col-md-3">
                LinkedIn
            </div>
        </footer>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
