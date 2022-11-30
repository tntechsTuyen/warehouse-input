import com.sys.warehouse.controller.ProductController;
import com.sys.warehouse.dto.Product;
import com.sys.warehouse.dto.Supplier;
import com.sys.warehouse.service.IProductService;
import com.sys.warehouse.service.ISupplierService;
import com.sys.warehouse.service.impl.ProductServiceImpl;
import config.TestBeanConfig;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import java.util.Date;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {TestBeanConfig.class})
public class ApplicationTest {

    @Autowired
    private IProductService productService;

    @Autowired
    private ISupplierService supplierService;

    @Test
    public void product_add_error() throws Exception {
        Product product = new Product(1, "c1", "n1", 1, 10);
        Assert.assertEquals("FAILED", productService.save(product));
    }

    @Test
    public void product_add_success() throws Exception {
        Product product = new Product(1, new Date().getTime()+"c", "aaaa", 1, 10);
        productService.save(product);
    }

    @Test
    public void supplier_add_error() throws Exception {
        Supplier supplier = new Supplier("ncc00001", "NCC 01", "HN", "0123148721312");
        supplierService.save(supplier);
    }

    @Test
    public void supplier_add_success() throws Exception {
        Supplier supplier = new Supplier(new Date().getTime()+"", new Date().getTime()+"", "HN", "0123148721312");
        supplierService.save(supplier);
    }
}