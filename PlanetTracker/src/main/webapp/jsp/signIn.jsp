<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
    </head>
    <body>
        <div class="container-fluid" id="navHeader"></div>
        <nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="200" id="mainNavbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Planet Tracker</a>
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
            </div>
            <div class="panel panel-default col-md-4 col-md-offset-4">
                <div class="panel-body">
                    <h3>Sign in</h3>
                    <c:if test="${param.signIn_error == 1}">
                        <div class="alert alert-danger">
                            <strong>Incorrect username or password!</strong>
                        </div>
                    </c:if>
                    <form class="form-horizontal" role="form" method="post" action="j_spring_security_check">
                        <div class="form-group">
                            <div class="col-md-12">
                                <label for="j_username" class="control-label">Username</label>
                                <input type="text" class="form-control" name="j_username" placeholder="Username" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label for="j_password" class="control-label">Password</label>
                                <input type="password" class="form-control" name="j_password" placeholder="Password" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12" align="center">
                                <input type="submit" class="btn btn-primary" id="sign-in-button" value="Sign In"/>
                            </div>
                        </div>
                    </form> 
                </div>
            </div> 
        </div>
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
    </body>
</html>
