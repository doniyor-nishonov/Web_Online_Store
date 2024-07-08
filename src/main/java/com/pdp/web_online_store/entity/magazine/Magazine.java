package com.pdp.web_online_store.entity.magazine;

import com.pdp.web_online_store.entity.Auditable;
import com.pdp.web_online_store.entity.address.Address;
import com.pdp.web_online_store.entity.user.Users;
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
public class Magazine extends Auditable {
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Users users;
    private String name;
    private String description;
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Address address;
}
