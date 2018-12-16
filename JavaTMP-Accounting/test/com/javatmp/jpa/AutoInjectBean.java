/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.jpa;

import com.javatmp.mvc.MvcHelper;
import com.javatmp.util.JpaDaoHelper;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author Mohamed
 */
public class AutoInjectBean {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        JpaDaoHelper jpaDaoHelper = new JpaDaoHelper("AppPU");
        EntityManager em = jpaDaoHelper.getEntityManagerFactory().createEntityManager();
        List<Object[]> retAccts = null;
        try {
            Query query = em.createQuery(
                    "select "
                    + "acct.id, acct.accountCode, acct.name, acct.accountGroup"
                    + " from Account acct "
                    + "join Moduletype mt on acct.id = mt.rootAccountId "
                    + ""
            );

            retAccts = query.getResultList();
            System.out.println(MvcHelper.deepToString(retAccts));
            for (Object[] obj : retAccts) {
                System.out.println(MvcHelper.deepToString(obj));
            }
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

}
