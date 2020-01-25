package com.javatmp.module.content.service;

import com.javatmp.fw.data.jpa.repository.JpaRepository;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.module.content.entity.Content;
import com.javatmp.module.content.entity.Content_;
import java.text.ParseException;
import javax.persistence.EntityManager;
import javax.persistence.LockModeType;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class ContentService extends JpaRepository<Content, Long> {

    private EntityManager em;

    public ContentService(JpaEntityInformation<Content, Long> entityInformation, EntityManager em) {
        super(entityInformation, em);
        this.em = em;
    }

    public int updateContent(Content content) {
        int updateStatus = 0;

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

        return updateStatus;
    }

    public int deleteContent(Content content) {
        int deletedStatus = 0;
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

    }

    public DataTableResults<Content> listContent(DataTableRequest<Content> page) throws ParseException {
        page.setClassType(Content.class);
        page.setSelects(new String[]{"contentId", "title", "summaryText",
            "contentText", "creationDate", "createdBy", "status"});
        DataTableResults<Content> msgs = this.retrievePageRequestDetails(page);
        return msgs;
    }

}
