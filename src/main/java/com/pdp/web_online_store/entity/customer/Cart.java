package com.pdp.web_online_store.entity.customer;

import com.pdp.web_online_store.entity.Auditable;
import com.pdp.web_online_store.entity.address.Address;
import com.pdp.web_online_store.entity.user.Users;
import com.pdp.web_online_store.enums.PaymentType;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class Cart extends Auditable {

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false) // Corrected annotation
    private Users users;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Address address;

    @Builder.Default
    @Column(name = "is_paid")
    private boolean isPaid = false;

    @Enumerated(EnumType.STRING)
    private PaymentType paymentType;

    @Enumerated(EnumType.STRING)
    private OrderStatus orderStatus;

    public enum OrderStatus {
        NEW,
        IN_PROGRESS,
        DELIVERED
    }
}
