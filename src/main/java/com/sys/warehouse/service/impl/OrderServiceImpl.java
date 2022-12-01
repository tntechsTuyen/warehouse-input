package com.sys.warehouse.service.impl;

import com.sys.warehouse.dao.OrderRepository;
import com.sys.warehouse.dto.OrderIn;
import com.sys.warehouse.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class OrderServiceImpl implements IOrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Override
    public List<OrderIn> getList(OrderIn order) {
        return orderRepository.selectList(order.getIdSupplier());
    }

    @Override
    public Map<String, Object> getInfo(Integer id) {
        return (id != null) ? orderRepository.selectInfoById(id) : null;
    }

    @Override
    public void save(OrderIn order) {
        orderRepository.save(order);
    }

    @Override
    public void updateStatus(Integer id) {
        Optional<OrderIn> ood = orderRepository.findById(id);
        if(ood.isPresent()){
            OrderIn oi = ood.get();
            oi.setIdStatus(2);
            orderRepository.save(oi);
        }
    }
}
