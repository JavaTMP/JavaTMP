---
title: Copy a File in Java
---
# {{ page.title }}
Copying a file or directory used to be a typical development task. It's a fundamental concept,
and it might be useful to know what options does the Java developers have when they need to copy a file.
Read more about [Java IO classes](https://docs.oracle.com/javase/tutorial/essential/io/index.html) to see available
options for reading and writing files.

## I/O Streams
the standard way to copy a file was by utilizing I/O Streams:
```JAVA
private void copyFile(File src, File dest) throws IOException {
    InputStream inputStream = null;
    OutputStream outputStream = null;
    try {
        inputStream = new FileInputStream(source);
        outputStream = new FileOutputStream(dest);

        // the size of the buffer doesn't have to be exactly 1024 bytes,
        // try playing around with this number and see what effect
        // it will have on the performance
        byte[] buffer = new byte[1024];
        int length = 0;
        while ((length = is.read(buffer)) > 0) {
            os.write(buffer, 0, length);
        }
    } finally {
        is.close();
        os.close();
    }
}
```

## Channels and java.nio
Using a classes from `java.nio` package:
```JAVA
private void copyFileUsingChannel(File src, File dest) throws IOException {
    FileChannel sourceChannel = null;
    FileChannel destinationChannel = null;
    try {
        sourceChannel = new FileInputStream(src).getChannel();
        destinationChannel = new FileOutputStream(dest).getChannel();
        destinationChannel.transferFrom(sourceChannel, 0, sourceChannel.size());
       } finally {
           sourceChannel.close();
           destinationChannel.close();
       }
}
```

## Files Helper Class
Using `java.nio.Files` class which consists exclusively of static methods that operate on files,
directories, or other types of files.
Take a look at the [API documentation](https://docs.oracle.com/javase/tutorial/essential/io/copy.html)
to read more and see available options to the `copy()` method:
```Java
private static void copyFile(File src, File dest) throws IOException {
    Files.copy(src.toPath(), dest.toPath());
}
```
