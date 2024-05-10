
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập người dùng - MyCart</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">

                    <div class="card mt-3">

                        <div class="card-header custom-bg text-white">
                            <h3>Đăng nhập tại đây</h3>
                        </div>

                        <div class="card-body">
                            
                            <%@include file="components/message.jsp" %>
                            
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Địa chỉ email</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Nhập email">
                                    <small id="emailHelp" class="form-text text-muted"></small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Mật khẩu</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Mật khẩu">
                                </div>
                                <a href="register.jsp" class="text-center d-block mb-2"> Nếu chưa đăng ký bấm vào đây </a>
                                
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-primary border-0 custom-bg ">Đăng nhập</button>
                                    <button type="reset" class="btn btn-primary custom-bg border-0 ">Cài lại</button>
                                </div>
                                
                            </form>

                        </div>

                        
                    </div>




                </div>
            </div>
        </div>



    </body>
</html>
