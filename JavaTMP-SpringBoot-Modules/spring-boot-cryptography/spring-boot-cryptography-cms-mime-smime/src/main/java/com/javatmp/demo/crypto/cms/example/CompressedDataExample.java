package com.javatmp.demo.crypto.cms.example;

import org.bouncycastle.cms.CMSCompressedData;
import org.bouncycastle.cms.CMSCompressedDataGenerator;
import org.bouncycastle.cms.CMSProcessableByteArray;
import org.bouncycastle.cms.jcajce.ZlibCompressor;
import org.bouncycastle.cms.jcajce.ZlibExpanderProvider;

import java.util.Arrays;

/**
 * Basic use of CMS compressed-data.
 */
public class CompressedDataExample
{
    public static void main(String args[])
        throws Exception
    {
        // set up the generator
        CMSCompressedDataGenerator gen = new CMSCompressedDataGenerator();

        //compress the data
        CMSProcessableByteArray  data = new CMSProcessableByteArray(
                                                    "Hello world!".getBytes());

        CMSCompressedData compressed = gen.generate(data,
                new ZlibCompressor());

        // recreate and uncompress the data
        compressed = new CMSCompressedData(compressed.getEncoded());

        byte[] recData = compressed.getContent(new ZlibExpanderProvider());

        // compare uncompressed data to the original data
        if (Arrays.equals((byte[])data.getContent(), recData))
        {
            System.out.println("data recovery succeeded");
        }
        else
        {
            System.out.println("data recovery failed");
        }
    }
}
