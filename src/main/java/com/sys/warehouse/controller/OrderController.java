package com.sys.warehouse.controller;

import com.sys.warehouse.dto.OrderIn;
import com.sys.warehouse.dto.OrderInDetail;
import com.sys.warehouse.dto.Product;
import com.sys.warehouse.service.IOrderDetailService;
import com.sys.warehouse.service.IOrderService;
import com.sys.warehouse.service.IProductService;
import com.sys.warehouse.utils.UrlUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private IOrderService orderService;

    @Autowired
    private IProductService productService;

    @Autowired
    private IOrderDetailService orderDetailService;

    @GetMapping("")
    public String goList(Model model, OrderIn search){
        model.addAttribute("list", orderService.getList(search));
        return "order/list";
    }

    @GetMapping("/add")
    public String goAdd(Model model, OrderIn search){
        model.addAttribute("products", productService.getList(new Product(search.getIdSupplier())));
        model.addAttribute("orderDetails", orderDetailService.selectList(new OrderInDetail(search.getId())));
        model.addAttribute("orderInfo", orderService.getInfo(search.getId()));
        model.addAttribute("idOrder", search.getId());
        model.addAttribute("idSupplier", search.getIdSupplier());
        model.addAttribute("productForm", new Product(search.getIdSupplier()));
        return "order/add";
    }

    @PostMapping("/add")
    public String doAdd(HttpServletRequest request, OrderInDetail orderInDetail, OrderIn order){

        if(orderInDetail.getIdOrderIn() == null || orderInDetail.getIdOrderIn() == 0){
            order.setCode(new Date().getTime()+"");
            order.setIdStatus(1);
            order.setTotalPrice(orderInDetail.getQty() * orderInDetail.getPrice());
            orderService.save(order);
            orderInDetail.setIdOrderIn(order.getId());
        }
        if(order.getId() == null || order.getId() == 0){
            order.setId(orderInDetail.getIdOrderIn());
        }
        orderDetailService.save(orderInDetail);
        return String.format("redirect: /order/add?idSupplier=%d&id=%d", order.getIdSupplier(), order.getId());
    }

    @GetMapping("/save")
    public String doSave(HttpServletRequest request,@RequestParam("id") Integer id){
        orderService.updateStatus(id);
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }
}
