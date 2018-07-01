//package com.javatmp.service.old;
//
//import com.javatmp.domain.User;
//import com.javatmp.mvc.MvcHelper;
//import com.javatmp.mvc.domain.Page;
//import com.javatmp.service.JpaDao;
//import com.javatmp.util.Constants;
//import java.sql.Timestamp;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import javax.persistence.EntityTransaction;
//import javax.persistence.LockModeType;
//import javax.persistence.Persistence;
//import javax.persistence.TypedQuery;
//import javax.persistence.criteria.CriteriaBuilder;
//import javax.persistence.criteria.CriteriaQuery;
//import javax.persistence.criteria.Root;
//
//public class UserService {
//
//    private JpaDao jpaDao;
//
//    public UserService(JpaDao jpaDao) {
//        this.jpaDao = jpaDao;
//    }
//
//    public void findAll(Page<User> page) {
//
//        EntityManager em = null;
//        List<User> retList = null;
//        try {
//            em = this.jpaDao.getEntityManagerFactory().createEntityManager();
//            CriteriaBuilder cb = em.getCriteriaBuilder();
//            CriteriaQuery<User> cq = cb.createQuery(User.class);
//            Root<User> from = cq.from(User.class);
//            cq.select(from);
//            if (page.getSortOrder().equals("asc")) {
//                cq.orderBy(cb.asc(from.get(page.getSortColumn())));
//            } else {
//                cq.orderBy(cb.desc(from.get(page.getSortColumn())));
//            }
//            TypedQuery<User> query = em.createQuery(cq);
//
//            query.setFirstResult(page.getFrom());
//            query.setMaxResults(page.getNumOfRowsPerPage());
//            retList = query.getResultList();
//
//            page.setRecords(retList);
//
//            CriteriaQuery<Long> cqLong = cb.createQuery(Long.class);
//            cqLong.select(cb.count(cqLong.from(User.class)));
//            cqLong.where(/*your stuff*/);
//            Long allCount = em.createQuery(cqLong).getSingleResult();
//
//            page.setAllCount(allCount);
//        } finally {
//            if (em != null) {
//                em.close();
//            }
//        }
//    }
//
//    public Long getAllCount() {
//        return this.jpaDao.getAllCount(User.class);
//    }
//
//    public static void main(String[] args) throws Throwable {
//
//        String dbPath = "jdbc:h2:file:D:\\Mohamed_Work\\NetBeansProjects\\JavaTmp\\src\\java\\db\\test";
//        dbPath = "jdbc:h2:file:C:\\NetBeansProjects\\JavaTmp\\src\\java\\db\\test";
//        Factory.initializeDefaultApplicationServices(dbPath, Constants.EMBEDDED_PERSISTENT_UNIT_NAME);
//
//        UserService userService = Factory.getDefaultInstance().getUserService();
//
//        Page<User> page = new Page<User>(0, 10, "id", "desc");
//        userService.findAll(page);
//        System.out.println("user [" + MvcHelper.toString(page) + "]");
//
////        Long allCount = userService.getAllCount();
////        System.out.println("allCount [" + allCount + "]");
//        Factory.destroyDefaultApplicationServices();
//
//        System.out.println("**** now we use emf ****");
//
//        Map<String, Object> configOverrides = new HashMap<String, Object>();
//        configOverrides.put("hibernate.connection.url", dbPath);
//        EntityManagerFactory emf
//                = Persistence.createEntityManagerFactory("JavaTmpPU", configOverrides);
//
//        EntityManager em = emf.createEntityManager();
//
//        EntityTransaction tx = em.getTransaction();
//        User testJpa = null;
//        tx.begin();
//
//        testJpa = page.getRecords().get(0);
//        System.out.println("test [" + MvcHelper.toString(testJpa) + "]");
////        testJpa.setId(testJpa.getId() + 1);
//        testJpa.setId(null);
//        em.persist(testJpa);
//        tx.commit();
//
//        tx.begin();
//        testJpa = em.find(User.class, 6L, LockModeType.PESSIMISTIC_WRITE);
////        System.out.println(em.contains(testJpa));
//        System.out.println("test before update [" + MvcHelper.toString(testJpa) + "]");
//        testJpa.setCreationDate(new Timestamp(new Date().getTime()));
//
////        em.persist(testJpa);
////        em.flush();
////        em.merge(testJpa);
//        tx.commit();
//
//        tx.begin();
//
//        CriteriaBuilder cb = em.getCriteriaBuilder();
//        CriteriaQuery<User> cq = cb.createQuery(User.class);
//        Root<User> root = cq.from(User.class);
//        cq.select(root);
//
//        TypedQuery<User> query = em.createQuery(cq);
//        query.setFirstResult((2 - 1) * 10);
//        query.setMaxResults(10);
//
//        List<User> u = query.getResultList();
//
//        System.out.println("jpa size of users is [" + u.size() + "]");
//
//        tx.commit();
//
//        em.close();
//        emf.close();
//
//        String embeddedDBFile = MvcHelper.getAbsoluteClassPath() + "db/test";
//        System.out.println(embeddedDBFile);
//
//        System.out.println("******* now we test hr schema ********");
//        ServicesFactory sf = Factory.initialize("OracleHrSchemaUsingHibernatePU");
//        List<Country> l = sf.getJpaDao().findAll(Country.class);
//        System.out.println("Location size [" + l.get(0).getLocationList().size() + "]");
//        Factory.destroy("OracleHrSchemaUsingHibernatePU");
//
//        sf = Factory.initialize("OracleHrSchemaUsingEclipseLinkPU");
//        l = sf.getJpaDao().findAll(Country.class);
//        System.out.println("Location size [" + l.get(0) + "]");
//        Factory.destroy("OracleHrSchemaUsingEclipseLinkPU");
//
//        System.out.println("**** shutdown application ****");
//    }
//
//}
