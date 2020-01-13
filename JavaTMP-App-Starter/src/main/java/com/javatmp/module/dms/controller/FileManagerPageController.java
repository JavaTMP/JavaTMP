package com.javatmp.module.dms.controller;

import com.javatmp.fw.domain.ResponseMessage;
import com.javatmp.fw.domain.table.DataTableColumn;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.domain.table.Search;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.entity.Document_;
import com.javatmp.module.dms.service.DocumentService;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.service.UserService;
import com.javatmp.util.Constants;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Base64;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

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

        DataTableRequest<Document> tableRequest = new DataTableRequest<>();

        tableRequest.setStart(0);
        tableRequest.setLength(Integer.MAX_VALUE);

        tableRequest.setSelects(new String[]{Document_.DOCUMENT_ID, Document_.DOCUMENT_NAME,
            Document_.DOCUMENT_SIZE, Document_.DOCUMENT_TYPE, Document_.CREATION_DATE,
            Document_.RANDOM_HASH, Document_.DOCUMENT_TYPE, Document_.PARENT_DOCUMENT_ID,
            Document_.STATUS, Document_.CREATED_BY_USER_ID});
        tableRequest.setClassType(Document.class
        );
        DataTableColumn column = new DataTableColumn(0, Document_.DOCUMENT_TYPE);

        column.setSearch(new Search("2", null));
        List<DataTableColumn> columns = new LinkedList<>();

        columns.add(column);

        tableRequest.setColumns(columns);
        DataTableResults<Document> dataTableResult = documentService.retrievePageRequestDetails(tableRequest);
        return dataTableResult;
    }

    @PostMapping("/fileBrowser")
    public List<Map<String, Object>> fileBrowser(String parent) {

        if (parent.contains("..")) {
            // This is a security check
            throw new IllegalArgumentException("Cannot process relative path" + parent);
        }

//        String basePath = request.getServletContext().getRealPath("");
        String basePath = ClassLoader.getSystemClassLoader().getResource("").getPath();
        log.info("parent [" + parent + "] ");
        File file = new File(basePath, parent);

        log.info("basePath [" + basePath + "]");
        log.info("file [" + file.getAbsolutePath() + "]");

        List<Map<String, Object>> files = new LinkedList<>();
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
}
