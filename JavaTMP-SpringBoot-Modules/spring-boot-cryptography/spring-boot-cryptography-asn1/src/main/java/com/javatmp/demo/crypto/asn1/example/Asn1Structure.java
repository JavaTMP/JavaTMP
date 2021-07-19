package com.javatmp.demo.crypto.asn1.example;

import org.bouncycastle.asn1.*;

import java.util.Date;


/**
 * Implementation of an example ASN.1 structure.
 * <pre>
 * MyStructure ::= SEQUENCE {
 *                  version INTEGER DEFAULT 0,
 *                  created GeneralizedTime,
 *                  baseData OCTET STRING,
 *                  extraData [0] UTF8String OPTIONAL,
 *                  commentData [1] UTF8String OPTIONAL }
 * <pre>
 *
 */
public class Asn1Structure  {

    private DERGeneralizedTime 	created;
    //private ASN1GeneralizedTime created;
    //private ASN1OctetString     octectData;
    private DEROctetString      octectData;
    private DERUTF8String       utf8Data    = null;
    private DERGeneralString    commentData = null;
//
    /**
     * Constructor from corresponding Java objects and primitives.
     */
    public Asn1Structure( Date created, byte[] baseData, String extraData, String commentData) {
        this.created = new DERGeneralizedTime(created);
        this.octectData = new DEROctetString(baseData);

        if (extraData != null) {
            this.utf8Data = new DERUTF8String(extraData);
        }
        if (commentData != null){
            this.commentData = new DERGeneralString(commentData);

        }
    }
//
    /**
     * Constructor from an ASN.1 SEQUENCE
     */
    public Asn1Structure( ASN1Sequence seq){
        int index = 0;
        this.created 	= (DERGeneralizedTime) seq.getObjectAt(index++);
        this.octectData = (DEROctetString) seq.getObjectAt(index++);

        // check for optional fields
        for (int i = index; i != seq.size(); i++){
            ASN1TaggedObject t = (ASN1TaggedObject)seq.getObjectAt(i);
            switch (t.getTagNo()) {
                case 0:
                    utf8Data = DERUTF8String.getInstance(t, false);
                    break;
                case 1:
                    commentData = DERGeneralString.getInstance(t, false);
                    break;
                default:
                    throw new IllegalArgumentException(
                            "Unknown tag" + t.getTagNo() + "in constructor");
            }
        }
    }
    //
    /*
     * Produce an object suitable for writing to an ASN1/DEROutputStream
     */
//	 public DERObject  toASN1Object()
    public void  toASN1Object()
    {
        ASN1EncodableVector v = new ASN1EncodableVector();

        v.add(created);
        v.add(octectData);

        if (utf8Data != null){
            v.add(new DERTaggedObject(false, 0, utf8Data));
        }
        if (commentData != null){
            v.add(new DERTaggedObject(false, 1, commentData));
        }
        //return new DERTaggedObject(v);
    }
    //
    public DERGeneralizedTime getCreated() {
        return created;
    }
    public DEROctetString getOctectData() {
        return octectData;
    }
    public DERUTF8String getUtf8Data() {
        return utf8Data;
    }
    public DERGeneralString getCommentData() {
        return commentData;
    }
}
