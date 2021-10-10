package com.javatmp.demo.rest.nonblocking;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.concurrent.FailureCallback;
import org.springframework.util.concurrent.ListenableFuture;
import org.springframework.util.concurrent.ListenableFutureCallback;
import org.springframework.util.concurrent.SuccessCallback;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.async.DeferredResult;

import java.util.Set;
import java.util.concurrent.*;

@RestController
@RequestMapping("/rest")
@Slf4j
public class RestAPIController {

    @Autowired
    private Set<RestDto> restDtoRepository;

    @Autowired
    private Executor asyncExecutor;

    @GetMapping("/get")
    CompletableFuture<Set<RestDto>> all() {
        log.debug("requested get request");
        return CompletableFuture.supplyAsync(()-> {
            log.debug("return dto set from within completableFuture instance");
            return this.restDtoRepository;
        }, asyncExecutor);
    }

    @GetMapping("/get0")
    CompletableFuture<Set<RestDto>> allDefault() {
        log.debug("requested get request");
        return CompletableFuture.supplyAsync(()-> {
            log.debug("return dto set from within completableFuture instance");
            return this.restDtoRepository;
        });
    }

    @GetMapping("/get1")
    DeferredResult<Set<RestDto>> allByDeferredResult() {
        log.debug("requested get request");
        final DeferredResult<Set<RestDto>> deferredResult = new DeferredResult<>(5000l);
        deferredResult.onTimeout(()-> {
            log.error("time out happened");
        });
        return deferredResult;
    }

    @GetMapping("/get2")
    public DeferredResult<ResponseEntity<?>> get3() throws Exception {

        final DeferredResult<ResponseEntity<?>> deferredResult = new DeferredResult<ResponseEntity<?>>(5000l);
        deferredResult.onTimeout(() -> {
                deferredResult.setErrorResult(
                        ResponseEntity.status(HttpStatus.REQUEST_TIMEOUT)
                                .body("Request timeout occurred. kindly try again"));
        });

        CompletableFuture.runAsync(()-> {
            log.debug("with in completable future from deferred result");
            deferredResult.setResult(ResponseEntity.ok(this.restDtoRepository));
        }, asyncExecutor);

        return deferredResult;
    }

    @GetMapping("/get/{id}")
    RestDto get(@PathVariable Long id) {
        log.info("try getting id :{}", id);
        return restDtoRepository.stream().filter(restDto -> restDto.getId().equals(id))
                .findAny()
                .orElseThrow(() ->
                        new IllegalArgumentException(String.format("id not found : %d .", id)));
    }

    @PostMapping("/post")
    RestDto post(@RequestBody RestDto restDto) {
        restDtoRepository.add(restDto);
        return restDto;
    }

    @PutMapping("/put/{id}")
    RestDto put(@RequestBody RestDto restDto, @PathVariable Long id) {
        restDto.setId(id);
        this.restDtoRepository.add(restDto);
        return restDto;
    }

    @DeleteMapping("/delete/{id}")
    void delete(@PathVariable Long id) {
        this.restDtoRepository.remove(RestDto.builder().id(id).build());
    }
}
