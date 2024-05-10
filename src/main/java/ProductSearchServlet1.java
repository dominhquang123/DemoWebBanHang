import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Product;
import java.util.List;
import com.learn.mycart.helper.FactoryProvider;

public class ProductSearchServlet1 extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchInput = request.getParameter("searchInput");
        String brandFilter = request.getParameter("brandFilter");
        
        // Tạo đối tượng ProductDao
        ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
        
        // Gọi phương thức searchAndFilterProducts để lấy danh sách sản phẩm sau khi tìm kiếm và lọc
        List<Product> searchResult = productDao.searchAndFilterProducts(searchInput, brandFilter);
        
        // Tiến hành xử lý kết quả và hiển thị ra giao diện người dùng
        // Ví dụ: bạn có thể chuyển kết quả vào một trang JSP để hiển thị
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            // In danh sách sản phẩm ra HTML
            for (Product product : searchResult) {
                out.println("<div>" + product.getpName() + "</div>");
                // Thêm các thông tin sản phẩm khác nếu cần
            }
        } finally {
            out.close();
        }
    }
}