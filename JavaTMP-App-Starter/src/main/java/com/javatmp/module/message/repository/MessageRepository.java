package com.javatmp.module.message.repository;

import com.javatmp.fw.data.jpa.repository.ExtendedJpaRepository;
import com.javatmp.module.message.entity.Message;

public interface MessageRepository extends ExtendedJpaRepository<Message, Long> {

}
