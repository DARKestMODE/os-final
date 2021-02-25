package com.example.OSfinal.algorithms;

import com.example.OSfinal.Block;

import java.util.ArrayList;
import java.util.List;

public class BestFit {
    private List<Block> processes = new ArrayList<>();

    public BestFit() {
        setProcesses();
    }

    private void setProcesses() {
        int total = 0;
        int maximum = 1024;
        for (int i = 0; i < 8; i++) {
            int a = (i % 2) == 0 ? (int) (Math.random() * 492 + 20) : (int) (Math.random() * 108 + 20);
            maximum -= a;
            if (maximum >= 0) {
                total += a;
                processes.add(new Block(a));
            } else break;
        }
        processes.add(new Block(1024 - total));
    }

    public List<Block> getProcesses() {
        return processes;
    }

    public Integer algorithm(int block) {
        Integer index = null;
        int min = 1024;
        for (int i = 0; i < processes.size(); i++) {
            if (i % 2 == 0 &&
                    processes.get(i).getValue() - processes.get(i).getUsedSpace() - block < min &&
                    processes.get(i).getValue() - processes.get(i).getUsedSpace() - block >= 0) {
                min = processes.get(i).getValue() - processes.get(i).getUsedSpace() - block;
                index = i;
            }
        }
        return index;
    }

    public void resetProcesses() {
        for (Block block: processes) {
            block.add(block.getUsedSpace()*(-1));
        }
    }
}

