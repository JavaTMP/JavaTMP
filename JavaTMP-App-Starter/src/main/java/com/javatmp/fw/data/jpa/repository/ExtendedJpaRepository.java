package com.javatmp.fw.data.jpa.repository;

import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import com.javatmp.fw.domain.table.RuleOrGroup;
import java.io.Serializable;
import java.text.ParseException;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Selection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface ExtendedJpaRepository<T, ID extends Serializable> extends JpaRepository<T, ID> {

    public Path<T> convertStringToPath(Root<T> from, String strPathName);

    public List<Selection<?>> convertArrToPaths(Root<T> from, String[] selectList);

    public DataTableResults<T> retrievePageRequestDetails(DataTableRequest<T> page) throws ParseException;

    public Predicate applyAdvanedSearchQuery(RuleOrGroup ruleOrGroup, CriteriaBuilder cb, Root<T> from) throws ParseException;

}
