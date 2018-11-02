package com.javatmp.service;

import com.javatmp.db.JpaDaoHelper;
import com.javatmp.domain.Country;
import com.javatmp.domain.Document;
import com.javatmp.domain.User;
import com.javatmp.domain.User_;
import com.javatmp.domain.Document_;
import com.javatmp.mvc.domain.table.DataTableColumnSpecs;
import com.javatmp.mvc.domain.table.DataTableRequest;
import com.javatmp.mvc.domain.table.DataTableResults;
import com.javatmp.mvc.domain.table.Order;
import com.javatmp.util.MD5Util;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.LockModeType;
import javax.persistence.PersistenceException;
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

public class UserService {

    private final Logger logger = Logger.getLogger(getClass().getName());
    private final JpaDaoHelper jpaDaoHelper;

    public UserService(JpaDaoHelper jpaDaoHelper) {
        this.jpaDaoHelper = jpaDaoHelper;
    }

    public User readCompleteUserById(User user) {

        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<User> cq = cb.createQuery(User.class);

            Root<User> from = cq.from(User.class);
            Join<User, Document> joinDocument = from.join(User_.profilePicDocument, JoinType.LEFT);
            Join<User, Country> joinCountry = from.join(User_.country, JoinType.LEFT);

            cq.multiselect(from.get(User_.id), from.get(User_.userName), from.get("password"), from.get("firstName"),
                    from.get("lastName"), from.get("status"), from.get("birthDate"), from.get("creationDate"),
                    from.get("email"), from.get("lang"), from.get("theme"), from.get("countryId"), from.get("address"),
                    from.get("timezone"), from.get("profilePicDocumentId"), from.get("profilePicDocument").get("randomHash")
            );
            cq.where(cb.equal(from.get(User_.id), user.getId()));
            TypedQuery<User> query = em.createQuery(cq);
            user = query.getSingleResult();
            return user;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public User readUserByUsername(User user) {
        User dbUser = null;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<User> cq = cb.createQuery(User.class);
            Root<User> from = cq.from(User.class);
            Join<User, Document> join = from.join(User_.profilePicDocument, JoinType.LEFT);
            cq.multiselect(from.get("id"), from.get("userName"), from.get("password"), from.get("firstName"),
                    from.get("lastName"), from.get("status"), from.get("birthDate"), from.get("creationDate"),
                    from.get("email"), from.get("lang"), from.get("theme"), from.get("countryId"), from.get("address"),
                    from.get("timezone"), from.get("profilePicDocumentId"), from.get("profilePicDocument").get("randomHash")
            );
            cq.where(cb.equal(from.get(User_.userName), user.getUserName()));
            TypedQuery<User> query = em.createQuery(cq);

            dbUser = query.getSingleResult();
            return dbUser;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public User createNewUser(User user) {

        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            Document document = user.getProfilePicDocument();
            em.persist(document);
            user.setProfilePicDocumentId(document.getDocumentId());
            em.persist(user);
            em.getTransaction().commit();
        } catch (PersistenceException e) {
            e.printStackTrace();
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw new PersistenceException("@ create new user", e);
        }
        return user;
    }

    public User createNewBasicUser(User user) {

        EntityManager em = null;

        // set any default values:
        user.setStatus((short) 1);
        user.setPassword(MD5Util.convertToMD5(user.getPassword()));
        user.setCreationDate(new Date());
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            if (em != null) {
                em.close();
            }
        }
        return user;
    }

    public int updateCompleteUser(User userToBeUpdated) {
        int updateStatus = 0;
        EntityManager em = null;
        try {

            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
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

    public int updateLastUserAccess(User userToBeUpdated) {
        int updateStatus = 0;
        EntityManager em = null;

        userToBeUpdated.setLastAccessTime(new Date());

        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaUpdate<User> update = cb.createCriteriaUpdate(User.class);
            Root<User> root = update.from(User.class);
            update.set(root.get(User_.lastAccessTime), userToBeUpdated.getLastAccessTime());
            update.where(cb.equal(root.get(User_.id), userToBeUpdated.getId()));
            updateStatus = em.createQuery(update).executeUpdate();
            em.getTransaction().commit();
            return updateStatus;
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public int deleteUser(User userToBeDeleted) {
        int deletedStatus = 0;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
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

            em.getTransaction().commit();
            return deletedStatus;
        } catch (PersistenceException e) {
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        }
    }

    public int activateUser(User userToBeUpdated) {
        int updateStatus = 0;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<User> cq = cb.createQuery(User.class);
            Root<User> from = cq.from(User.class);
            cq.multiselect(from.get(User_.id), from.get(User_.status));
            cq.where(cb.equal(from.get(User_.id), userToBeUpdated.getId()));
            TypedQuery<User> query = em.createQuery(cq);
            query.setLockMode(LockModeType.PESSIMISTIC_WRITE);
            User dbUser = query.getSingleResult();
            if (dbUser.getStatus().equals((short) 1)) {
                throw new IllegalArgumentException("user is already Active !!!");
            }
            dbUser.setStatus((short) 1);
            CriteriaUpdate<User> update = cb.createCriteriaUpdate(User.class);
            Root<User> e = update.from(User.class);
            update.set("status", 1);
            update.where(cb.equal(from.get(User_.id), userToBeUpdated.getId()));
            updateStatus = em.createQuery(update).executeUpdate();
            em.getTransaction().commit();
            return updateStatus;
        } catch (IllegalArgumentException | PersistenceException e) {
            e.printStackTrace();
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        }
    }

    public int deActivateUser(User userToBeUpdated) {
        int updateStatus = 0;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
            em.getTransaction().begin();
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<User> cq = cb.createQuery(User.class);
            Root<User> from = cq.from(User.class);
            cq.multiselect(from.get(User_.id), from.get(User_.status));
            cq.where(cb.equal(from.get(User_.id), userToBeUpdated.getId()));
            TypedQuery<User> query = em.createQuery(cq);
            query.setLockMode(LockModeType.PESSIMISTIC_WRITE);
            User dbUser = query.getSingleResult();
            if (dbUser.getStatus().equals((short) 0)) {
                throw new IllegalArgumentException("user is already deActivated !!!");
            }
            dbUser.setStatus((short) 0);
            CriteriaUpdate<User> update = cb.createCriteriaUpdate(User.class);
            Root<User> e = update.from(User.class);
            update.set("status", 0);
            update.where(cb.equal(from.get(User_.id), userToBeUpdated.getId()));
            em.createQuery(update).executeUpdate();
            em.getTransaction().commit();
            updateStatus = 1;
            return updateStatus;
        } catch (IllegalArgumentException | PersistenceException e) {
            e.printStackTrace();
            if (em != null) {
                em.getTransaction().rollback();
            }
            throw e;
        }
    }

    public DataTableResults<User> listAllUsers(DataTableRequest<User> tableRequest) throws ParseException {
        List<User> retList = null;
        EntityManager em = null;
        try {
            em = this.jpaDaoHelper.getEntityManagerFactory().createEntityManager();
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
                    DataTableColumnSpecs orderColumn = tableRequest.getColumns().get(columnIndex);

                    Path<?> sortPath = this.jpaDaoHelper.convertStringToPath(from, orderColumn.getData());
                    if (order.getDir().value().equals("desc")) {
                        cq.orderBy(cb.desc(sortPath));
                    } else {
                        cq.orderBy(cb.asc(sortPath));
                    }
                }
            }

            // where clouse:
            Predicate predicate = cb.conjunction();
            for (DataTableColumnSpecs column : tableRequest.getColumns()) {
                String columnName = column.getName();
                String columnSearchValue = column.getSearch().getValue().trim();
                logger.info("column name [" + columnName + "] search value [" + columnSearchValue + "]");
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
                        String searchValue = new String(columnSearchValue);
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                        Date objSearchValue = sdf.parse(searchValue);
                        predicate = cb.and(predicate, cb.equal(from.get(columnName), objSearchValue));
                    }
                    if (columnName.equals("age")) {
                        Integer searchValue = new Integer(columnSearchValue);
                        Calendar calendar = Calendar.getInstance();
                        calendar.add(Calendar.YEAR, searchValue * -1);
                        Date minDate = calendar.getTime();
                        calendar.add(Calendar.YEAR, 1);
                        Date maxDate = calendar.getTime();
                        System.out.println("min [" + minDate + "], max [" + maxDate + "]");
                        Predicate betweenDate = cb.between(from.get(User_.birthDate), minDate, maxDate);
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
                        String[] dateParts = columnSearchValue.split("##TO##");
                        System.out.println(Arrays.toString(dateParts));
                        String startStr = dateParts[0];
                        String endStr = dateParts[1];
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
                        Date start = sdf.parse(startStr);
                        Date end = sdf.parse(endStr);
                        System.out.println("start [" + start + "], end [" + end + "]");
                        Predicate betweenDate = cb.between(from.get(User_.creationDate), start, end);
                        predicate = cb.and(predicate, betweenDate);
                    }
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
        } finally {
            if (em != null) {
                em.close();
            }
        }

    }

}
