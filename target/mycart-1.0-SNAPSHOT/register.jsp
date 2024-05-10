<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Người dùng mới</title>

        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">

            
            <div class="row mt-3">
                <div class="col-md-4 offset-md-4">
                    
                    
                    <div class="card">
                        
                        <%@include file="components/message.jsp" %>
                        
                        <div class="card-body px-5">

                            <div class="container text-center">
                                <img src="img/add-friend.png" style="max-width: 100px;" class="img-fluid" alt="alt"/>
                            </div>


                            <h3 class="text-center my-3">Đăng ký tại đây !!</h3>

                            <form action="RegisterServlet" method="post">

                                <div class="form-group">
                                    <label for="name">Tên tài khoản</label>
                                    <input name="user_name" type="text" class="form-control" id="name" placeholder="Nhập vào đây" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>

                                <div class="form-group">
                                    <label for="email">Email người dùng</label>
                                    <input name="user_email" type="email" class="form-control" id="email" placeholder="Nhập vào đây" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>

                                <div class="form-group">
                                    <label for="password">Mật khẩu người dùng</label>
                                    <input name="user_password" type="password" class="form-control" id="password" placeholder="Nhập vào đây" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>

                                <div class="form-group">
                                    <label for="phone">Điện thoại người dùng</label>
                                    <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Nhập vào đây" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>

                                <div class="form-group">
                                    <label for="phone">Địa chỉ người dùng</label>
                                    <textarea name="user_address" style="height: 200px;" class="form-control" placeholder="Nhập địa chỉ của bạn"></textarea>


                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Đăng ký</button>
                                    <button class="btn btn-outline-warning">Cài lại</button>
                                </div>
                            </form>


                        </div>


                    </div>

                </div>

            </div>

        </div>
    </body>
</html>
