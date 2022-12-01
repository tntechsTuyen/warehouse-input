package com.sys.warehouse.controller;

import com.sys.warehouse.dto.OrderInDetail;
import com.sys.warehouse.service.IOrderDetailService;
import com.sys.warehouse.utils.UrlUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/order/detail")
public class OrderDetailController {

    @Autowired
    private IOrderDetailService orderDetailService;

    @GetMapping("/remove")
    public String doRemove(HttpServletRequest request, OrderInDetail orderInDetail){
        orderDetailService.delete(orderInDetail);
        return UrlUtils.getPreviousPageByRequest(request).orElse("/");
    }
}
