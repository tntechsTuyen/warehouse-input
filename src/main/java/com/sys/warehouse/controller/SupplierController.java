package com.sys.warehouse.controller;

import com.sys.warehouse.dto.OrderIn;
import com.sys.warehouse.dto.Supplier;
import com.sys.warehouse.service.IOrderService;
import com.sys.warehouse.service.ISupplierService;
import com.sys.warehouse.utils.UrlUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/supplier")
public class SupplierController {

    @Autowired
    private ISupplierService supplierService;

    @Autowired
    private IOrderService orderService;

    @GetMapping("")
    public String goSupplier(Model model, Supplier search){
        model.addAttribute("search", search);
        model.addAttribute("list", supplierService.getList(search));
        model.addAttribute("supplierForm", new Supplier("", search.getName()));
        return "supplier/list";
    }

    @PostMapping(path = "", consumes = {MediaType.APPLICATION_FORM_URLENCODED_VALUE})
    public String doSupplier(HttpServletRequest request, @ModelAttribute("supplierForm") Supplier supplier) throws Exception {
        supplier.setName(supplier.getName().split(",")[0]);
        supplierService.save(supplier);
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }
}
