package com.pdp.web_online_store.entity.user;

import com.pdp.web_online_store.entity.Auditable;
import com.pdp.web_online_store.entity.address.Address;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class Users extends Auditable {
    private String fullName;

    @Column(unique = true, nullable = false)
    private String email;

    @Column(nullable = false)
    private String password;

    private String phoneNumber;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Address address;

    @Enumerated(EnumType.STRING)
    private Role role;

    @Enumerated(EnumType.STRING)
    private Status status;

    public enum Status {
        IN_ACTIVE,
        ACTIVE,
        BLOCKED
    }

    public enum Role {
        ADMIN, USER, SELLER
    }
}
