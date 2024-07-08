package com.pdp.web_online_store.entity.order;

import com.pdp.web_online_store.entity.Auditable;
import com.pdp.web_online_store.entity.customer.Customer;
import com.pdp.web_online_store.entity.user.Users;
import com.pdp.web_online_store.enums.PaymentType;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

import java.util.ArrayList;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class Order extends Auditable {
    private int quantity;
    private double totalPrice;

    @OneToOne(fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    private Customer customer;

    private boolean isPaid;
    private boolean isDelivered;

    private String deliveryAddress;

    private String orderDate;
    private String deliveryDate;

    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<OrderItem> orderItems = new ArrayList<>();

    // Ensure totalPrice is calculated based on OrderItems
    @PrePersist
    @PreUpdate
    public void calculateTotals() {
        this.quantity = this.orderItems.stream().mapToInt(OrderItem::getQuantity).sum();
        this.totalPrice = this.orderItems.stream().mapToDouble(OrderItem::getTotal).sum();
    }
}

