package com.javatmp.demo.cache;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrganizationRedisRepository extends
		CrudRepository<Organization,String> {
}
