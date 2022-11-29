package com.sys.warehouse.service;


import com.sys.warehouse.dto.OrderIn;

import java.util.List;

public interface IOrderService {

    List<OrderIn> getList(OrderIn order);

    void save(OrderIn order);
}
