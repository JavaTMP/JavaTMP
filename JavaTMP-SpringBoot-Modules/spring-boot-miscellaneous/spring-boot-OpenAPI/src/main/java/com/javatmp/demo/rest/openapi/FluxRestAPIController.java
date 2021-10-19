package com.javatmp.demo.rest.openapi;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Scheduler;

import java.util.Set;

@RestController
@RequestMapping("/rest/flux")
@Slf4j
@Tag(name = "Flux Rest API Controller",
        description = "Flux REST API for General Repository")
public class FluxRestAPIController {

    @Autowired
    private Set<RestDto> restDtoRepository;

    @Autowired
    private Scheduler reactiveScheduler;

    @Operation(
            summary = "${api.product-composite.get-composite-product.description}",
            description = "${api.product-composite.get-composite-product.notes}")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "${api.responseCodes.ok.description}"),
            @ApiResponse(responseCode = "400", description = "${api.responseCodes.badRequest.description}"),
            @ApiResponse(responseCode = "404", description = "${api.responseCodes.notFound.description}"),
            @ApiResponse(responseCode = "422", description = "${api.responseCodes.unprocessableEntity.description}")
    })
    @GetMapping("/get")
    Flux<RestDto> all() {
        log.debug("requested get request");
        return Flux.fromStream(() -> this.restDtoRepository.stream())
                .subscribeOn(reactiveScheduler);
    }

    @GetMapping("/get1")
    Flux<RestDto> get1() {
        log.debug("requested get request");
        Flux<RestDto> retFlux = Flux.create(emitter -> {
            this.restDtoRepository.stream().forEach(d -> {
                emitter.next(d);
            });
            emitter.complete();
        }).subscribeOn(reactiveScheduler).cast(RestDto.class);
        return retFlux;
    }

    private RestDto getItem(Long id) {
        return restDtoRepository.stream()
                .filter(restDto -> restDto.getId().equals(id))
                .findAny()
                .orElseThrow(() ->
                        new IllegalArgumentException(
                                String.format("id not found : %d .", id)));
    }

    @GetMapping("/get/{id}")
    Flux<RestDto> get(@PathVariable Long id) {
        log.info("try getting id :{}", id);
        RestDto dto = this.getItem(id);
        Flux<RestDto> tFlux = Flux.just(dto).subscribeOn(reactiveScheduler);
        return tFlux;
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
