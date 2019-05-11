/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javatmp.processing;

import java.io.File;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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
        String secondFolderName = "C:\\Users\\m_dar\\Downloads\\Process_Articles\\Articles4";
        File source = new File(mainFolderName);
        File input = new File(secondFolderName);
//        List<File> sourceFiles = listFile(source);
//        System.out.println("size of source Files [" + sourceFiles.size() + "]");

        int indx = 0;
//        Map<String, LinkedList<File>> sourceFolders = listFolderName(source);
//        for (String key : sourceFolders.keySet()) {
//            if (sourceFolders.get(key).size() > 1) {
//                System.out.println(++indx + " = " + key + " = " + sourceFolders.get(key));
//            }
//        }

        System.out.println("processing input");
//        Map<String, LinkedList<File>> inputFolders = listFolderName(input);
//        for (String key : inputFolders.keySet()) {
//            if (inputFolders.get(key).size() > 1) {
//                System.out.println(++indx + " = " + key + " = " + inputFolders.get(key));
//            }
//        }

        System.out.println("process sourceFiles ");
        Map<String, LinkedList<File>> sourceFiles = listFileName(source);
        for (String key : sourceFiles.keySet()) {
            if (sourceFiles.get(key).size() > 1) {
//                System.out.println(++indx + " = " + key + " = " + sourceFiles.get(key));
            }
        }

        System.out.println("process inputFile ");
        Map<String, LinkedList<File>> inputFiles = listFileName(input);
        for (String key : inputFiles.keySet()) {
            if (inputFiles.get(key).size() > 1) {
//                System.out.println(++indx + " = " + key + " = " + inputFiles.get(key));
            }
        }

        System.out.println("equality inputFile ");
        for (String key : inputFiles.keySet()) {
            if (sourceFiles.containsKey(key)) {
                System.out.println(++indx + " = " + key + " = " + sourceFiles.get(key));
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
