package com.famgy.firstjavaweb.workstation;

public class Pfile {
    private String name;
    private Long size;

    public Pfile(String name, long size) {
        this.name = name;
        this.size = size;
    }

    public String getName() {
        return name;
    }

    public Long getSize() {
        return size;
    }
}
