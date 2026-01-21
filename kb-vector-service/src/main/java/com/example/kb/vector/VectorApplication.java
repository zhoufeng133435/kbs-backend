package com.example.kb.vector;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class VectorApplication {
    public static void main(String[] args) {
        SpringApplication.run(VectorApplication.class, args);
    }
}
