package com.sys.warehouse.service;

import com.sys.warehouse.dto.OrderIn;
import com.sys.warehouse.dto.OrderInDetail;

import java.util.*;

public interface IOrderDetailService {

    List<Map<String, Object>> selectList(OrderInDetail orderInDetail);

    OrderInDetail save(OrderInDetail orderInDetail);

    void delete(OrderInDetail orderInDetail);
}
