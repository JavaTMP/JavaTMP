package com.javatmp.module.message.repository;

import com.javatmp.module.message.entity.Message;
import org.springframework.data.jpa.repository.ExtendedJpaRepository;

public interface MessageRepository extends ExtendedJpaRepository<Message, Long> {

}
