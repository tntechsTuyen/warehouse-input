package com.sys.warehouse.service;


import com.sys.warehouse.dto.OrderIn;

import java.util.*;

public interface IOrderService {

    List<OrderIn> getList(OrderIn order);

    Map<String, Object> getInfo(Integer id);

    void save(OrderIn order);

    void updateStatus(Integer id);
}
