package com.example.OSfinal;

public class Frame {
    private String label;
    private Integer reference;

    public Frame() {
        label = "";
        reference = 0;
    }

    public Frame(String label, Integer reference) {
        this.label = label;
        this.reference = reference;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Integer getReference() {
        return reference;
    }

    public void setReference(Integer reference) {
        this.reference = reference;
    }
}
