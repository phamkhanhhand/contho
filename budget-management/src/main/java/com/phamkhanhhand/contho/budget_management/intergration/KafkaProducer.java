package com.phamkhanhhand.contho.budget_management.intergration;

import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KafkaProducer {

    private final KafkaTemplate<String, Object> kafkaTemplate;

    public KafkaProducer(KafkaTemplate<String, Object> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    // Gửi 1 object entity
    public void sendEntity(String topic, Object entity) {
        kafkaTemplate.send(topic, entity);
        System.out.println("Sent entity to topic " + topic + ": " + entity);
    }

    // Gửi List entity
    public void sendListEntity(String topic, List<?> entities) {
        kafkaTemplate.send(topic, entities);
        System.out.println("Sent list of entities to topic " + topic + ": size=" + entities.size());
    }
}
