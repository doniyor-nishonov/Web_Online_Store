package com.pdp.web_online_store.service.orders;

import com.pdp.web_online_store.dao.order.OrderDAO;
import com.pdp.web_online_store.entity.customer.Cart;
import com.pdp.web_online_store.entity.order.Orders;
import com.pdp.web_online_store.service.BaseService;

import java.util.List;

public interface OrderService extends BaseService<Orders, String> {
    OrderDAO orderDAO = new OrderDAO();

    Orders getOrCreate(Orders order, Cart cart);

    List<Orders> findAllOrdersByCartId(String cartID);
}
