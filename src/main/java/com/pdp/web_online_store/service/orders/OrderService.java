package com.pdp.web_online_store.service.orders;

import com.pdp.web_online_store.dao.order.OrderDAO;
import com.pdp.web_online_store.entity.order.Orders;
import com.pdp.web_online_store.service.BaseService;

public interface OrderService extends BaseService<Orders, String> {
    OrderDAO orderDAO = new OrderDAO();
}
