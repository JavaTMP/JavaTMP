package com.javatmp.module.dms.controller;

import com.javatmp.JavaTmpAppStarterApplication;
import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.util.Constants;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.service.DocumentService;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.system.ApplicationHome;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.text.ParseException;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;

@Slf4j
@RestController
@RequestMapping("/dms")
public class FileManagerPageController {

    @Autowired
    DocumentService documentService;

    @Autowired
    UserService userService;

    @PostMapping("/FileManagerPageController")
    public DataTableResults<Document> fileManagerPageController(@RequestBody DataTableRequest tableRequest) throws ParseException {
        log.info("request Page for file manager is [" + (tableRequest) + "]");
        DataTableResults<Document> documents = this.documentService.getAllDocuments(tableRequest);
        return documents;
    }

    @PostMapping("/FolderBrowser")
    public DataTableResults<Document> folderBrowser() throws ParseException {
        DataTableResults<Document> dataTableResult = documentService.retrieveFoldersDocument();
        return dataTableResult;
    }

    @PostMapping("/fileBrowser")
    public List<Map<String, Object>> fileBrowser(String parent) throws IOException {

        if (parent.contains("..")) {
            // This is a security check
            throw new IllegalArgumentException("Cannot process relative path" + parent);
        }

        log.info("parent [" + parent + "] ");

        List<Map<String, Object>> files = new LinkedList<>();
        URL resource = ClassLoader.getSystemClassLoader().getResource("");
        if(resource != null) {
            String basePath = resource.getPath();
            File file = new File(basePath, parent);
            log.info("basePath [" + basePath + "]");
            log.info("file [" + file.getAbsolutePath() + "]");

            File[] children = file.listFiles();
            Arrays.sort(children, new Comparator<File>() {
                @Override
                public int compare(File o1, File o2) {
                    File f1 = (File) o1;
                    File f2 = (File) o2;
                    if (f1.isDirectory() && !f2.isDirectory()) {
                        // Directory before non-directory
                        return -1;
                    } else if (!f1.isDirectory() && f2.isDirectory()) {
                        // Non-directory after directory
                        return 1;
                    } else {
                        // Alphabetic order otherwise
                        return o1.compareTo(o2);
                    }
                }
            });
            for (File item : children) {
                log.debug("item file absolute path [" + item.getAbsolutePath() + "]");
                Map<String, Object> myMap = new HashMap<>();
                myMap.put("title", item.getName());
                myMap.put("size", item.length());
                if (item.isDirectory()) {
                    myMap.put("folder", item.isDirectory());
                    myMap.put("lazy", item.isDirectory());
                    myMap.put("expanded", !item.isDirectory());
                    myMap.put("logicalPath", item.getAbsolutePath().substring(basePath.length() - 1));
                }
                log.debug("item is {}", myMap);
                files.add(myMap);
            }
        } else {
            ApplicationHome home = new ApplicationHome(JavaTmpAppStarterApplication.class);
            System.out.println("home get dir [" + home.getDir() + "]");    // returns the folder where the jar is. This is what I wanted.
            System.out.println("home getSource [" + home.getSource() + "]"); // returns the jar absolute path.

            JarFile jarFile = new JarFile(home.getSource());
            Enumeration<JarEntry> entries = jarFile.entries();

            Node root = new Node();
            while (entries.hasMoreElements()) {
                JarEntry entry = entries.nextElement();

                String[] filePathParts = entry.getName().split("/");
                log.debug("file parts is : {}", Arrays.toString(filePathParts));

                Node pointer = root;
                for(int i = 0; i < filePathParts.length; i++) {
                    String name = filePathParts[i];
                    Node node = new Node();
                    node.setTitle(name);
                    Node exist = null;
                    if((exist = pointer.getChildren().get(node)) != null) {
                        pointer = exist;
                    } else {
                        pointer.getChildren().put(node, node);
                        pointer = node;
                    }

                    if(i == (filePathParts.length - 1)) {
                        pointer.setSize(entry.getSize());
                    }

                }

            }

            Node pointer = root;
            parent = parent.substring(1);
            if(!parent.equals("")) {
                // traverse tree:
                String[] filePathParts = parent.split("/");
                log.debug("file parts is : {}", Arrays.toString(filePathParts));
                for(String part : filePathParts) {
                    Node temp = new Node();
                    temp.setTitle(part);
                    pointer = pointer.getChildren().get(temp);
                }
                parent = "/" + parent;
            }
            for(Node node : pointer.getChildren().keySet()) {
                System.out.println(node.getTitle() + " , " + node.getSize() + " , " + node.getChildren().size());
                Map<String, Object> myMap = new HashMap<>();
                myMap.put("title", node.getTitle());
                myMap.put("size", node.getSize());
                myMap.put("folder", false);
                if (node.getChildren().size() > 0) {
                    myMap.put("folder", true);
                    myMap.put("lazy", true);
                    myMap.put("expanded", false);
                    myMap.put("logicalPath", parent + "/" + node.getTitle());
                }
                log.debug("item is {}", myMap);
                files.add(myMap);
            }
            files.sort(new Comparator<Map<String, Object>>() {
                @Override
                public int compare(Map<String, Object> o1, Map<String, Object> o2) {
                    if (new Boolean(o1.get("folder").toString()) && !new Boolean(o2.get("folder").toString())) {
                        // Directory before non-directory
                        return -1;
                    } else if (!new Boolean(o1.get("folder").toString()) && new Boolean(o2.get("folder").toString())) {
                        // Non-directory after directory
                        return 1;
                    } else {
                        // Alphabetic order otherwise
                        return o1.get("title").toString().compareTo(o2.get("title").toString());
                    }
                }
            });
        }
        return files;
    }

    @PostMapping("/updateProfilePhoto")
    public ResponseMessage updateProfilePhoto(
            @SessionAttribute(Constants.LOG_IN_USER_NAME) User loggedInUser,
            ResponseMessage responseMessage,
            HttpServletRequest request) throws IOException {

        int nRead;
        byte[] data = new byte[4 * 1024];
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        while ((nRead = request.getInputStream().read(data, 0, data.length)) != -1) {
            baos.write(data, 0, nRead);
        }
        String buffer = baos.toString();
        String base64Head = "base64,";
        int indexOfBase64 = buffer.indexOf(base64Head);
        String base64Image = buffer.substring(indexOfBase64 + base64Head.length());
        System.out.println(base64Image);
        String dataHead = "data:";
        String contentType = buffer.substring(dataHead.length(), indexOfBase64);
        System.out.println(contentType);
        byte[] imageData = Base64.getDecoder().decode(base64Image);
        Document fileUploading = new Document();
        fileUploading.setDocumentName("profile picture");
        fileUploading.setContentType(contentType);
        fileUploading.setDocumentContent(imageData);
        fileUploading.setDocumentType((short) 1);
        fileUploading.setStatus((short) 1);
        fileUploading.setCreationDate(new Date());
        fileUploading.setDocumentSize(imageData.length);
        long randomLongValue = Double.valueOf((Math.random() + 1) * 1000L).longValue();
        fileUploading.setRandomHash((Long) Math.abs(buffer.hashCode() + randomLongValue));
        fileUploading.setCreatedByUserId(loggedInUser.getId());

        this.userService.updateUserPersonalProfilePhoto(loggedInUser, fileUploading);
        // update logged in user with update document:
        loggedInUser.setProfilePicDocumentId(fileUploading.getDocumentId());
        loggedInUser.setProfilePicDocument(new Document(fileUploading.getDocumentId(), fileUploading.getRandomHash()));
        responseMessage.setOverAllStatus(true);
        responseMessage.setMessage("Personal Profile Photo Updated Successfully");
        responseMessage.setData(fileUploading);

        return responseMessage;

    }

    @Data
    @EqualsAndHashCode(onlyExplicitlyIncluded = true)
    public class Node {
        @EqualsAndHashCode.Include
        private String title;
        private long size;
        private Map<Node, Node> children = new HashMap<>();

    }
}
