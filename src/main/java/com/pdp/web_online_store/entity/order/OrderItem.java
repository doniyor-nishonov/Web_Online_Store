package com.pdp.web_online_store.entity.order;

import com.pdp.web_online_store.entity.Auditable;
import com.pdp.web_online_store.entity.product.Product;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.SuperBuilder;


@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class OrderItem extends Auditable {
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Order order;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Product product;

    @Column(nullable = false)
    private int quantity;

    @Column(nullable = false)
    private double price;

    private double total;

    // Ensure total is calculated correctly
    @PrePersist
    @PreUpdate
    public void calculateTotal() {
        this.total = this.quantity * this.price;
    }
}

