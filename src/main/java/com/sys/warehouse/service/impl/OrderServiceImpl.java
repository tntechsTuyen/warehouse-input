package com.sys.warehouse.service.impl;

import com.sys.warehouse.dao.OrderRepository;
import com.sys.warehouse.dto.OrderIn;
import com.sys.warehouse.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Override
    public List<OrderIn> getList(OrderIn order) {
        return orderRepository.selectList(order.getIdSupplier());
    }

    @Override
    public void save(OrderIn order) {
        orderRepository.save(order);
    }
}
