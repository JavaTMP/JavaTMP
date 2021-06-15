package com.javatmp.demo.rabbitmq;

import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.amqp.rabbit.config.SimpleRabbitListenerContainerFactory;
import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitAdmin;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.amqp.support.converter.MessageConverter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableRabbit
@Slf4j
public class RabbitMQConfig {
    public static final String RABBIT_MESSAGE_QUEUE = "rabbit.queue.name";
    private static final String RABBIT_MESSAGE_EXCHANGE = "rabbit.exchange.name";
    private static final String ROUTING_KEY = "messages.key";
    public static final String LISTENER_CONTAINER = "listenerContainer";

    /**
     * For the ConnectionFactory interface, there is a concrete implementation CachingConnectionFactory
     * which, by default, creates a single connection proxy that can be shared by the whole application.
     *
     * @return
     */
    @Bean
    public ConnectionFactory connectionFactory() {
        CachingConnectionFactory connectionFactory = new
                CachingConnectionFactory("127.0.0.1");
        connectionFactory.setUsername("guest");
        connectionFactory.setPassword("guest");
        return connectionFactory;
    }

    @Bean
    public Queue queue() {
        return new Queue(RABBIT_MESSAGE_QUEUE, true);
    }

    /**
     * we need to create an AMQP exchange, to which a message producer will send a message.
     * There are four implementations of the Exchange interface type:
     * DirectExchange, TopicExchange, FanoutExchange, and HeadersExchange.
     *
     * @return
     */
    @Bean
    public DirectExchange exchange() {
        return new DirectExchange(RABBIT_MESSAGE_EXCHANGE);
    }

    /**
     * creates a binding of queue and Exchange with the ROUTING_KEY routing key value.
     * @param directExchange
     * @param queue
     * @return
     */
    @Bean
    Binding exchangeBinding(DirectExchange directExchange, Queue queue) {
        return BindingBuilder.bind(queue).
                to(directExchange)
                .with(ROUTING_KEY);
    }

    /**
     * RabbitAdmin is used to declare the exchanges, queues, and binding that needs to be ready
     * on startup.
     *
     * @return
     */
    @Bean
    public RabbitAdmin rabbitAdmin() {
        RabbitAdmin admin = new RabbitAdmin(connectionFactory());
        admin.declareQueue(queue());
        admin.declareExchange(exchange());
        admin.declareBinding(exchangeBinding(exchange(), queue()));
        return admin;
    }

    /**
     * At the time a message is received by the listener, two change steps happen.
     * In the initial step, the incoming AMQP message is changed over to a Spring messaging Message
     * using MessageConverter. In the second step, when the target method is executed,
     * the payload of the message is changed over to the parameter type if necessary.
     * By default, in the initial step, MessageConverter is utilized as Spring AMQP SimpleMessageConverter
     * that handles the transformation to String and java.io.Serializable.
     * @return
     */
    @Bean
    public MessageConverter messageConverter() {
        return new Jackson2JsonMessageConverter();
    }

    /**
     * Spring AMQP’s RabbitTemplate provides everything for the basic AMQP operations.
     * The following code creates an instance of RabbitTemplate using connectionFactory
     *
     * @return
     */
    @Bean
    public RabbitTemplate rabbitTemplate() {
        RabbitTemplate template = new RabbitTemplate(connectionFactory());
        template.setRoutingKey(ROUTING_KEY);
        template.setExchange(RABBIT_MESSAGE_EXCHANGE);
        template.setMessageConverter(messageConverter());
        return template;
    }

    /**
     * To receive the message asynchronously, the easiest way is to use an annotated
     * listener endpoint.
     *
     * @return
     */
    @Bean(name = LISTENER_CONTAINER)
    public SimpleRabbitListenerContainerFactory listenerContainer() {
        SimpleRabbitListenerContainerFactory factory = new
                SimpleRabbitListenerContainerFactory();
        factory.setConnectionFactory(connectionFactory());
        factory.setMaxConcurrentConsumers(5);
        return factory;
    }

}
