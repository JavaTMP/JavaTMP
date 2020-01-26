package com.javatmp.fw.data.jpa.repository;

import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import java.io.Serializable;
import java.text.ParseException;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface ExtendedJpaRepository<T, ID extends Serializable> extends JpaRepository<T, ID> {

    public DataTableResults<T> retrievePageRequestDetails(DataTableRequest<T> page) throws ParseException;

}
