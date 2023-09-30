package com.example.springboot2.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class StaffMember {
    private String employeeId;
    private String firstName;
    private String lastName;
    private Position position;
}