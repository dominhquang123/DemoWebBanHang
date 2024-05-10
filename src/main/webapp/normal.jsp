<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CUA HANG - Trang chủ </title>
        <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid">
            <div class="row mt-3 mx-2">
                <%            String cat = request.getParameter("category");
                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = (cat == null || cat.trim().equals("all")) ? dao.getAllProducts() : dao.getAllProductsById(Integer.parseInt(cat.trim()));
                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();
                %>

                <!-- Show category -->
                <div class="col-md-2">
                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">Tất cả sản phẩm</a>
                        <% for (Category c : clist) {%>
                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                        <% } %>
                    </div>
                </div>

                <!-- Show products -->
                <div class="col-md-10">
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card-columns">
                                <% for (Product p : list) {%>
                                <div class="card product-card">
                                    <div class="container text-center">
                                        <img src="img/products/<%= p.getpPhoto()%>" style="max-height: 200px;max-width: 100%;width: auto; " class="card-img-top m-2" alt="...">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%= p.getpName()%></h5>
                                        <p class="card-text">
                                            <%= Helper.get10Words(p.getpDesc())%>
                                        </p>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="product-details" style="display: flex; flex-wrap: wrap; justify-content: center;">
                                            <button class="btn custom-bg text-white mb-2 add-to-cart-btn" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>', <%= p.getPriceAfterApplyingDiscount()%>)" style="width: 100%; margin-bottom: 5px;">Thêm vào giỏ hàng</button>
                                            <button class="btn btn-outline-success price-btn" style="width: 100%;">
                                                <%= p.getpPrice()%>₫ <!-- Giá gốc của sản phẩm -->
                                                <span class="text-secondary discount-label">
                                                    <%= p.getPriceAfterApplyingDiscount()%>₫ <!-- Giá sau khi áp dụng giảm giá -->
                                                    (Giảm <%= p.getpDiscount()%>%)
                                                </span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                                <% if (list.size() == 0) { %>
                                <h3>Không có mục nào trong danh mục này</h3>
                                <% }%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/common_modals.jsp" %>

    </body>
</html>