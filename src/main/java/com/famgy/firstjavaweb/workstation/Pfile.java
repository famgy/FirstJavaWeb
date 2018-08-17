package com.famgy.firstjavaweb.workstation;

import java.text.DecimalFormat;

public class Pfile {
    private String name;
    private String size;

    public Pfile(String name, long size) {
        this.name = name;
        this.size = FormetFileSize(size);
    }

    public String getName() {
        return name;
    }

    public String getSize() {
        return size;
    }

    public String FormetFileSize(long fileSize) {
        DecimalFormat df = new DecimalFormat("#.00");
        String fileSizeString = "";
        if (fileSize < 1024) {
            fileSizeString = df.format((double) fileSize) + "B";
        } else if (fileSize < 1048576) {
            fileSizeString = df.format((double) fileSize / 1024) + "K";
        } else if (fileSize < 1073741824) {
            fileSizeString = df.format((double) fileSize / 1048576) + "M";
        } else {
            fileSizeString = df.format((double) fileSize / 1073741824) +"G";
        }
        return fileSizeString;
    }
}
