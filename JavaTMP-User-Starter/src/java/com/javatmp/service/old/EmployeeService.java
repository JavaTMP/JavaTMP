//package com.javatmp.service.old;
//
//import com.javatmp.db.JpaDao;
//import com.javatmp.domain.hr.Country;
//import com.javatmp.domain.hr.Department;
//import com.javatmp.domain.hr.Employee;
//import com.javatmp.domain.hr.Job;
//import com.javatmp.domain.hr.Location;
//import com.javatmp.mvc.MvcHelper;
//import com.javatmp.mvc.Page;
//import com.javatmp.util.Constants;
//import java.sql.Timestamp;
//import java.util.Calendar;
//import java.util.Date;
//import java.util.Enumeration;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import javax.persistence.EntityManager;
//import javax.persistence.EntityManagerFactory;
//import javax.persistence.EntityTransaction;
//import javax.persistence.LockModeType;
//import javax.persistence.Persistence;
//import javax.persistence.Query;
//import javax.persistence.TypedQuery;
//import javax.persistence.criteria.CriteriaBuilder;
//import javax.persistence.criteria.CriteriaQuery;
//import javax.persistence.criteria.Join;
//import javax.persistence.criteria.JoinType;
//import javax.persistence.criteria.Path;
//import javax.persistence.criteria.Predicate;
//import javax.persistence.criteria.Root;
//import javax.persistence.metamodel.EntityType;
//import javax.persistence.metamodel.Metamodel;
//import org.apache.commons.beanutils.BeanUtils;
//
//public class EmployeeService {
//
//    private JpaDao jpaDao;
//
//    public EmployeeService(JpaDao jpaDao) {
//        this.jpaDao = jpaDao;
//    }
//
//    public void retrieveEmployees(Page<Employee> page) {
//
//        EntityManager em = null;
//        List retList = null;
//        try {
//            em = this.jpaDao.getEntityManagerFactory().createEntityManager();
//            CriteriaBuilder cb = em.getCriteriaBuilder();
//            CriteriaQuery<Employee> cq = cb.createQuery(Employee.class);
//            Root<Employee> from = cq.from(Employee.class);
//            Metamodel m = em.getMetamodel();
//            cq.multiselect(
//                    from.get("employeeId"),
//                    from.get("firstName"),
//                    from.get("lastName"),
//                    from.get("email"),
//                    from.get("hireDate"),
//                    from.get("salary"),
//                    from.get("departmentId").get("departmentName")
//            );
//            if (page.getSortOrder().equals("asc")) {
//                cq.orderBy(cb.asc(from.get(page.getSortColumn())));
//            } else {
//                cq.orderBy(cb.desc(from.get(page.getSortColumn())));
//            }
//            Query query = em.createQuery(cq);
//
//            query.setFirstResult(page.getFrom());
//            query.setMaxResults(page.getNumOfRowsPerPage());
//            retList = query.getResultList();
//
//            page.setRecords(retList);
//
//            CriteriaQuery<Long> cqLong = cb.createQuery(Long.class);
//            cqLong.select(cb.count(cqLong.from(Employee.class)));
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
//    public void retrieveEmployeesDetails(Page<Employee> page) {
//
//        EntityManager em = null;
//        List retList = null;
//        try {
//            em = this.jpaDao.getEntityManagerFactory().createEntityManager();
//            CriteriaBuilder cb = em.getCriteriaBuilder();
//            CriteriaQuery<Employee> cq = cb.createQuery(page.getType());
//            Root<Employee> from = cq.from(page.getType());
//
//            page.setSelects(new String[]{
//                "employeeId", "firstName", "lastName", "email", "phoneNumber",
//                "hireDate", "salary", "commissionPct", "departmentId.departmentId",
//                "departmentId.departmentName", "managerId.employeeId",
//                "jobId.jobId", "jobId.jobTitle"});
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
//            Predicate restriction = cq.getRestriction();
//            Predicate predicate = cb.conjunction();
//            Join<Employee, Employee> employeeManager = from.join("managerId", JoinType.LEFT);
//            Join<Employee, Department> employeeDepartment = from.join("departmentId");
//            Join<Employee, Job> employeeJob = from.join("jobId");
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
//
//    }
//
//    public void retrieveEmployeesDetailsByExample(Page<Employee> page) {
//
//        EntityManager em = null;
//        List retList = null;
//        try {
//            em = this.jpaDao.getEntityManagerFactory().createEntityManager();
//            CriteriaBuilder cb = em.getCriteriaBuilder();
//            CriteriaQuery<Employee> cq = cb.createQuery(page.getType());
//            Root<Employee> from = cq.from(page.getType());
//
//            page.setSelects(new String[]{
//                "employeeId", "firstName", "lastName", "email", "phoneNumber",
//                "hireDate", "salary", "commissionPct", "departmentId.departmentId",
//                "departmentId.departmentName", "managerId.employeeId",
//                "jobId.jobId", "jobId.jobTitle"});
//
//            cq.multiselect(this.jpaDao.convertArrToPaths(from, page.getSelects()));
//            cq.where(cb.equal(from.get("departmentId").get("departmentId"), page.getExampleObject().getDepartmentId().getDepartmentId()));
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
//            Predicate restriction = cq.getRestriction();
//            Predicate predicate = cb.conjunction();
//            Join<Employee, Employee> employeeManager = from.join("managerId", JoinType.LEFT);
//            Join<Employee, Department> employeeDepartment = from.join("departmentId");
//            Join<Employee, Job> employeeJob = from.join("jobId");
////            restriction = cb.and(restriction, employeeManager.isNotNull());
////            restriction = cb.and(restriction, employeeDepartment.isNotNull());
////            restriction = cb.and(restriction, employeeJob.isNotNull());
//
////            cqLong.where(predicate);
//            if (restriction != null) {
//                cqLong.where(restriction); // Copy restrictions
//            }
//            Long allCount = em.createQuery(cqLong).getSingleResult();
//
//            page.setAllCount(allCount);
//        } finally {
//            if (em != null) {
//                em.close();
//            }
//        }
//
//    }
//
//    public Employee retrieveEmployee(Employee employee) {
//
//        EntityManager em = null;
//        EntityTransaction tx = null;
//        Employee retEmployee = null;
//        try {
//            em = this.jpaDao.getEntityManagerFactory().createEntityManager();
//            tx = em.getTransaction();
//            tx.begin();
//            CriteriaBuilder cb = em.getCriteriaBuilder();
//            CriteriaQuery<Employee> cq = cb.createQuery(Employee.class);
//            Root<Employee> from = cq.from(Employee.class);
//
//            cq.multiselect(
//                    from.get("employeeId"),
//                    from.get("firstName"),
//                    from.get("lastName"),
//                    from.get("email"),
//                    from.get("phoneNumber"),
//                    from.get("hireDate"),
//                    from.get("salary"),
//                    from.get("commissionPct"),
//                    from.get("departmentId").get("departmentId"),
//                    from.get("departmentId").get("departmentName"),
//                    from.get("managerId").get("employeeId"),
//                    from.get("jobId").get("jobId"),
//                    from.get("jobId").get("jobTitle")
//            );
//
//            cq.where(cb.equal(from.get("employeeId"), employee.getEmployeeId()));
//            TypedQuery<Employee> query = em.createQuery(cq);
//
//            retEmployee = query.getSingleResult();
//            return retEmployee;
//        } finally {
//            if (tx != null) {
//                tx.commit();
//            }
//            if (em != null) {
//                em.close();
//            }
//        }
//    }
//
//    public Long getAllCount() {
//        return this.jpaDao.getAllCount(Employee.class);
//    }
//
//    public static void main(String[] args) throws Throwable {
//
//        String defaultPersistentUnitName = Constants.EMBEDDED_PERSISTENT_UNIT_NAME;
//        defaultPersistentUnitName = "OracleHrSchemaUsingHibernatePU";
////        defaultPersistentUnitName = "OracleHrSchemaUsingEclipseLinkPU";
//        Factory.initializeDefaultApplicationServices(defaultPersistentUnitName);
//        ServicesFactory sf = Factory.getDefaultInstance();
//        EmployeeService userService = sf.getEmployeeService();
//        Page<Employee> page = new Page<Employee>(1, 1000, "employeeId", "desc", Employee.class);
////        page.setSelects(new String[]{
////            "employeeId", "firstName", "lastName", "email", "phoneNumber",
////            "hireDate", "salary", "commissionPct", "departmentId.departmentId",
////            "departmentId.departmentName", "managerId.employeeId",
////            "jobId.jobId", "jobId.jobTitle"});
//        userService.retrieveEmployeesDetails(page);
//        System.out.println("employee list all size [" + page.getRecords().size() + "]");
//        System.out.println("employee all count [" + page.getAllCount() + "]");
//        System.out.println("user [" + MvcHelper.deepToString(page) + "]");
//
//        Employee emp1 = userService.retrieveEmployee(new Employee(102));
//
//        System.out.println("emp1 [" + MvcHelper.deepToString(emp1) + "]");
//
//        System.out.println("manager id [" + emp1.getManagerId() + "]");
//
//        System.out.println("manager id [" + emp1.getManagerId().getEmployeeId() + "]");
//
//        Employee exampleEmployee = new Employee();
//        exampleEmployee.setDepartmentId(new Department((short) 110));
//        System.out.println("exampleEmployee [" + MvcHelper.deepToString(exampleEmployee) + "]");
//        page.setExampleObject(exampleEmployee);
//
//        userService.retrieveEmployeesDetailsByExample(page);
//
//        if (true) {
//            return;
//        }
//
//        HashMap<String, Object> map = new HashMap<String, Object>();
//
//        map.put("employeeId", new Integer(1234));
//        map.put("firstName", "mohamed");
//        map.put("lastName", "sulibi");
//        map.put("email", "mdarim@gmail.com");
////        map.put("departmentId", new Department());
//        map.put("departmentId.departmentId", new Short((short) 33));
//
//        Employee bean = new Employee();
//        bean.setDepartmentId(new Department());
//        BeanUtils.populate(bean, map);
//
//        System.out.println("bean [" + MvcHelper.deepToString(bean) + "]");
//
//        EntityManager em = null;
//        TypedQuery<Country> query = null;
//        List<Country> results = null;
//
//        em = sf.getJpaDao().getEntityManagerFactory().createEntityManager();
//        TypedQuery<Country> q = em.createQuery(
//                "SELECT new Country(c.countryId,c.countryName) FROM Country AS c", Country.class);
//        results = q.getResultList();
//        System.out.println("result size [" + results.size() + "]");
//        System.out.println("result [" + MvcHelper.deepToString(results) + "]");
//        em.close();
//
//        System.out.println("******* now we test hr schema ********");
//
//        em = sf.getJpaDao().getEntityManagerFactory().createEntityManager();
//        query = em.createQuery(
//                "SELECT NEW com.javatmp.domain.hr.Country(c.countryId,c.countryName) FROM Country AS c", Country.class);
//        results = query.getResultList();
//        System.out.println("result size [" + results.size() + "]");
//        System.out.println("result [" + MvcHelper.toString(results.get(0)) + "]");
//        em.close();
//
//        em = sf.getJpaDao().getEntityManagerFactory().createEntityManager();
//        query = em.createQuery(
//                "SELECT NEW com.javatmp.domain.hr.Country(c.countryId,c.countryName,"
//                + "c.regionId) FROM Country AS c", Country.class);
//        results = query.getResultList();
//        System.out.println("result size [" + results.size() + "]");
//        System.out.println("result [" + MvcHelper.toString(results.get(0)) + "]");
//        em.close();
//
//        em = sf.getJpaDao().getEntityManagerFactory().createEntityManager();
//        query = em.createQuery(
//                "SELECT NEW com.javatmp.domain.hr.Country(c.countryId,c.countryName, "
//                + "c.regionId.regionId,c.regionId.regionName) "
//                + "FROM Country AS c", Country.class);
//        results = query.getResultList();
//        System.out.println("result size [" + results.size() + "]");
//        System.out.println("result [" + MvcHelper.deepToString(results.get(0)) + "]");
//        System.out.println("big [" + results.get(0).getRegionId().getRegionId() + "]");
//        em.close();
//
//        em = sf.getJpaDao().getEntityManagerFactory().createEntityManager();
//        TypedQuery<Object[]> query1 = em.createQuery(
//                "SELECT c.countryId,c.countryName,c.regionId.regionId,c.regionId.regionName,COUNT(l)"
//                + " FROM Country AS c LEFT OUTER JOIN c.locationList l"
//                + " group by c.countryId,c.countryName,c.regionId.regionId,c.regionId.regionName", Object[].class);
//        List<Object[]> results1 = query1.getResultList();
//        System.out.println("result size [" + results1.size() + "]");
//        System.out.println("result [" + MvcHelper.deepToString(results1) + "]");
//        System.out.println("big [" + results1.get(0) + "]");
//        em.close();
//
//        Factory.destroyAll();
//
//        System.out.println("**** shutdown application ****");
//    }
//
//}
