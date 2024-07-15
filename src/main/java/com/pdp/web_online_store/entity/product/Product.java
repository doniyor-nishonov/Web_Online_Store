package com.pdp.web_online_store.entity.product;

import com.pdp.web_online_store.entity.Auditable;
import com.pdp.web_online_store.entity.store.Store;
import com.pdp.web_online_store.entity.picture.Picture;
import com.pdp.web_online_store.enums.Category;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;


@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class Product extends Auditable {
    @Column(nullable = false)
    private String name;
    @Column(nullable = false, columnDefinition = "text")
    private String description;
    private double price;

    @ManyToOne
    private Store store;

    @Enumerated(EnumType.STRING)
    private Category category;

    private int stockQuantity;

    @OneToOne(cascade = CascadeType.ALL)
    private Picture picture;
}
