package com.example.OSfinal;

import java.util.ArrayList;
import java.util.List;

public class Block {
    private Integer value;
    private Integer usedSpace;

    public Block(Integer value) {
        this.value = value;
        usedSpace = 0;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public Integer getUsedSpace() {
        return usedSpace;
    }

    public void add(Integer usedSpace) {
        this.usedSpace += usedSpace;
    }
}
