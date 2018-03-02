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
                        <li>                        
                            <a href="${pageContext.request.contextPath}/jsp/planets.jsp">Planets</a>
                        </li>
                        <li class="active">                        
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
                <%@include file="/jsp/errorMessageFragment.jsp"%>
            </div>
            <div class="col-md-8 col-md-offset-2">
                <h2>What is Planet Tracker?</h2>
                <p>
                    Planet Tracker is a web application that acts as a content management system for planets and their related planetary data. Depending on the user's access level, the application serves a variety of different functions. A user without an account visiting the page can search for planets and view details about various planets in the system. They also have the option to create an account and sign in so they can add planets themselves. An admin user has the most permissions, with the ability to add, edit, and delete planets. The admin user also has access to a special "Admin" page where they can create new users and delete existing ones.
                </p>
                <h2>Technologies Used</h2>
                <div>
                    <table class="table">
                        <tr>
                            <td><b>Java</b></td>
                            <td>The language for handling the backend logic.</td>
                        </tr>
                        <tr>
                            <td><b>REST</b></td>
                            <td>Used to GET, POST, PUT, and DELETE data as well as improve performance and scalability.</td>
                        </tr>
                        <tr>
                            <td><b>JavaScript</b></td>
                            <td>Used to make the website more responsive and communicate data to the REST endpoints.</td>
                        </tr>
                        <tr>
                            <td><b>jQuery</b></td>
                            <td>Simplifies the client-side scripting of HTML.</td>
                        </tr>
                        <tr>
                            <td><b>HTML</b></td>
                            <td>Used to structure the website.</td>
                        </tr>
                        <tr>
                            <td><b>CSS</b></td>
                            <td>Used to style the website.</td>
                        </tr>
                        <tr>
                            <td><b>Bootstrap</b></td>
                            <td>Gives the website a more modern look and feel as well as making it mobile-friendly.</td>
                        </tr>
                        <tr>
                            <td><b>MySQL</b></td>
                            <td>The database used to store planets and user accounts.</td>
                        </tr>
                        <tr>
                            <td><b>SQL</b></td>
                            <td>Used to manipulate data in the MySQL database.</td>
                        </tr>
                        <tr>
                            <td><b>Hibernate</b></td>
                            <td>Used to annotate the DTO to prevent users and planets that don't meet the defined constraints from being created.</td>
                        </tr>
                        <tr>
                            <td><b>AJAX</b></td>
                            <td>Allows the website to load content without having to refresh the entire page.</td>
                        </tr>
                        <tr>
                            <td><b>Spring</b></td>
                            <td>Used to create various bean definitions for dependency injection.</td>
                        </tr>
                        <tr>
                            <td><b>Spring Security</b></td>
                            <td>Used for user authentication and page access control.</td>
                        </tr>
                        <tr>
                            <td><b>bcrypt</b></td>
                            <td>Encrypts user passwords upon account creation.</td>
                        </tr>
                        <tr>
                            <td><b>MVC Pattern</b></td>
                            <td>An architectural pattern that makes the application more scalable and easier to work with.</td>
                        </tr>
                        <tr>
                            <td><b>JUnit</b></td>
                            <td>Used to write unit tests to ensure the application works as intended.</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <footer class="container-fluid text-center">
            <%@include file="/jsp/footerFragment.jsp"%>
        </footer>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
