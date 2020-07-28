package com.javatmp.demo.jdbc.converter;

import java.util.Arrays;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.convert.converter.Converter;
import org.springframework.data.convert.ReadingConverter;
import org.springframework.data.convert.WritingConverter;
import org.springframework.data.jdbc.core.convert.JdbcCustomConversions;
import org.springframework.data.jdbc.repository.config.AbstractJdbcConfiguration;

@Configuration
@Slf4j
class ConverterConfiguration extends AbstractJdbcConfiguration {

  @Override
  public JdbcCustomConversions jdbcCustomConversions() {
    log.debug("register custom jdbc conversions");
    return new JdbcCustomConversions(Arrays.asList(
        new UserIdReadingConverter(),
        new UserIdWritingConverter()
    ));
  }

  @ReadingConverter
  static class UserIdReadingConverter implements Converter<Long, UserId> {

    @Override
    public UserId convert(Long source) {
      return new UserId(source);
    }
  }

  @WritingConverter
  static class UserIdWritingConverter implements Converter<UserId, Long> {

    @Override
    public Long convert(UserId source) {
      return source.getValue();
    }
  }
}
