package com.javatmp.module.dms.controller;

import com.javatmp.fw.domain.ResponseMessage;
import java.io.File;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
@RequestMapping("/dms")
public class FileBrowser {

    @PostMapping("/fileBrowser")
    public @ResponseBody
    ResponseMessage fileBrowser(String parent, HttpServletRequest request, HttpServletResponse response) {

        if (parent.contains("..")) {
            // This is a security check
            throw new IllegalArgumentException("Cannot store file with relative path outside current directory " + parent);
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

        ResponseMessage responseMessage = new ResponseMessage();
        responseMessage.setOverAllStatus(true);
        responseMessage.setData(files);
        return responseMessage;
    }
}
