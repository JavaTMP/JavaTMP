package com.javatmp.spring.tomcat;

import org.apache.catalina.Context;
import org.apache.catalina.LifecycleException;
import org.apache.catalina.core.StandardContext;
import org.apache.catalina.startup.Tomcat;

import java.io.File;
import java.io.IOException;

public class Main {
    private static final int PORT = getPort();

    public static void main(String[] args) throws Exception {
        //https://www.baeldung.com/register-servlet#3-programmatic-configuration-through-tomcatembeddedservletcontainerfactory
        String appBase = ".";
        Tomcat tomcat = new Tomcat();
        // prevent register jsp servlet
        tomcat.setAddDefaultWebXmlToWebapp(true);
        tomcat.setBaseDir(createTempDir());
        tomcat.setPort(PORT);
        tomcat.getHost().setAppBase(appBase);
        Context context = tomcat.addWebapp("", appBase);
        context.setAddWebinfClassesResources(true); // process /META-INF/resources for static

        //https://stackoverflow.com/questions/48998387/code-works-with-embedded-apache-tomcat-8-but-not-with-9-whats-changed
        tomcat.getConnector(); // Trigger the creation of the default connector

        // fix Illegal reflective access by org.apache.catalina.loader.WebappClassLoaderBase
        // https://github.com/spring-projects/spring-boot/issues/15101#issuecomment-437384942
        StandardContext standardContext = (StandardContext) context;
        standardContext.setClearReferencesObjectStreamClassCaches(false);
        standardContext.setClearReferencesRmiTargets(false);
        standardContext.setClearReferencesThreadLocals(false);

        // need for proper destroying servlets
        Runtime.getRuntime().addShutdownHook(new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    tomcat.getServer().stop();
                } catch (LifecycleException e) {
                    e.printStackTrace();
                }
            }
        }));

        tomcat.start();
        tomcat.getServer().await();
    }

    private static int getPort() {
        String port = System.getenv("PORT");
        if (port != null) {
            return Integer.valueOf(port);
        }
        return 8080;
    }

    // based on AbstractEmbeddedServletContainerFactory
    private static String createTempDir() {
        try {
            File tempDir = File.createTempFile("tomcat.", "." + PORT);
            tempDir.delete();
            tempDir.mkdir();
            tempDir.deleteOnExit();
            return tempDir.getAbsolutePath();
        } catch (IOException ex) {
            throw new RuntimeException(
                    "Unable to create tempDir. java.io.tmpdir is set to " + System.getProperty("java.io.tmpdir"),
                    ex
            );
        }
    }
}
