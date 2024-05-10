<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="jdk.nashorn.internal.runtime.regexp.JoniRegExp.Factory"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "Bạn không đăng nhập !! Đăng nhập trước");
        response.sendRedirect("login.jsp");
        return;

    } else {

        if (user.getUserType().equals("normal")) {

            session.setAttribute("message", "You are not admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;

        }

    }


%>


<% CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategories();
    
// getting count

Map<String,Long>m=Helper.getCounts(FactoryProvider.getFactory());


%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>


    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container admin">


            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>



            <div class="row mt-3">

                <!--first col-->
                <div class="col-md-4">

                    <!--first box-->
                    <div class="card">

                        <div class="card-body text-center">


                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon"/>

                            </div>

                            <h1><%= m.get("userCount") %></h1>
                            <h1 class="text-uppercase text-muted">Người dùng</h1>

                        </div> 

                    </div>



                </div> 

                <!--second col-->

                <div class="col-md-4">


                    <div class="card">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/menu.png" alt="user_icon"/>

                            </div>
                            <h1><%= list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Thể loại</h1>

                        </div> 

                    </div>

                </div> 



                <!--third col-->
                <div class="col-md-4">

                    <div class="card">

                        <div class="card text-center">

                            <div class="card-body">

                                <div class="container">
                                    <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/delivery-box.png" alt="user_icon"/>

                                </div>
                                <h1><%= m.get("productCount") %></h1>
                                <h1 class="text-uppercase text-muted">Sản phẩm</h1>

                            </div> 

                        </div>


                    </div> 




                </div>


            </div>

            <!--second row-->

            <div class="row mt-3">

                <!--second :row first col-->
                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card text-center">

                            <div class="card-body">

                                <div class="container">
                                    <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/mathematical-operations.png" alt="user_icon"/>

                                </div>

                                <p class="mt-2">Bấm vào đây để thêm danh mục mới</p>
                                <h1 class="text-uppercase text-muted">Thêm thể loại</h1>

                            </div> 

                        </div>


                    </div> 

                </div>

                <!--second row : second col-->

                <div class="col-md-6" data-toggle="modal" data-target="#add-product-modal">

                    <div class="card">

                        <div class="card text-center">

                            <div class="card-body">

                                <div class="container">
                                    <img style="max-width: 125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon"/>

                                </div>
                                <p class="mt-2">Bấm vào đây để thêm sản phẩm mới</p>
                                <h1 class="text-uppercase text-muted">Thêm sản phẩm</h1>

                            </div> 

                        </div>


                    </div> 

                </div>


            </div>


        </div>




        <!--add category modal-->




        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Điền chi tiết danh mục</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">


                            <div class="form-group">
                                <input type="text" class="form-control" name="cateTitle" placeholder="Nhập tiêu đề danh mục" required />

                            </div>

                            <div class="form-group">
                                <textarea style="height: 300px;" class="form-control" placeholder="Nhập mô tả danh mục" name="catDescription" required></textarea>

                            </div>

                            <div class="cotnainer text-center">

                                <button class="btn btn-outline-success">Thêm thể loại</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            </div>

                        </form>




                    </div>

                </div>
            </div>
        </div>




        <!End add category modal-->



    <!--product modal-->

    <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

    <!-- Modal -->
    <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thông tin chi tiết sản phẩm</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!--form-->

                    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                        <input type="hidden" name="operation" value="addproduct"/>

                        <!--product title-->

                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Nhập tiêu đề sản phẩm" name="pName" required />
                        </div>


                        <!--product description-->

                        <div class="form-group">
                            <textarea style="height: 150px;" class="form-control" placeholder="Nhập mô tả sản phẩm" name="pDesc"></textarea>
                        </div>


                        <!--product price-->

                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Nhập giá sản phẩm" name="pPrice" required />
                        </div>

                        <!--product discount,giảm giá sản phẩm-->

                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Nhập sản phẩm giảm giá" name="pDiscount" required />
                        </div>


                        <!--product quantity,số lượng sản phẩm-->

                        <div class="form-group">
                            <input type="number" class="form-control" placeholder="Nhập số lượng sản phẩm" name="pQuantity" required />
                        </div>


                        <!--product category-->




                        <div class="form-group">
                            <select name="catId" class="form-control" id="">

                                <% for (Category c : list) {
                                %>


                                <option value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle()%> </option>


                                <%}%>
                            </select>

                        </div>

                        <!--submit button-->
                        <div class="container text-center">

                            <button class="btn btn-outline-success">Thêm sản phẩm</button>

                        </div>



                        <!--product file-->


                        <div class="form-group">
                            <label for="pPic">Chọn Hình ảnh sản phẩm</label>
                            <br>
                            <input type="file" id="pPic" name="pPic" required />

                        </div>
                    </form>









                    <!--end form-->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>



    <!--End product modal-->

    <%@include file="components/common_modals.jsp" %>

</body>
</html>
