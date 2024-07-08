package com.pdp.web_online_store.service.orders;

import com.pdp.web_online_store.dao.order.OrderItemDAO;
import com.pdp.web_online_store.entity.order.OrderItem;
import com.pdp.web_online_store.service.BaseService;

public interface OrderItemService extends BaseService<OrderItem, String> {
    OrderItemDAO orderItemDAO = new OrderItemDAO();

}
