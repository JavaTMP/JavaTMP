package com.javatmp.demo.db.repository;

import com.javatmp.demo.db.entity.User;
import org.hibernate.LockOptions;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Repository;

import javax.persistence.QueryHint;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Stream;

import static org.hibernate.jpa.QueryHints.HINT_CACHEABLE;
import static org.hibernate.jpa.QueryHints.HINT_FETCH_SIZE;

@Repository
public interface UserSpecificationRepository extends JpaRepository<User, Long>,
        JpaSpecificationExecutor<User> {

    List<User> findAll(Specification<User> specification);

}
