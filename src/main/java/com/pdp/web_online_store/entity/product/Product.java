package com.pdp.web_online_store.entity.product;

import com.pdp.web_online_store.entity.Auditable;
import com.pdp.web_online_store.entity.picture.Picture;
import com.pdp.web_online_store.enums.Category;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.time.LocalDateTime;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class Product extends Auditable {
    private String name;
    private String description;
    private double price;

    @Enumerated(EnumType.STRING)
    private Category category;

    private int stockQuantity;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Picture picture;
}
