package com.pdp.web_online_store.entity.order;

import com.pdp.web_online_store.entity.Auditable;
import com.pdp.web_online_store.entity.customer.Cart;
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
public class Orders extends Auditable {
    @ManyToOne
    private Cart cart;

    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

    private int quantity;
    private double totalPrice;

}
