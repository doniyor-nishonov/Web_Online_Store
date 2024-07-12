package com.pdp.web_online_store.entity.magazine;

import com.pdp.web_online_store.entity.Auditable;
import com.pdp.web_online_store.entity.address.Address;
import com.pdp.web_online_store.entity.product.Product;
import com.pdp.web_online_store.entity.user.Users;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class Magazine extends Auditable {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "users_id", referencedColumnName = "id")
    private Users users;

    private String name;
    private String description;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Address address;

    @OneToMany(mappedBy = "magazine", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Product> products;
}
