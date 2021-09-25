package com.javatmp.demo.rest.reactive;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Scheduler;

import java.util.Set;

@RestController
@RequestMapping("/rest")
@Slf4j
public class MonoRestAPIController {

    @Autowired
    private Set<RestDto> restDtoRepository;

    @Autowired
    private Scheduler reactiveScheduler;

    @GetMapping("/get")
    Mono<Set<RestDto>> all() {
        log.debug("requested get request");
        return Mono.fromCallable(() -> this.restDtoRepository)
                .subscribeOn(reactiveScheduler);
    }

    @GetMapping("/get/{id}")
    Mono<RestDto> get(@PathVariable Long id) {
        log.info("try getting id :{}", id);
        return Mono.fromCallable(() -> {
            return restDtoRepository.stream()
                    .filter(restDto -> restDto.getId().equals(id))
                    .findAny()
                    .orElseThrow(() ->
                            new IllegalArgumentException(
                                    String.format("id not found : %d .", id)));
        }).subscribeOn(reactiveScheduler);
    }

    @PostMapping("/post")
    Mono<RestDto> post(@RequestBody RestDto restDto) {
        return Mono.fromCallable(() -> {
            this.restDtoRepository.add(restDto);
            return restDto;
        }).subscribeOn(reactiveScheduler);
    }

    @PutMapping("/put/{id}")
    Mono<RestDto> put(@RequestBody RestDto restDto, @PathVariable Long id) {
        return Mono.fromCallable(() -> {
            restDto.setId(id);
            this.restDtoRepository.add(restDto);
            return restDto;
        }).subscribeOn(reactiveScheduler);

    }

    @DeleteMapping("/delete/{id}")
    Mono<Void> delete(@PathVariable Long id) {
        return Mono.fromRunnable(() ->
                this.restDtoRepository.remove(
                        RestDto.builder().id(id).build()
                )
        ).subscribeOn(reactiveScheduler).then();
    }
}
