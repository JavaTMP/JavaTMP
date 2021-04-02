package com.javatmp.demo.db.repository;

import com.javatmp.demo.db.entity.User;
import org.hibernate.LockOptions;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.query.Param;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Repository;

import javax.persistence.QueryHint;
import java.util.Optional;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Stream;

import static org.hibernate.jpa.QueryHints.HINT_CACHEABLE;
import static org.hibernate.jpa.QueryHints.HINT_FETCH_SIZE;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findByUserName(String username);

    Optional<User> findById(Long id);

    Stream<User> findAllByIdNotNull();

    @Async
    CompletableFuture<User> findOneById(Long id);

    @QueryHints(value = {
            @QueryHint(name = HINT_FETCH_SIZE, value = "100"),
            @QueryHint(name = HINT_CACHEABLE, value = "false"),
            @QueryHint(name = "javax.persistence.lock.timeout", value = "" + LockOptions.SKIP_LOCKED)
    })
    @Query(value = "SELECT * FROM User where status = ?1 for update skip locked", nativeQuery = true)
    Stream<User> selectForUpdateNative(Integer status);

    @QueryHints(value = {
            @QueryHint(name = HINT_FETCH_SIZE, value = "100"),
            @QueryHint(name = HINT_CACHEABLE, value = "false"),
            @QueryHint(name = "javax.persistence.lock.timeout", value = "" + LockOptions.SKIP_LOCKED)
    })
//    @Query(value = "SELECT c FROM Customer where status = ?1")
    Stream<User> findAllByStatus(Short status);

    @Modifying
    @Query("update User set status = :status where id = :id")
    int updateUserStatus(@Param("id") Long customerId,
                                   @Param("status") Short newStatus);


}
