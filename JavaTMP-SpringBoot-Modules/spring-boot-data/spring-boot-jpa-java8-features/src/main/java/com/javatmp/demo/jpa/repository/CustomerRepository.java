package com.javatmp.demo.jpa.repository;

import com.javatmp.demo.jpa.entity.Customer;
import org.hibernate.LockOptions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.scheduling.annotation.Async;

import javax.persistence.QueryHint;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Stream;

import static org.hibernate.jpa.QueryHints.HINT_CACHEABLE;
import static org.hibernate.jpa.QueryHints.HINT_FETCH_SIZE;

public interface CustomerRepository extends JpaRepository<Customer, Long> {

    Optional<Customer> findById(Long id);

    Stream<Customer> findAllByIdNotNull();

    @Async
    CompletableFuture<Customer> findOneByStatus(Integer status);

    @QueryHints(value = {
            @QueryHint(name = HINT_FETCH_SIZE, value = "100"),
            @QueryHint(name = HINT_CACHEABLE, value = "false"),
            @QueryHint(name = "javax.persistence.lock.timeout", value = "" + LockOptions.SKIP_LOCKED)
    })
    @Query(value = "SELECT * FROM Customer for update skip locked", nativeQuery = true)
    Stream<Customer> selectForUpdate();
}
