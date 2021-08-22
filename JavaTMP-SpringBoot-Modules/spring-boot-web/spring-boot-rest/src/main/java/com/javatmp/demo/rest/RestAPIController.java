package com.javatmp.demo.rest;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
@RequestMapping("/rest")
@Slf4j
public class RestAPIController {

    @Autowired
    private Set<RestDto> restDtoRepository;

    @GetMapping("/get")
    Set<RestDto> all() {
        log.debug("requested get request");
        return this.restDtoRepository;
    }

    @PostMapping("/post")
    RestDto post(@RequestBody RestDto restDto) {
        restDtoRepository.add(restDto);
        return restDto;
    }

    @GetMapping("/get/{id}")
    RestDto get(@PathVariable Long id) {
    log.info("try getting id :{}", id);
        return restDtoRepository.stream().filter(restDto -> restDto.getId().equals(id))
                .findAny()
                .orElseThrow(() ->
                        new IllegalArgumentException(String.format("id not found : %d .", id)));
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
