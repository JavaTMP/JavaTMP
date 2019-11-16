package com.javatmp.module.content.service;

import com.javatmp.module.content.entity.Content;
import com.javatmp.module.content.entity.Content_;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.util.JpaDaoHelper;
import java.text.ParseException;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.LockModeType;
import javax.persistence.PersistenceException;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public class ContentService {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private final JpaDaoHelper jpaDaoHelper;

    public ContentService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
//        generateContent();
    }

    public Long getAllCount() {
        return this.getJpaDaoHelper().getAllCount(Content.class);
    }

    public int updateContent(Content content) {
        int updateStatus = 0;
        EntityManager em = null;
        try {

            em = this.getJpaDaoHelper().getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Content> cq = cb.createQuery(Content.class);
            Root<Content> from = cq.from(Content.class);
            cq.select(from);
            cq.where(cb.equal(from.get(Content_.contentId), content.getContentId()));
            TypedQuery<Content> query = em.createQuery(cq);
            query.setLockMode(LockModeType.PESSIMISTIC_WRITE);
            Content dbContent = query.getSingleResult();
            dbContent.setTitle(content.getTitle());
            dbContent.setSummaryText(content.getSummaryText());
            dbContent.setContentText(content.getContentText());
//            dbContent.setStatus(content.getStatus());
            em.getTransaction().commit();
            updateStatus = 1;
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        }

        return updateStatus;
    }

    public Content readContentById(Content content) {
        return this.getJpaDaoHelper().read(Content.class, content.getContentId());
    }

    public int deleteContent(Content content) {
        int deletedStatus = 0;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            CriteriaBuilder cb = em.getCriteriaBuilder();
//            CriteriaQuery<Content> cq = cb.createQuery(Content.class);
//            Root<Content> from = cq.from(Content.class);
//            cq.multiselect(from.get(Content_.contentId), from.get(Content_.status));
//            cq.where(cb.equal(from.get(Content_.contentId), content.getContentId()));
//            TypedQuery<Content> query = em.createQuery(cq);
//            query.setLockMode(LockModeType.PESSIMISTIC_WRITE);
//            Content dbUser = query.getSingleResult();
            // here you can check for any pre delete code:

            // delete user first:
            CriteriaDelete<Content> deleteUser = cb.createCriteriaDelete(Content.class);
            Root<Content> userRoot = deleteUser.from(Content.class);
            deleteUser.where(cb.equal(userRoot.get(Content_.contentId), content.getContentId()));
            deletedStatus = em.createQuery(deleteUser).executeUpdate();
            // delete document second if user deleted:
            em.getTransaction().commit();
            return deletedStatus;
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        }
    }

    public DataTableResults<Content> listContent(DataTableRequest<Content> page) throws ParseException {

        page.setClassType(Content.class);
        page.setSelects(new String[]{"contentId", "title", "summaryText",
            "contentText", "creationDate", "createdBy", "status"});
        DataTableResults<Content> msgs = getJpaDaoHelper().retrievePageRequestDetails(page);
        return msgs;
    }

    /**
     * @return the jpaDaoHelper
     */
    public JpaDaoHelper getJpaDaoHelper() {
        return jpaDaoHelper;
    }

}
