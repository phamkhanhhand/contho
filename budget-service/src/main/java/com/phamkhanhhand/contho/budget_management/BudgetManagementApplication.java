package com.phamkhanhhand.contho.budget_management;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.kafka.annotation.EnableKafka;


//quan trọng để quét
@SpringBootApplication(scanBasePackages = "com.phamkhanhhand.contho.budget_management")
@EnableJpaRepositories("com.phamkhanhhand.contho.budget_management.repository")  // Chỉ định gói chứa các repository
@EntityScan("com.phamkhanhhand.contho.budget_management.model")  // Đảm bảo quét entity
@EnableKafka

//@SpringBootApplication
public class BudgetManagementApplication {

	public static void main(String[] args) {
		SpringApplication.run(BudgetManagementApplication.class, args);
	}

}
