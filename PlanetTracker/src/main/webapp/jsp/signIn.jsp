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
                </ul>    
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
                            <div class="col-md-8 col-md-offset-4">
                                <input type="submit" class="btn btn-default" id="sign-in-button" value="Sign In"/>
                            </div>
                        </div>
                    </form> 
                </div>
            </div> 
        </div>
        <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    </body>
</html>
