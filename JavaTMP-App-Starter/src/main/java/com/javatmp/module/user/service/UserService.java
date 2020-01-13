package com.javatmp.module.user.service;

import com.javatmp.fw.data.jpa.repository.JpaRepository;
import com.javatmp.fw.domain.table.DataTableColumn;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.domain.table.Order;
import com.javatmp.module.user.entity.Country;
import com.javatmp.module.dms.entity.Document;
import com.javatmp.module.dms.entity.Document_;
import com.javatmp.module.user.entity.User;
import com.javatmp.module.user.entity.User_;
import com.javatmp.util.MD5Util;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.LockModeType;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaDelete;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.CriteriaUpdate;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class UserService extends JpaRepository<User, Long> {

    public UserService(EntityManagerFactory emf) {
        super(User.class, emf);
    }

    public User readCompleteUserById(final User user) {
        return get((EntityManager em) -> {
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
        });
    }

    public User readBasicUserById(User user) {
        return get((EntityManager em) -> {
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
        });
    }

    public User readUserByUsername(User user) {
        return get((EntityManager em) -> {
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
        });
    }

    public User createNewUser(User user) {
        return transaction((EntityManager em) -> {
            Document document = user.getProfilePicDocument();
            em.persist(document);
            user.setProfilePicDocumentId(document.getDocumentId());
            em.persist(user);
            document.setCreatedByUserId(user.getId());
            return user;
        });
    }

    public User createNewBasicUser(User user) {
        return transaction((EntityManager em) -> {
            // set any default values:
            user.setStatus((short) 1);
            user.setPassword(MD5Util.convertToMD5(user.getPassword()));
            user.setCreationDate(new Date());
            em.persist(user);
            return user;
        });
    }

    public int updateCompleteUser(User userToBeUpdated) {
        return statusTransaction((EntityManager em) -> {
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
        });
    }

    public int updateLastUserAccess(User userToBeUpdated) {
        return statusTransaction((EntityManager em) -> {
            userToBeUpdated.setLastAccessTime(new Date());
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaUpdate<User> update = cb.createCriteriaUpdate(User.class);
            Root<User> root = update.from(User.class);
            update.set(root.get(User_.lastAccessTime), userToBeUpdated.getLastAccessTime());
            update.where(cb.equal(root.get(User_.id), userToBeUpdated.getId()));
            return em.createQuery(update).executeUpdate();
        });
    }

    public int deleteUser(final User userToBeDeleted) {
        return statusTransaction((EntityManager em) -> {
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
        });
    }

    private int updateUserStatus(User userToBeUpdated) {
        return statusTransaction((EntityManager em) -> {
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
        });
    }

    public int activateUser(User userToBeUpdated) {
        userToBeUpdated.setStatus((short) 1);
        return this.updateUserStatus(userToBeUpdated);
    }

    public int deActivateUser(User userToBeUpdated) {
        userToBeUpdated.setStatus((short) 0);
        return this.updateUserStatus(userToBeUpdated);
    }

    public void updateUserPersonalProfilePhoto(User user, Document document) {
        transaction((EntityManager em) -> {
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
        });
    }

    public DataTableResults<User> listAllUsers(DataTableRequest<User> tableRequest) {
        return getList((EntityManager em) -> {
            List<User> retList = null;
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<User> cq = cb.createQuery(User.class);
            Root<User> from = cq.from(User.class);
            Join<User, Document> join = from.join(User_.profilePicDocument, JoinType.LEFT);
            cq.multiselect(from.get(User_.id), from.get(User_.userName), from.get(User_.firstName),
                    from.get(User_.lastName), from.get(User_.status), from.get(User_.birthDate), from.get(User_.creationDate),
                    from.get(User_.email), from.get(User_.lang), from.get(User_.theme), from.get(User_.countryId), from.get(User_.address),
                    from.get(User_.timezone), from.get(User_.profilePicDocumentId), from.get(User_.profilePicDocument).get(Document_.randomHash)
            );

            List<Order> orders = tableRequest.getOrder();
            if (orders != null && orders.size() > 0) {
                for (Order order : orders) {
                    Integer columnIndex = order.getColumn();
                    DataTableColumn orderColumn = tableRequest.getColumns().get(columnIndex);

                    Path<?> sortPath = this.convertStringToPath(from, orderColumn.getData());
                    if (order.getDir().value().equals("desc")) {
                        cq.orderBy(cb.desc(sortPath));
                    } else {
                        cq.orderBy(cb.asc(sortPath));
                    }
                }
            }

            // where clouse:
            Predicate predicate = cb.conjunction();
            Predicate globalPredicate;
            // support global search:
            if (tableRequest.getSearch() != null && tableRequest.getSearch().getValue() != null
                    && !tableRequest.getSearch().getValue().trim().equals("")) {
                log.info("*** isGlobalSearch starting ***");
                String query = tableRequest.getSearch().getValue().trim().toLowerCase();
                query = "%" + query + "%";
                Predicate p1 = cb.like(cb.lower(from.get(User_.userName)), query);
                Predicate p2 = cb.like(cb.lower(from.get(User_.firstName)), query);
                Predicate p3 = cb.like(cb.lower(from.get(User_.lastName)), query);
                globalPredicate = cb.or(p1, p2, p3);
                predicate = cb.or(globalPredicate);
            }

            for (DataTableColumn column : tableRequest.getColumns()) {
                String columnName = column.getName();
                String columnSearchValue = column.getSearch().getValue().trim();
                log.info("column name [" + columnName + "] search value [" + columnSearchValue + "]");
                if (columnSearchValue != null && !columnSearchValue.equals("")) {
                    //predicate = cb.and(predicate, cb.equal(from.get(columnName), columnSearchValue));
                    if (columnName.equals("id")) {
                        Long searchValue = new Long(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(columnName), searchValue));
                    }
                    if (columnName.equals("userName")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(columnName), searchValue));
                    }
                    if (columnName.equals("firstName")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(columnName), searchValue));
                    }
                    if (columnName.equals("lastName")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(columnName), searchValue));
                    }
                    if (columnName.equals("birthDate")) {
                        try {
                            String searchValue = new String(columnSearchValue);
                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                            Date objSearchValue = sdf.parse(searchValue);
                            predicate = cb.and(predicate, cb.equal(from.get(columnName), objSearchValue));
                        } catch (ParseException ex) {
                            ex.printStackTrace();

                        }

                    }
                    if (columnName.equals("age")) {
                        Integer searchValue = new Integer(columnSearchValue);
                        Calendar calendar = Calendar.getInstance();
                        calendar.add(Calendar.YEAR, searchValue * -1);
                        Date minDate = calendar.getTime();
                        calendar.add(Calendar.YEAR, 1);
                        Date maxDate = calendar.getTime();
                        System.out.println("min [" + minDate + "], max [" + maxDate + "]");
                        Predicate betweenDate = cb.between(from.<Date>get(User_.birthDate), minDate, maxDate);
                        predicate = cb.and(predicate, betweenDate);
                    }
                    if (columnName.equals("email")) {
                        String searchValue = columnSearchValue.toLowerCase();
                        predicate = cb.and(predicate, cb.like(cb.lower(from.get(User_.email)), "%" + searchValue + "%"));
                    }
                    if (columnName.equals("status")) {
                        Short searchValue = new Short(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(columnName), searchValue));
                    }
                    if (columnName.equals("countryId")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(columnName), searchValue));
                    }
                    if (columnName.equals("lang")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(columnName), searchValue));
                    }
                    if (columnName.equals("theme")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(columnName), searchValue));
                    }
                    if (columnName.equals("timezone")) {
                        String searchValue = new String(columnSearchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(columnName), searchValue));
                    }
                    if (columnName.equals("creationDate")) {
                        try {
                            String[] dateParts = columnSearchValue.split("##TO##");
                            System.out.println(Arrays.toString(dateParts));
                            String startStr = dateParts[0];
                            String endStr = dateParts[1];
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
                            Date start = sdf.parse(startStr);
                            Date end = sdf.parse(endStr);
                            System.out.println("start [" + start + "], end [" + end + "]");
                            Predicate betweenDate = cb.between(from.<Date>get(User_.creationDate), start, end);
                            predicate = cb.and(predicate, betweenDate);
                        } catch (ParseException ex) {
                            ex.printStackTrace();
                        }
                    }
                }
            }

            System.err.println("tableRequest.getAdvancedSearchQuery() [" + tableRequest.getAdvancedSearchQuery() + "]");
            if (tableRequest.getAdvancedSearchQuery() != null) {
                try {
                    predicate = cb.and(predicate, this.applyAdvanedSearchQuery(tableRequest.getAdvancedSearchQuery(), cb, from));
                    System.out.println();
                } catch (ParseException ex) {
                    Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            cq.where(predicate);
            TypedQuery<User> query = em.createQuery(cq);

            query.setFirstResult(tableRequest.getStart());
            query.setMaxResults(tableRequest.getLength());

            retList = query.getResultList();

            DataTableResults<User> dataTableResult = new DataTableResults<>();
            dataTableResult.setData(retList);

            CriteriaQuery<Long> cqLong = cb.createQuery(Long.class);
            from = cqLong.from(cq.getResultType());
            join = from.join(User_.profilePicDocument, JoinType.LEFT);

            cqLong.select(cb.count(from));
            cqLong.where(predicate);
            Long allCount = em.createQuery(cqLong).getSingleResult();
            dataTableResult.setRecordsTotal(allCount);
            dataTableResult.setRecordsFiltered(allCount);
            dataTableResult.setDraw(tableRequest.getDraw());
            return dataTableResult;
        });
    }

}
