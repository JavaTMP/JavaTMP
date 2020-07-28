package com.javatmp.demo.jdbc.converter;

import org.springframework.data.repository.CrudRepository;

interface UserRepository extends CrudRepository<User, UserId> {

}
