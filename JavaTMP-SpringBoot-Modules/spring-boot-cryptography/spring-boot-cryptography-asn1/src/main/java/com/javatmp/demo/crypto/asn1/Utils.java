package com.javatmp.demo.crypto.asn1;

/**
 * Chapter 5 Utils
 */
public class Utils extends com.javatmp.demo.crypto.asymmetric.Utils {

    public static String toBitStr(byte[] src) {
        StringBuilder out = new StringBuilder(src.length);
        for (int i = 0; i < src.length; i++) {
            String s1 = String.format("%8s",
                    // & 0xFF basically converts a signed byte to an unsigned integer.
                    // For example, -129, like you said, is represented by
                    // 11111111111111111111111110000001. In this case, you basically want
                    // the first (least significant) 8 bits, so you AND (&) it
                    // with 0xFF (00000000000000000000000011111111), effectively cleaning
                    // the 1's to the left that we don't care about, leaving out just 10000001
                    Integer.toBinaryString(src[i] & 0xFF))
                    .replace(' ', '0');
            out.append(s1);
        }
        return out.toString();
    }

}
