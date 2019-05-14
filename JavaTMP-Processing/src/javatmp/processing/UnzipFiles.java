/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javatmp.processing;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.LinkedList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class UnzipFiles {

    public static void main(String[] args) throws IOException {

        String rootFolderStr = "C:\\Users\\m_dar\\Downloads\\Process_Articles\\miscellaneous";

        File rootFolder = new File(rootFolderStr);
//        List<File> sourceFiles = listFile(rootFolder);
//        for (File file : sourceFiles) {
//            if (file.getName().endsWith(".zip")) {
//                System.out.println("File [" + file.getAbsolutePath() + "]");
//                System.out.println("Dir [" + file.getParent() + "]");
////                extractAndDelete(file.getAbsolutePath(), file.getParent());
////                break;
//            }
//        }

        System.out.println("Remove empty folder");
        List<File> dirs = listDir(rootFolder);
        for (File dir : dirs) {
            if (dir.list().length == 0) {
                System.out.println(dir.getAbsolutePath());
                dir.delete();
            }
        }

        System.out.println("display folder");
        for (File dir : dirs) {
            if (dir.getName().contains("-")) {
                System.out.println(dir.getAbsolutePath());
                File newFile = new File(dir.getParent(), dir.getName().replaceAll("-", " ").trim());
                System.out.println("new file [" + newFile.getAbsolutePath() + "]");
                dir.renameTo(newFile);
            }
        }
        if (true) {
            return;
        }
        //removeEmptyFolder(rootFolder);
        System.out.println("list more folders");
        //listMoreDir(rootFolder);

        // rename folders:
        Pattern pattern = Pattern.compile("^(\\d+ |\\d+-|\\d+|-\\d+).*");
        int count = 1;
        for (File f : rootFolder.listFiles()) {
            if (f.isDirectory()) {
//                System.out.println("Rename [" + f.getAbsolutePath() + "]");
                String folderName = f.getName();
//                System.out.println("foldername [" + folderName + "]");
                Matcher matcher = pattern.matcher(folderName);
                if (matcher.matches()) {
                    System.out.println("Rename [" + f.getAbsolutePath() + "]");
                    String grp = matcher.group(1);
                    System.out.println("replace [" + grp + "]");
                    String newFolderName = folderName.replace(grp, "");
                    System.out.println("new folder name [" + newFolderName + "]");

                    File newDir = new File(f.getParent() + File.separator + newFolderName);
                    int ind = 1;
                    while (newDir.exists()) {
                        newDir = new File(f.getParent() + File.separator + newFolderName + " " + (ind++));
                    }
                    System.out.println("exist [" + newDir.getAbsolutePath() + "]");
                    f.renameTo(newDir);
//                    break;
                }

            }
        }

    }

    public static List<File> removeEmptyFolder(File source) {
        List<File> retList = new LinkedList<>();
        int c = 0;
        for (File f : source.listFiles()) {
            if (f.isDirectory()) {
                for (File sub : f.listFiles()) {
                    if (sub.isDirectory()) {
                        System.out.println((++c) + " " + f.getAbsolutePath());
                        retList.add(f);
                    }
                }
            }
        }
        return retList;
    }

    public static List<File> listMoreDir(File source) {
        List<File> retList = new LinkedList<>();
        int c = 0;
        for (File f : source.listFiles()) {
            if (f.isDirectory()) {
                for (File sub : f.listFiles()) {
                    if (sub.isDirectory()) {
                        System.out.println(f.getAbsolutePath());
                        retList.add(f);
                        break;
                    }
                }
            }
        }
        return retList;
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

    public static List<File> listDir(File source) {
        List<File> retList = new LinkedList<>();
        for (File f : source.listFiles()) {
            if (f.isDirectory()) {
                retList.add(f);
                retList.addAll(listDir(f));
            }
        }
        return retList;
    }

    private static void extractAndDelete(String zipFilePath, String destDir) throws IOException {
        unzip(zipFilePath, destDir);

        new File(zipFilePath).delete();
    }

    private static void unzip(String zipFilePath, String destDir)
            throws IOException {
        File dir = new File(destDir);
        // create output directory if it doesn't exist
        if (!dir.exists()) {
            dir.mkdirs();
        }
        FileInputStream fis;
        //buffer for read and write data to file
        byte[] buffer = new byte[1024];
        fis = new FileInputStream(zipFilePath);
        ZipInputStream zis = new ZipInputStream(fis, Charset.forName("UTF-8"));
        ZipEntry ze = zis.getNextEntry();
        while (ze != null) {
            String fileName = ze.getName();
            File newFile = new File(destDir + File.separator + fileName);
//            System.out.println("Unzipping to " + newFile.getAbsolutePath());
            //create directories for sub directories in zip
            new File(newFile.getParent()).mkdirs();
            FileOutputStream fos = new FileOutputStream(newFile);
            int len;
            while ((len = zis.read(buffer)) > 0) {
                fos.write(buffer, 0, len);
            }
            fos.close();
            //close this ZipEntry
            zis.closeEntry();
            ze = zis.getNextEntry();
        }
        //close last ZipEntry
        zis.closeEntry();
        zis.close();
        fis.close();

    }

}
