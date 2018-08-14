package com.famgy.firstjavaweb.workstation;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class PfileService {
    static private ArrayList<Pfile> pfileList = new ArrayList<>();
    static private StringBuffer loggingBuffer = new StringBuffer("Android apk packaged logging: \n");

    static public void AndroidApkPackage(String apkFilePath, String outPath)
    {
//        String cmd = "/bin/cat /home/famgy/Project/JavaWeb/my-first-javaweb/build/libs/exploded/my-first-javaweb-1.0-SNAPSHOT.war/WEB-INF/upload/tmp.txt";
//        String[] cmds = {"/bin/sh", "-c", cmd};

        String cmd = "/home/famgy/Source/Android/package/patch-noOrigin.sh " + apkFilePath + " " + outPath;
        String[] cmds = {"/bin/sh", "-c", cmd};

        String s = null;
        loggingBuffer.setLength(0);
        loggingBuffer.append("Android apk packaged logging: \n\n");
        try {
            Process cps = Runtime.getRuntime().exec(cmds);

            BufferedReader stdInput = new BufferedReader(new InputStreamReader(cps.getInputStream()));
            BufferedReader stdError = new BufferedReader(new InputStreamReader(cps.getErrorStream()));
            while ((s = stdInput.readLine()) != null) {
                System.out.println("INFO: " + s);
                loggingBuffer.append("INFO: " + s + "\n");
            }
            while ((s = stdError.readLine()) != null) {
                System.out.println("EROOR: " + s);
                loggingBuffer.append("EROOR: " + s + "\n");
            }

            System.out.println("result: " + cps.waitFor());
            loggingBuffer.append("\nresult: " + cps.waitFor());
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    static public StringBuffer getLastPackageLogging()
    {
        return loggingBuffer;
    }

    static public ArrayList<Pfile> getPfileList(String filePath)
    {
        File file = new File(filePath);
        File[] files = file.listFiles();

        if (files != null)
        {
            pfileList.clear();
            for(File f : files) {
                if (f.isFile()) {
                    pfileList.add(new Pfile(f.getName(), f.length()));
                }
            }
        }

        return pfileList;
    }

    static public ArrayList<Pfile> getPfileListFilter(String filePath, String fileter)
    {
        File file = new File(filePath);
        File[] files = file.listFiles();

        if (files != null)
        {
            pfileList.clear();
            for(File f : files) {
                if ((f.isFile()) == true && f.getName().contains(fileter) == true){
                    pfileList.add(new Pfile(f.getName(), f.length()));
                }
            }
        }

        return pfileList;
    }

//    public static void main(String[] args) {
//        AndroidApkPackage(" /home/famgy/Project/JavaWeb/my-first-javaweb/build/libs/exploded/my-first-javaweb-1.0-SNAPSHOT.war/WEB-INF/upload/strongSwan-2.0.1.apk",
//                "/home/famgy/Project/JavaWeb/my-first-javaweb/build/libs/exploded/my-first-javaweb-1.0-SNAPSHOT.war/WEB-INF/pakaged");
//    }
}
