// Thêm sản phẩm vào giỏ hàng
function add_to_cart(pid, pname, price) {
    let cart = localStorage.getItem("cart");
    if (cart === null) {
        // Nếu chưa có giỏ hàng
        let products = [];
        let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        showToast(`${pname} đã được thêm vào giỏ hàng`);
    } else {
        // Nếu giỏ hàng đã tồn tại
        let pcart = JSON.parse(cart);
        let existingProduct = pcart.find((item) => item.productId === pid);
        if (existingProduct) {
            // Tăng số lượng sản phẩm nếu sản phẩm đã tồn tại trong giỏ hàng
            existingProduct.productQuantity += 1;
            showToast(`${existingProduct.productName} - Số lượng: ${existingProduct.productQuantity} - Đã được thêm vào giỏ hàng`);
        } else {
            // Thêm sản phẩm mới vào giỏ hàng
            let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price };
            pcart.push(product);
            showToast(`${pname} đã được thêm vào giỏ hàng`);
        }
        localStorage.setItem("cart", JSON.stringify(pcart));
    }
    // Cập nhật giỏ hàng sau khi thêm sản phẩm
    updateCart();
}

// Cập nhật giỏ hàng
function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart === null || cart.length === 0) {
        // Nếu giỏ hàng trống
        console.log("Giỏ hàng trống !!");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>Giỏ hàng không có mặt hàng nào </h3>");
        $(".checkout-btn").attr('disabled', true);
    } else {
        // Nếu có sản phẩm trong giỏ hàng
        console.log(cart);
        $(".cart-items").html(`( ${cart.length} )`);
        let table = `
        <table class="table">
        <thead class="thead-light">
            <tr>
            <th class="text-center">Tên mục</th>
            <th class="text-center">Giá</th>
            <th class="text-center">Số lượng</th>
            <th class="text-center">Hoạt động</th>
            <th class="text-center">Tổng giá</th>
            </tr>
        </thead>
        <tbody>
    `;
        let totalPrice = 0;
        cart.forEach((item) => {
            let itemTotalPrice = item.productQuantity * item.productPrice;
            totalPrice += itemTotalPrice; // Cộng vào tổng giá trị mỗi lần duyệt qua một mục hàng
            table += `
            <tr>
                <td>${item.productName}</td>
                <td>${item.productPrice}</td>
                <td>${item.productQuantity}</td>
                <td><button onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger btn-sm">Xóa</button></td>
                <td class="text-right">${itemTotalPrice}</td>
            </tr>
        `;
        });
        table += `
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4" class="text-right font-weight-bold">Tổng giá:</td>
                <td class="text-right font-weight-bold">${totalPrice}</td>
            </tr>
        </tfoot>
        </table>`;
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled', false);
        console.log("removed")
    }
}

// Xóa một mục khỏi giỏ hàng
function deleteItemFromCart(pid) {
    let cart = JSON.parse(localStorage.getItem('cart'));

    let newcart = cart.filter((item) => item.productId !== pid)

    localStorage.setItem('cart', JSON.stringify(newcart))

    // Cập nhật giỏ hàng sau khi xóa một mục
    updateCart();

    showToast("Mặt hàng đã bị xóa khỏi giỏ hàng ");
}

// Gọi hàm cập nhật giỏ hàng khi trang web được tải
$(document).ready(function () {
    updateCart();
});

// Hiển thị toast
function showToast(content) {
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
    }, 2000);
}

// Chuyển hướng đến trang thanh toán
function goToCheckout() {
    window.location = "checkout.jsp";
}