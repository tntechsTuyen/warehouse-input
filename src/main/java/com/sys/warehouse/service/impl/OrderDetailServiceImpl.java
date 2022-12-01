package com.sys.warehouse.service.impl;

import com.sys.warehouse.dao.OrderDetailRepository;
import com.sys.warehouse.dao.OrderRepository;
import com.sys.warehouse.dto.OrderInDetail;
import com.sys.warehouse.service.IOrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrderDetailServiceImpl implements IOrderDetailService {

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Override
    public List<Map<String, Object>> selectList(OrderInDetail orderInDetail) {
        return orderDetailRepository.selectList(orderInDetail.getIdOrderIn());
    }

    @Override
    public OrderInDetail save(OrderInDetail orderInDetail) {
        orderDetailRepository.save(orderInDetail);
        orderRepository.updatePrice(orderInDetail.getIdOrderIn());
        return orderInDetail;
    }

    @Override
    public void delete(OrderInDetail orderInDetail) {
        orderDetailRepository.deleteById(orderInDetail.getId());
        orderRepository.updatePrice(orderInDetail.getIdOrderIn());
    }
}
