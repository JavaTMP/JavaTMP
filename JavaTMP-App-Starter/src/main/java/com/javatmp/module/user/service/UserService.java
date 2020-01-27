package com.javatmp.module.user.service;

import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.util.MD5Util;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.entity.Document_;
import com.javatmp.module.user.entity.Country;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.entity.User_;
import com.javatmp.module.user.repository.UserRepository;
import java.text.ParseException;
import java.util.Date;
import javax.persistence.EntityManager;
import javax.persistence.LockModeType;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
public class UserService {

    private UserRepository userRepository;
    private EntityManager em;

    public UserService(UserRepository userRepository, EntityManager em) {
        this.userRepository = userRepository;
        this.em = em;
    }

    public User readCompleteUserById(final User user) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<User> cq = cb.createQuery(User.class);
        Root<User> from = cq.from(User.class);
        Join<User, Document> joinDocument = from.join(User_.profilePicDocument, JoinType.LEFT);
        Join<User, Country> joinCountry = from.join(User_.country, JoinType.LEFT);
        cq.multiselect(from.get(User_.id), from.get(User_.userName), from.get(User_.password),
                from.get(User_.firstName), from.get(User_.lastName), from.get(User_.status),
                from.get(User_.birthDate), from.get(User_.creationDate), from.get(User_.email),
                from.get(User_.lang), from.get(User_.theme), from.get(User_.countryId),
                from.get(User_.address), from.get(User_.timezone), from.get(User_.profilePicDocumentId),
                from.get(User_.profilePicDocument).get(Document_.randomHash)
        );
        cq.where(cb.equal(from.get(User_.id), user.getId()));
        TypedQuery<User> query = em.createQuery(cq);
        return query.getSingleResult();
    }

    public User readBasicUserById(User user) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<User> cq = cb.createQuery(User.class);

        Root<User> from = cq.from(User.class);
        Join<User, Document> joinDocument = from.join(User_.profilePicDocument, JoinType.LEFT);
        Join<User, Country> joinCountry = from.join(User_.country, JoinType.LEFT);

        cq.multiselect(from.get(User_.id), from.get(User_.userName), from.get(User_.firstName),
                from.get(User_.lastName), from.get(User_.status), from.get(User_.birthDate), from.get(User_.creationDate),
                from.get(User_.email), from.get(User_.lang), from.get(User_.theme), from.get(User_.countryId), from.get(User_.address),
                from.get(User_.timezone), from.get(User_.profilePicDocumentId),
                from.get(User_.profilePicDocument).get(Document_.randomHash));
        cq.where(cb.equal(from.get(User_.id), user.getId()));
        TypedQuery<User> query = em.createQuery(cq);
        return query.getSingleResult();
    }

    public User readUserByUsername(User user) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<User> cq = cb.createQuery(User.class);
        Root<User> from = cq.from(User.class);
        Join<User, Document> join = from.join(User_.profilePicDocument, JoinType.LEFT);
        cq.multiselect(from.get(User_.id), from.get(User_.userName), from.get(User_.password),
                from.get(User_.firstName), from.get(User_.lastName), from.get(User_.status),
                from.get(User_.birthDate), from.get(User_.creationDate), from.get(User_.email),
                from.get(User_.lang), from.get(User_.theme), from.get(User_.countryId),
                from.get(User_.address), from.get(User_.timezone), from.get(User_.profilePicDocumentId),
                from.get(User_.profilePicDocument).get(Document_.randomHash)
        );
        cq.where(cb.equal(from.get(User_.userName), user.getUserName()));
        TypedQuery<User> query = em.createQuery(cq);
        return query.getSingleResult();
    }

    @Transactional
    public User createNewUser(User user) {
        Document document = user.getProfilePicDocument();
        em.persist(document);
        user.setProfilePicDocumentId(document.getDocumentId());
        em.persist(user);
        document.setCreatedByUserId(user.getId());
        return user;
    }

    @Transactional
    public User createNewBasicUser(User user) {
        // set any default values:
        user.setStatus((short) 1);
        user.setPassword(MD5Util.convertToMD5(user.getPassword()));
        user.setCreationDate(new Date());
        em.persist(user);
        return user;
    }

    @Transactional
    public int updateCompleteUser(User userToBeUpdated) {
        int updateStatus;
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<User> cq = cb.createQuery(User.class);
        Root<User> from = cq.from(User.class);
        from.fetch(User_.profilePicDocument, JoinType.LEFT);
        cq.select(from);
        cq.where(cb.equal(from.get(User_.id), userToBeUpdated.getId()));
        TypedQuery<User> query = em.createQuery(cq);
        query.setLockMode(LockModeType.PESSIMISTIC_WRITE);
        User dbUser = query.getSingleResult();
        dbUser.setUserName(userToBeUpdated.getUserName());
        dbUser.setPassword(userToBeUpdated.getPassword());
        dbUser.setFirstName(userToBeUpdated.getFirstName());
        dbUser.setLastName(userToBeUpdated.getLastName());
        dbUser.setStatus(userToBeUpdated.getStatus());
        dbUser.setBirthDate(userToBeUpdated.getBirthDate());
        dbUser.setCountryId(userToBeUpdated.getCountryId());
        dbUser.setAddress(userToBeUpdated.getAddress());
        dbUser.setEmail(userToBeUpdated.getEmail());
        dbUser.setLang(userToBeUpdated.getLang());
        dbUser.setTheme(userToBeUpdated.getTheme());
        dbUser.setTimezone(userToBeUpdated.getTimezone());
        if (userToBeUpdated.getProfilePicDocument() != null) {
            Document doc = em.merge(userToBeUpdated.getProfilePicDocument());
            dbUser.setProfilePicDocument(doc);
            dbUser.setProfilePicDocumentId(doc.getDocumentId());
        }
        updateStatus = 1;
        return updateStatus;
    }

    @Transactional
    public int updateLastUserAccess(User userToBeUpdated) {
        userToBeUpdated.setLastAccessTime(new Date());
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaUpdate<User> update = cb.createCriteriaUpdate(User.class);
        Root<User> root = update.from(User.class);
        update.set(root.get(User_.lastAccessTime), userToBeUpdated.getLastAccessTime());
        update.where(cb.equal(root.get(User_.id), userToBeUpdated.getId()));
        return em.createQuery(update).executeUpdate();
    }

    @Transactional
    public int deleteUser(final User userToBeDeleted) {
        Integer deletedStatus = 0;
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<User> cq = cb.createQuery(User.class);
        Root<User> from = cq.from(User.class);
        cq.multiselect(from.get(User_.id), from.get(User_.profilePicDocumentId));
        cq.where(cb.equal(from.get(User_.id), userToBeDeleted.getId()));
        TypedQuery<User> query = em.createQuery(cq);
        query.setLockMode(LockModeType.PESSIMISTIC_WRITE);
        User dbUser = query.getSingleResult();
        // here you can check for any pre delete code:

        // delete user first:
        CriteriaDelete<User> deleteUser = cb.createCriteriaDelete(User.class);
        Root<User> userRoot = deleteUser.from(User.class);
        deleteUser.where(cb.equal(userRoot.get(User_.id), dbUser.getId()));
        deletedStatus = em.createQuery(deleteUser).executeUpdate();
        // delete document second if user deleted:
        if (deletedStatus == 1) {
            CriteriaDelete<Document> delete = cb.createCriteriaDelete(Document.class);
            Root<Document> e = delete.from(Document.class);
            delete.where(cb.equal(e.get(Document_.documentId), dbUser.getProfilePicDocumentId()));
            deletedStatus = em.createQuery(delete).executeUpdate();
        }
        return deletedStatus;
    }

    private int updateUserStatus(User userToBeUpdated) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<User> cq = cb.createQuery(User.class);
        Root<User> from = cq.from(User.class);
        cq.multiselect(from.get(User_.id), from.get(User_.status));
        cq.where(cb.equal(from.get(User_.id), userToBeUpdated.getId()));
        TypedQuery<User> query = em.createQuery(cq);
        query.setLockMode(LockModeType.PESSIMISTIC_WRITE);
        User dbUser = query.getSingleResult();
        if (dbUser.getStatus().equals(userToBeUpdated.getStatus())) {
            throw new IllegalArgumentException("existing user is already Active !!!");
        }
        dbUser.setStatus(userToBeUpdated.getStatus());
        CriteriaUpdate<User> update = cb.createCriteriaUpdate(User.class);
        Root<User> e = update.from(User.class);
        update.set(User_.STATUS, userToBeUpdated.getStatus());
        update.where(cb.equal(from.get(User_.id), userToBeUpdated.getId()));
        return em.createQuery(update).executeUpdate();
    }

    @Transactional
    public int activateUser(User userToBeUpdated) {
        userToBeUpdated.setStatus((short) 1);
        return this.updateUserStatus(userToBeUpdated);
    }

    @Transactional
    public int deActivateUser(User userToBeUpdated) {
        userToBeUpdated.setStatus((short) 0);
        return this.updateUserStatus(userToBeUpdated);
    }

    @Transactional
    public void updateUserPersonalProfilePhoto(User user, Document document) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<User> cq = cb.createQuery(User.class);
        Root<User> from = cq.from(User.class);
        cq.multiselect(from.get(User_.id), from.get(User_.profilePicDocumentId));
        cq.where(cb.equal(from.get(User_.id), user.getId()));
        TypedQuery<User> query = em.createQuery(cq);
        query.setLockMode(LockModeType.PESSIMISTIC_WRITE);
        User dbUser = query.getSingleResult();
        if (dbUser.getProfilePicDocumentId() != null) {
            // update existing one
            CriteriaQuery<Document> docCq = cb.createQuery(Document.class);
            Root<Document> e = docCq.from(Document.class);
            docCq.where(cb.equal(e.get(Document_.documentId), dbUser.getProfilePicDocumentId()));
            TypedQuery<Document> docQuery = em.createQuery(docCq);
            docQuery.setLockMode(LockModeType.PESSIMISTIC_WRITE);
            Document dbDocument = docQuery.getSingleResult();
            dbDocument.setContentType(document.getContentType());
            dbDocument.setDocumentContent(document.getDocumentContent());
            dbDocument.setDocumentType(document.getDocumentType());
            dbDocument.setStatus(document.getStatus());
            dbDocument.setCreationDate(document.getCreationDate());
            dbDocument.setDocumentSize(document.getDocumentSize());
            dbDocument.setRandomHash(document.getRandomHash());
            dbDocument.setCreatedByUserId(document.getCreatedByUserId());
            document.setDocumentId(dbDocument.getDocumentId());
        } else {
            // create new one for user
            em.persist(document);
        }
    }

    public DataTableResults<User> listAllUsers(DataTableRequest<User> tableRequest) throws ParseException {

        tableRequest.setSelects(new String[]{User_.ID, User_.USER_NAME, User_.FIRST_NAME,
            User_.LAST_NAME, User_.STATUS, User_.BIRTH_DATE, User_.CREATION_DATE, User_.EMAIL,
            User_.LANG, User_.THEME, User_.COUNTRY_ID, User_.ADDRESS, User_.TIMEZONE,
            User_.PROFILE_PIC_DOCUMENT_ID, User_.PROFILE_PIC_DOCUMENT + "." + Document_.RANDOM_HASH});
        tableRequest.setClassType(User.class);
        return this.userRepository.retrievePageRequestDetails(tableRequest);

    }
}
