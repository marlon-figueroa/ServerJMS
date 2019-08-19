<%-- 
    Document   : index
    Created on : 18/08/2019, 09:10:27 PM
    Author     : Marlon E. Figueroa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TEST JMS</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-reboot.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-grid.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">

            <div style="height: 6rem;"></div>

            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title text-center">TEST Java Messages Service</h5>
                        <form method="POST" action="SendMessageServlet">
                            <div class="form-group row">
                                <label for="text" class="col-sm-2 col-form-label">Message</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" id="text" name="text"></textarea>
                                </div>
                            </div>      
                            <div class="form-group row">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-primary">Send</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                
                <div style="height: 2rem;"></div>
                
                <c:choose>
                    <c:when test="${empty mensaje}">
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <strong>Message sent</strong> ${mensaje}
                            <hr>
                            <p class="mb-0">
                                Queue: queue/QueueTest
                                Factory Conection: ConnectionFactory
                            </p>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <script src="js/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
        <script src="js/popper.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
    </body>
</html>
