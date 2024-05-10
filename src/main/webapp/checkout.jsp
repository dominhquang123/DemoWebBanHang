<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "Bạn không đăng nhập!! Đăng nhập trước để truy cập trang thanh toán");
        response.sendRedirect("login.jsp");
        return;

    }

%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thủ tục thanh toán</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="row mt-5">

                <div class="col-md-6">
                    <!--card-->
                    <div class="card">
                        <div class="card-body">

                            <h3 class="text-center mb-5">Các mục bạn đã chọn</h3>

                            <div class="cart-body">

                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-6">
                    <!--form details-->
                    <!--card-->
                    <div class="card">
                        <div class="card-body">

                            <h3 class="text-center mb-5">Thông tin chi tiết của bạn để đặt hàng</h3>
                            <form action="#!">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Địa chỉ email</label>
                                    <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Nhập email">
                                </div>
                                <div class="form-group">
                                    <label for="name">Tên của bạn</label>
                                    <input value="<%= user.getUserName()%>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Nhập tên">
                                </div>


                                <div class="form-group">
                                    <label for="name">Liên lạc của bạn</label>
                                    <input value="<%= user.getUserPhone() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Nhập số liên lạc">
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Địa chỉ giao hàng của bạn</label>
                                    <textarea value="<%= user.getUserAddress()%>" class="form-control" id="exampleFormControlTextarea1" placeholder="Nhập địa chỉ của bạn" rows="3"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Đặt hàng ngay</button>
                                    <button class="btn btn-outline-primary">Tiếp tục mua sắm</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>

        </div>


        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
