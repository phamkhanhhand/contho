package com.phamkhanhhand.contho.budget_management.intergration;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Service;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.kafka.clients.consumer.ConsumerRecord;


@Service
public class KafkaConsumer {

    private final ObjectMapper objectMapper = new ObjectMapper();


    // Nhận 1 entity dưới dạng JSON rồi deserialize tùy loại
//        @KafkaListener(topics = {"topic-category", "topic-product"}, groupId = "group-1")

    @KafkaListener(topics = {"topic-category", "my-topic"}, groupId = "my-group")
    public void listenEntity(ConsumerRecord<String, String> record) {
        String topic = record.topic();
        String json = record.value();
        try {
            if ("topic-category".equals(topic)) {
//                    Category category = objectMapper.readValue(json, Category.class);
//                    System.out.println("Received Category: " + category);
            } else if ("topic-product".equals(topic)) {
//                    Product product = objectMapper.readValue(json, Product.class);
//                    System.out.println("Received Product: " + product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Nhận List entity từ topic list
    @KafkaListener(topics = {"topic-category-list"}, groupId = "my-group2")
    public void listenListCategory(ConsumerRecord<String, String> record) {
        String json = record.value();
        try {
//                List<Category> categories = objectMapper.readValue(json, new TypeReference<List<Category>>() {});
//                System.out.println("Received Category list size: " + categories.size());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

