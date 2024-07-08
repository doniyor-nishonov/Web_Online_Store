package com.pdp.web_online_store.entity.customer;

import com.pdp.web_online_store.entity.Auditable;
import com.pdp.web_online_store.entity.address.Address;
import com.pdp.web_online_store.entity.user.Users;
import com.pdp.web_online_store.enums.PaymentType;
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
public class Customer extends Auditable {
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Users users;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Address address;

    @Enumerated(EnumType.STRING)
    private PaymentType paymentType;

    @Enumerated(EnumType.STRING)
    private OrderStatus orderStatus;

    private enum OrderStatus{
        NEW,
        IN_PROGRESS,
        DELIVERED
    }
}
