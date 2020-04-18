package com.javatmp.fw.data.jpa.repository;

import com.javatmp.fw.data.jpa.util.JpaUtil;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import java.io.Serializable;
import java.text.ParseException;
import java.util.Arrays;
import javax.persistence.EntityManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;

@Slf4j
public class ExtendedJpaRepositoryImpl<T, ID extends Serializable>
        extends SimpleJpaRepository<T, ID> implements ExtendedJpaRepository<T, ID> {

    private EntityManager em;

    public ExtendedJpaRepositoryImpl(JpaEntityInformation<T, ?> entityInformation, EntityManager entityManager) {
        super(entityInformation, entityManager);
        this.em = entityManager;
    }

    @Override
    public DataTableResults<T> retrievePageRequestDetails(DataTableRequest<T> page) throws ParseException {

        if (page.getClassType() == null) {
            page.setClassType(this.getDomainClass());
        }

//        if (page.getSelects() == null || page.getSelects().length == 0) {
//            // populate from column names in the same order:
//            if (page.getColumns() != null) {
//                String[] selects = new String[page.getColumns().size()];
//                for (int i = 0; i < page.getColumns().size(); i++) {
//                    DataTableColumn column = page.getColumns().get(i);
//                    selects[i] = column.getData();
//                }
//                page.setSelects(selects);
//            }
//        }
        log.debug("Class is [{}] . select list to fetch are [{}]", page.getClassType(), Arrays.toString(page.getSelects()));
        DataTableResults<T> result = JpaUtil.retrievePageRequestDetails(em, page);
        return result;
    }

    public Long retrievePageRequestCount(DataTableRequest<T> page) throws ParseException {
        if (page.getClassType() == null) {
            page.setClassType(this.getDomainClass());
        }

//        if (page.getSelects() == null || page.getSelects().length == 0) {
//            // populate from column names in the same order:
//            if (page.getColumns() != null) {
//                String[] selects = new String[page.getColumns().size()];
//                for (int i = 0; i < page.getColumns().size(); i++) {
//                    DataTableColumn column = page.getColumns().get(i);
//                    selects[i] = column.getData();
//                }
//                page.setSelects(selects);
//            }
//        }

        log.debug("Class is [{}] . select list to fetch are [{}]", page.getClassType(), Arrays.toString(page.getSelects()));
        Long result = JpaUtil.retrievePageRequestCount(em, page);
        return result;
    }

}
