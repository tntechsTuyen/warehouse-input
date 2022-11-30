package com.sys.warehouse.controller;

import com.sys.warehouse.dto.Product;
import com.sys.warehouse.service.IProductService;
import com.sys.warehouse.utils.UrlUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductService productService;

    @PostMapping("/add")
    public String doAdd(HttpServletRequest request, @ModelAttribute("productForm")Product product) throws Exception {
        productService.save(product);
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }
}
