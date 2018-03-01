<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Planet Tracker</a>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="col-md-8 col-md-offset-2">
                <%@include file="errorMessageFragment.jsp"%>
            </div>
            <div class="panel panel-default col-md-4 col-md-offset-4">
                <div class="panel-body">
                    <h3>Create Account</h3>
                    <form class="form-horizontal" role="form" method="POST" action="userSignUp">
                        <div class="form-group">
                            <div class="col-md-12">
                                <label class="control-label">Username</label>
                                <input type="text" class="form-control" name="username" id="username" placeholder="Username" maxlength="30" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label class="control-label">Password</label>
                                <input type="password" class="form-control" name="password" id="password" placeholder="At least 6 characters" minlength="6" maxlength="256" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label class="control-label">Re-enter Password</label>
                                <input type="password" class="form-control" name="password-confirm" id="password-confirm" placeholder="Password" minlength="6" maxlength="256" required oninput="checkPasswordMatch(this)"/>
                            </div>
                        </div>
                        <script language='javascript' type='text/javascript'>
                            function checkPasswordMatch(input) {
                                if (input.value !== document.getElementById('password').value) {
                                    input.setCustomValidity('Passwords must match');
                                } else {
                                    input.setCustomValidity('');
                                }
                            }
                        </script>
                        <div class="form-group">
                            <div class="col-md-12" align="center">
                                <input type="submit" class="btn btn-primary" id="create-account-button" value="Create Account"/>
                            </div>
                        </div>
                    </form> 
                </div>
            </div> 
        </div>
        <footer class="container-fluid text-center">
            <%@include file="footerFragment.jsp"%>
        </footer>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
</html>
