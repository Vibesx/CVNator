package com.leon.CVNator.enums;

/**
 * Created by Leon on 6/2/2016.
 */
public enum Gender {
    MALE("Male"),
    FEMALE("Female");

    private String value;

    Gender(String value) {
        this.value = value;
    }

    public String getValue() {
        return this.value;
    }

    @Override
    public String toString() {
        return this.value;
    }
}
