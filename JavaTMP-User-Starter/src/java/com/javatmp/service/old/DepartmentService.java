//package com.javatmp.service.old;
//
//import com.javatmp.db.JpaDao;
//import com.javatmp.domain.hr.Country;
//import com.javatmp.domain.hr.Department;
//import com.javatmp.domain.hr.Employee;
//import com.javatmp.domain.hr.Location;
//import com.javatmp.mvc.MvcHelper;
//import com.javatmp.mvc.Page;
//import com.javatmp.util.Constants;
//import java.util.HashMap;
//import java.util.List;
//import javax.persistence.EntityManager;
//import javax.persistence.EntityTransaction;
//import javax.persistence.Query;
//import javax.persistence.TypedQuery;
//import javax.persistence.criteria.CriteriaBuilder;
//import javax.persistence.criteria.CriteriaQuery;
//import javax.persistence.criteria.Join;
//import javax.persistence.criteria.Path;
//import javax.persistence.criteria.Predicate;
//import javax.persistence.criteria.Root;
//import javax.persistence.criteria.SetJoin;
//import javax.persistence.metamodel.Metamodel;
//import org.apache.commons.beanutils.BeanUtils;
//
//public class DepartmentService {
//
//    private JpaDao jpaDao;
//
//    public DepartmentService(JpaDao jpaDao) {
//        this.jpaDao = jpaDao;
//    }
//
//    public void retrieveDepartmentDetails(Page<Department> page) {
//
//        EntityManager em = null;
//        List retList = null;
//        try {
//            em = this.jpaDao.getEntityManagerFactory().createEntityManager();
//            CriteriaBuilder cb = em.getCriteriaBuilder();
//            CriteriaQuery<Department> cq = cb.createQuery(page.getType());
//            Root<Department> from = cq.from(page.getType());
//
//            page.setSelects(new String[]{
//                "departmentId", "departmentName", "managerId.employeeId",
//                "managerId.firstName", "managerId.lastName", "locationId.locationId",
//                "locationId.city", "locationId.countryId.countryId",
//                "locationId.countryId.countryName"});
//
//            cq.multiselect(this.jpaDao.convertArrToPaths(from, page.getSelects()));
//
//            Path<?> sortPath = this.jpaDao.convertStringToPath(from, page.getSortColumn());
//            if (page.getSortOrder().equals("asc")) {
//                cq.orderBy(cb.asc(sortPath));
//            } else {
//                cq.orderBy(cb.desc(sortPath));
//            }
//
//            Query query = em.createQuery(cq);
//            query.setFirstResult(page.getFrom());
//            query.setMaxResults(page.getNumOfRowsPerPage());
//            retList = query.getResultList();
//
//            page.setRecords(retList);
//
//            CriteriaQuery<Long> cqLong = cb.createQuery(Long.class);
//            from = cqLong.from(cq.getResultType());
//            cqLong.select(cb.count(from));
////            Predicate restriction = cq.getRestriction();
//            Predicate predicate = cb.conjunction();
//            Join<Department, Employee> departmentManager = from.join("managerId");
//            Join<Department, Location> departmentLocation = from.join("locationId");
//            Join<Department, Country> locationCountry = departmentLocation.join("countryId");
////            predicate = cb.and(predicate, departmentManager.isNotNull());
////            predicate = cb.and(predicate, departmentLocation.isNotNull());
////            predicate = cb.and(predicate, locationCountry.isNotNull());
//
////            cqLong.where(predicate);
////            if (restriction != null) {
////                cqLong.where(restriction); // Copy restrictions
////            }
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
//        return this.jpaDao.getAllCount(Department.class);
//    }
//
//    public static void main(String[] args) throws Throwable {
//
//        String defaultPersistentUnitName = Constants.EMBEDDED_PERSISTENT_UNIT_NAME;
//        defaultPersistentUnitName = "OracleHrSchemaUsingHibernatePU";
////        defaultPersistentUnitName = "OracleHrSchemaUsingEclipseLinkPU";
//        Factory.initializeDefaultApplicationServices(defaultPersistentUnitName);
//        ServicesFactory sf = Factory.getDefaultInstance();
//        DepartmentService departmentService = sf.getDepartmentService();
//        Page<Department> page
//                = new Page<Department>(1, 100, "departmentId", "desc", Department.class);
//
////        departmentService.retrieveDepartmentDetails(page);
//        departmentService.retrieveDepartmentDetails(page);
//        System.out.println("all count [" + page.getAllCount() + "]");
//        System.out.println("record count [" + page.getRecords().size() + "]");
////        System.out.println("user [" + MvcHelper.toString(page) + "]");
//        System.out.println("user [" + MvcHelper.deepToString(page) + "]");
//
//        Factory.destroyAll();
//
//        System.out.println("**** shutdown application ****");
//    }
//
//}
