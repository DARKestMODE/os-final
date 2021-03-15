package com.example.OSfinal.algorithms;

import com.example.OSfinal.Frame;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Clock {
    private List<String> labels = new ArrayList<>();
    private List<String> accessSequence = new ArrayList<>();
    private List<Frame> buffer = new ArrayList<>();
    private static int index = 0;
    private static int clockIndex = 0;
    private static int counter = 0;

    public Clock() {
        setLabels();
        setAccessSequence();
        setBuffer();
    }

    private void setLabels() {
        labels.add("A");
        labels.add("B");
        labels.add("C");
        labels.add("D");
        labels.add("E");
    }

    public void setAccessSequence() {
        Random r = new Random();
        for (int i = 0; i < 10; i++) {
            String label = labels.get(r.nextInt(labels.size()));
            accessSequence.add(label);
        }
    }

    public void setBuffer() {
        buffer.add(new Frame());
        buffer.add(new Frame());
        buffer.add(new Frame());
        buffer.add(new Frame());
    }

    public void algorithm() {
        boolean isFound = false;
        for (int i = 0; i < 4; i++) {
            int j = clockIndex+i;
            if (j > 3) {
                j %= 4;
            }
            if (buffer.get(j).getLabel().equals(accessSequence.get(index))) {
                isFound = true;
                if (buffer.get(j).getReference() == 0) {
                    buffer.get(j).setReference(1);
                    if (j == 3) j = -1;
                    clockIndex = j+1;
                    break;
                } else {
                    clockIndex = j;
                }
            }
        }
        if (!isFound) {
            int count = 0;
            for (int i = 0; i < 4; i++) {
                int j = clockIndex+i;
                if (j > 3) {
                    j %= 4;
                }
                if (!buffer.get(j).getLabel().equals("")) {
                    count++;
                    continue;
                }
                if (buffer.get(j).getReference() == 1) {
                    buffer.get(j).setReference(0);
                } else {
                    buffer.get(j).setLabel(accessSequence.get(index));
                    break;
                }
            }
            if (count == 4) {
                for (int i = 0; i < 4; i++) {
                    int j = clockIndex+i;
                    if (j > 3) {
                        j %= 4;
                    }
                    if (buffer.get(j).getReference() == 1) {
                        buffer.get(j).setReference(0);
                    } else {
                        buffer.get(j).setLabel(accessSequence.get(index));
                        break;
                    }
                }
            }
        }
        index++;
        if (clockIndex > 3) {
            clockIndex %= 4;
        }
    }

    public List<String> getLabels() {
        return labels;
    }

    public List<String> getAccessSequence() {
        return accessSequence;
    }

    public List<Frame> getBuffer() {
        return buffer;
    }

    public static Integer getIndex() {
        return index;
    }

    public static Integer getClockIndex() {
        return clockIndex;
    }
}
