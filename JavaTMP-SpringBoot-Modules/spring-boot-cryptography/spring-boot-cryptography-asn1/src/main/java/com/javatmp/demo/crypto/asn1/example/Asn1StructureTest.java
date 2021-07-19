package com.javatmp.demo.crypto.asn1.example;

import com.javatmp.demo.crypto.asn1.Utils;
import org.bouncycastle.asn1.DERGeneralString;
import org.bouncycastle.asn1.DEROctetString;
import org.bouncycastle.asn1.DERUTF8String;

import java.util.Arrays;
import java.util.Date;

/**
 * Test for MyStructure
 */
public class Asn1StructureTest {

    private static final int MAX = 1024 ;
    public static void main(String[] args) throws Exception {
        /*
         * Hex ASCII coded values for 0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F
         */
        byte[] hexResult = { (byte)0x30,(byte)0x31,(byte)0x32,(byte)0x33,(byte)0x34,(byte)0x35,(byte)0x36,(byte)0x37,
                (byte)0x38,(byte)0x39,(byte)0x41,(byte)0x42,(byte)0x43,(byte)0x44,(byte)0x45,(byte)0x46 };

        byte[] hexArr = new byte[ MAX];
        for (int k=0; k<hexArr.length; k++){
            hexArr[k] = (byte) ( k % 256 ) ;
        }
        Date created = new Date();

        Asn1Structure structure  = new Asn1Structure( created, hexResult , "UTF8 String hello", "General String world" );
        Asn1Structure structure2 = new Asn1Structure( created, hexArr    , "UTF8 String", "General String" );
      /*
      System.out.println( ASN1Dump.dumpAsString ( structure.getCreated()     ) );
      System.out.println( ASN1Dump.dumpAsString ( structure.getOctectData()  ) ) ;
      System.out.println( ASN1Dump.dumpAsString ( structure.getUtf8Data()    ) );
      System.out.println( ASN1Dump.dumpAsString ( structure.getCommentData() ) );
      System.out.println( ASN1Dump.dumpAsString ( structure ) );
      */
        /*
         * https://en.wikipedia.org/wiki/X.690#BER.2C_CER_and_DER_compared
         * ===============================================================
         *
         * Octect String : 0410-30313233343536373839414243444546
         *
         *                 Type    - First  Byte : 0x04
         *                 Length  - Second Byte : 0x10 ( 16 decimal) in form DEFINITE SHORT
         */
        System.out.println(  "================== " );
        System.out.println(  "DEROctetString 1 : " );
        System.out.println(  "================== " );
        DEROctetString os = structure.getOctectData() ;
        byte[] os_encoded = os.getEncoded() ;
        System.out.println(  Utils.toHex(  os_encoded ) );
        System.out.println(  new String( os_encoded , "ASCII"));
        System.out.println(  "================== " );
        byte[] os_octects = os.getOctets() ;
        System.out.println(  new String(os_octects  , "ASCII")) ;
        System.out.println(  Utils.toHex(  os_octects ) );
        System.out.println(  Utils.toHex( os_encoded ) );
        /*
         * Octect String : 04820400-00010203040506070809....
         *
         *                 Type    - First  Byte : 0x04  i.e 00000100
         *                 Length  - 820400 ( 0x82, 0x04, 0x00 , i.e. 10000010-00000100-00000000 )
         *                                    0x82 is 10000010 (bit 8 = 1, and bits 1–7 encode the length)
         *                                         in this case 0000010 = 2 bytes for length
         *                                         so 00000100-00000000 is the length (i.e. 2^10 = 1024 value defined for MAX).
         */
        System.out.println(  "================== " );
        System.out.println(  "DEROctetString 2 : " );
        System.out.println(  "================== " );
        DEROctetString os2 = structure2.getOctectData()  ;
        byte[] os2_encoded = os2.getEncoded() ;
        System.out.println(  Utils.toHex(  os2_encoded ) );
        System.out.println(  new String( os2_encoded, "ASCII" ));
        byte[] os2_header = Arrays.copyOfRange(os2_encoded, 0, 10 );
        System.out.println(  Utils.toBitStr( os2_header ) );
        /*
         * General String : First Byte 0x1B
         */
        System.out.println(  "================== " );
        System.out.println(  "DERGeneralString : " );
        System.out.println(  "================== " );
        DERGeneralString gs = structure.getCommentData()  ;
        byte[] gs_encoded = gs.getEncoded() ;
        System.out.println(  Utils.toHex(  gs_encoded ) );
        System.out.println(  new String( gs_encoded , "ASCII"));
        System.out.println(  Utils.toBitStr( gs_encoded ) );
        /*
         * UTF8 Strig : First String 0x0C
         */
        System.out.println(  "=============== " );
        System.out.println(  "DERUTF8String : " );
        System.out.println(  "=============== " );
        DERUTF8String utf8s = structure.getUtf8Data() ;
        byte[] utf8s_encoded = utf8s.getEncoded() ;
        System.out.println(  Utils.toHex(  utf8s_encoded ) );
        System.out.println(  new String( utf8s_encoded, "ASCII"));
        System.out.println(  Utils.toBitStr( utf8s_encoded ) );
    }
}
