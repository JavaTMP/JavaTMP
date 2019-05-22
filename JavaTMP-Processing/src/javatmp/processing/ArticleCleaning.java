/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javatmp.processing;

import java.io.File;
import java.io.FileFilter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author JavaTMP
 */
public class ArticleCleaning {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        String mainFolderName = "C:\\Users\\m_dar\\Downloads\\Process_Articles\\Articles1";
        String secondFolderName = "C:\\Users\\m_dar\\Downloads\\Process_Articles\\miscellaneous";
//        secondFolderName = "C:\\Users\\m_dar\\Downloads\\Process_Articles\\Articles1\\Arts_Entertainment";
        File source = new File(mainFolderName);
        File input = new File(secondFolderName);
        List<File> sourceTraversal = listFile(source);
        File[] inputFolder = input.listFiles(new FileFilter() {
            @Override
            public boolean accept(File pathname) {
                return pathname.isDirectory();
            }
        });

        for (File i : inputFolder) {
            String currentFolderName = i.getName();
//            String newFolderName = i.getName().replaceAll("([A-Z])", " $1").trim();
            String newFolderName = "";
            for (int currIndx = 0; currIndx < currentFolderName.length(); currIndx++) {
                if (currIndx > 0 && Character.isUpperCase(currentFolderName.charAt(currIndx))
                        && !Character.isUpperCase(currentFolderName.charAt(currIndx - 1)) && currentFolderName.charAt(currIndx - 1) != ' ') {
                    newFolderName += " " + currentFolderName.charAt(currIndx);
                } else {
                    newFolderName += currentFolderName.charAt(currIndx);
                }
            }
            if (currentFolderName.equals(newFolderName) == false) {
                System.out.println("old [" + currentFolderName + "], new [" + newFolderName + "]");
                File newFile = new File(secondFolderName, newFolderName);
                boolean ans = i.renameTo(newFile);
                System.out.println("ans [" + ans + "]");

            }
        }

        if (true) {
            return;
        }

//        Set<String> foldersName = new HashSet<String>();
//        for (File i : inputFolder) {
//            foldersName.add(i.getName());
//        }
//        System.out.println("foldersName [" + foldersName + "]");
//        System.out.println("size of source Files [" + sourceTraversal.size() + "]");
//        int c = 0;
//        for (File f : sourceTraversal) {
//            if (foldersName.contains(f.getParentFile().getName())) {
//                System.out.println("found [" + f + "]");
//            }
//
//        }
//
//        if (true) {
//            return;
//        }
        int indx = 0;
//        Map<String, LinkedList<File>> sourceFolders = listFolderName(source);
//        for (String key : sourceFolders.keySet()) {
//            if (sourceFolders.get(key).size() > 1) {
//                System.out.println(++indx + " = " + key + " = " + sourceFolders.get(key));
//            }
//        }
        indx = 0;
        System.out.println("processing input");
//        Map<String, LinkedList<File>> inputFolders = listFolderName(input);
//        for (String key : inputFolders.keySet()) {
//            if (inputFolders.get(key).size() > 1) {
//                System.out.println(++indx + " = " + key + " = " + inputFolders.get(key));
//            }
//        }
        indx = 0;
        System.out.println("process sourceFiles ");
        Map<String, LinkedList<File>> sourceFiles = null;
//        sourceFiles = listFileName(source);
//        for (String key : sourceFiles.keySet()) {
//            if (sourceFiles.get(key).size() > 1) {
//                System.out.println(++indx + " = " + key);
//                for (File f : sourceFiles.get(key)) {
//                    System.out.println(f);
//                }
//            }
//        }
        indx = 0;
        File temp = new File("C:\\Users\\m_dar\\Downloads\\Process_Articles\\duplicate5");
        System.out.println("process inputFile ");
        Map<String, LinkedList<File>> inputFiles = listFileName(input);
        for (String key : inputFiles.keySet()) {
            if (inputFiles.get(key).size() > 1) {
                System.out.println(++indx + " = " + key);
                for (File f : inputFiles.get(key)) {
                    System.out.println(f);
//                    System.out.println("parent [" + f.getParent() + "]");
                    if (f.getParent().endsWith("miscellaneous\\niche")) {
                        // copy this to temp:
                        File newFile = new File(temp, f.getName());
                        f.renameTo(newFile);
                    }
                }
            }
        }
        if (true) {
            return;
        }
        // clean doc if exist txt:
//        int del = 0;
//        for (String str : inputFiles.keySet()) {
//            System.out.println(str);
//            for (File f : inputFiles.get(str)) {
//                if (f.exists() && f.getAbsolutePath().endsWith(".doc")) {
//                    System.out.println(f.getAbsolutePath());
//                    String ss = f.getAbsolutePath().replace(".doc", ".txt");
//                    File s = new File(ss);
//                    if (s.exists()) {
//                        System.out.println("Delete file : " + f.getAbsolutePath());
//                        f.delete();
//                        del++;
//                    }
//                }
//            }
//        }
//        System.out.println("delete count [" + del + "]");

        indx = 0;
        System.out.println("equality inputFile ");
        for (String key : inputFiles.keySet()) {
            if (sourceFiles.containsKey(key)) {
                System.out.println(++indx + " = " + key);
                for (File f : inputFiles.get(key)) {
                    System.out.println(f);
                    // check too for doc:
                    String fStr = null;
                    if (f.getAbsolutePath().endsWith(".txt")) {
                        fStr = f.getAbsolutePath().replace(".txt", ".doc");
                    } else if (f.getAbsolutePath().endsWith(".doc")) {
                        fStr = f.getAbsolutePath().replace(".doc", ".txt");
                    } else if (f.getAbsolutePath().endsWith(".rtf")) {
                        fStr = f.getAbsolutePath().replace(".rtf", ".txt");
                    } else {
                        System.out.println("ERROR = " + f.getAbsolutePath());
                    }
                    File t = new File(fStr);
                    if (t.exists()) {
                        t.delete();
                        System.out.println("delete too file [" + t.getAbsolutePath() + "]");
                    }
                    System.out.println("delete file [" + f.getAbsolutePath() + "]");
                    f.delete();
                }
                System.out.println("***********");
                for (File f : sourceFiles.get(key)) {
                    System.out.println(f);
                }
            }
        }

    }

    public static List<File> listFile(File source) {
        List<File> retList = new LinkedList<>();
        for (File f : source.listFiles()) {
            if (f.isDirectory()) {
                retList.addAll(listFile(f));
            } else {
//                System.out.println(f.getAbsolutePath().substring(52));
                retList.add(f);
            }
        }
        return retList;
    }

    public static Map<String, LinkedList<File>> listFolderName(File source) {
        Map<String, LinkedList<File>> retList = new HashMap<String, LinkedList<File>>();
        LinkedList<File> list = new LinkedList<>();
        list.add(source);
        retList.put(source.getName(), list);
        for (File f : source.listFiles()) {
            if (f.isDirectory()) {
                Map<String, LinkedList<File>> temp = listFolderName(f);
                for (String key : temp.keySet()) {
                    if (retList.containsKey(key)) {
                        retList.get(key).addAll(temp.get(key));
                    } else {
                        retList.put(key, temp.get(key));
                    }
                }

            }
        }
        return retList;
    }

    public static Map<String, LinkedList<File>> listFileName(File source) {
        Map<String, LinkedList<File>> retList = new HashMap<String, LinkedList<File>>();

        for (File f : source.listFiles()) {
            if (f.isDirectory()) {
                Map<String, LinkedList<File>> temp = listFileName(f);
                for (String key : temp.keySet()) {
                    if (retList.containsKey(key)) {
                        retList.get(key).addAll(temp.get(key));
                    } else {
                        retList.put(key, temp.get(key));
                    }
                }
            } else if (f.isFile()) {
                if (retList.containsKey(f.getName())) {
                    retList.get(f.getName()).add(f);
                } else {
                    LinkedList<File> list = new LinkedList<>();
                    list.add(f);
                    retList.put(f.getName(), list);
                }
            } else {
                System.out.println("neither file or dir [" + f.getAbsolutePath() + "]");
            }
        }
//        System.out.println("Return Map [" + retList + "]");
        return retList;
    }

}
