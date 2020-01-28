/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.javatmp.fw.service;

import com.javatmp.fw.data.jpa.repository.ExtendedJpaRepository;
import com.javatmp.fw.domain.table.DataTableRequest;
import com.javatmp.fw.domain.table.DataTableResults;
import java.io.Serializable;
import java.text.ParseException;

/**
 *
 * @author Mohamed
 */
public abstract class AbstractServiceImpl<T, ID extends Serializable> implements ExtendedJpaRepository<T, ID> {

    protected abstract ExtendedJpaRepository<T, ID> getRepository();

    public DataTableResults<T> retrievePageRequestDetails(DataTableRequest<T> page) throws ParseException {
        return this.getRepository().retrievePageRequestDetails(page);

    }

}
