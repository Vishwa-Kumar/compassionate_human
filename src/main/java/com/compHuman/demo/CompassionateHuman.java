package com.compHuman.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication
@ComponentScan({"com.compHuman.demo","com.compHuman.service"})

public class CompassionateHuman extends SpringBootServletInitializer {
	
	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(CompassionateHuman.class);
    }

	public static void main(String[] args) {
		SpringApplication.run(CompassionateHuman.class, args);
	}

}
