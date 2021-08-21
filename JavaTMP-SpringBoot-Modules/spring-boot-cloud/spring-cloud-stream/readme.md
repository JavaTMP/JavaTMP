# Spring Boot Cloud Stream Module

## Spring Boot Cloud Stream Kafka Module

Run the following commands:
`bin/zookeeper-server-start.sh config/zookeeper.properties`
`bin\windows\zookeeper-server-start.bat config\zookeeper.properties`

`bin/kafka-server-start.sh config/server.properties`
`bin\windows\kafka-server-start.bat config\server.properties`

`bin/kafka-topics.sh --create --topic orgChangeTopic --bootstrap-server localhost:9092`
`bin\windows\kafka-topics.bat --create --topic orgChangeTopic --bootstrap-server localhost:9092`

## References
- [https://docs.spring.io/spring-cloud-stream/docs/3.1.0/reference/html/spring-cloud-stream.html](https://docs.spring.io/spring-cloud-stream/docs/3.1.0/reference/html/spring-cloud-stream.html)
- [https://kafka.apache.org/quickstart](https://kafka.apache.org/quickstart)
- []()
- []()
