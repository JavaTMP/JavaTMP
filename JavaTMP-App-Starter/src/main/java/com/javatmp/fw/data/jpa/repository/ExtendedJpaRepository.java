package com.javatmp.fw.data.jpa.repository;

import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import java.io.Serializable;
import java.text.ParseException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

import javax.persistence.EntityManager;

@NoRepositoryBean
public interface ExtendedJpaRepository<T, ID extends Serializable> extends JpaRepository<T, ID> {

    public DataTableResults<T> retrievePageRequestDetails(DataTableRequest<T> page) throws ParseException;

    public Long retrievePageRequestCount(DataTableRequest<T> page) throws ParseException;

}
