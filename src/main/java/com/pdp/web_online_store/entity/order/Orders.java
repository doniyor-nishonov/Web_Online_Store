package com.pdp.web_online_store.entity.order;

import com.pdp.web_online_store.entity.Auditable;
import com.pdp.web_online_store.entity.customer.Customer;
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
public class Orders extends Auditable {
    private int quantity;
    private double totalPrice;

    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(
            name = "customer_orders",
            joinColumns = @JoinColumn(name = "order_id"),
            inverseJoinColumns = @JoinColumn(name = "customer_id")
    )
    private List<Customer> customers = new ArrayList<>();

    private boolean isPaid;
    private boolean isDelivered;

    private String deliveryAddress;

    private String orderDate;
    private String deliveryDate;

    @OneToMany(mappedBy = "orders", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<OrderItem> orderItems = new ArrayList<>();

    // Ensure totalPrice is calculated based on OrderItems
    @PrePersist
    @PreUpdate
    public void calculateTotals() {
        this.quantity = this.orderItems.stream().mapToInt(OrderItem::getQuantity).sum();
        this.totalPrice = this.orderItems.stream().mapToDouble(OrderItem::getTotal).sum();
    }
}
