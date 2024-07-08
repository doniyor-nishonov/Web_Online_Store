package com.pdp.web_online_store.entity.address;

import com.pdp.web_online_store.entity.Auditable;
import jakarta.persistence.Entity;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.time.LocalDateTime;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@SuperBuilder(toBuilder = true)
public class Address extends Auditable {
    private String city;
    private String district;
    private String street;
    private String houseNumber;
    private String phoneNumber;
}

