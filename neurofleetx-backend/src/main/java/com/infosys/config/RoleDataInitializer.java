package com.infosys.config;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.infosys.model.Role;
import com.infosys.model.User;
import com.infosys.repository.RoleRepository;
import com.infosys.repository.UserRepository;

@Configuration
public class RoleDataInitializer {

    @Bean
    CommandLineRunner initRoles(RoleRepository roleRepository,
                                UserRepository userRepository,
                                PasswordEncoder encoder) {
        return args -> {
            List<String> roles = List.of("ADMIN", "MANAGER", "DRIVER", "CUSTOMER");
            for (String r : roles) {
                roleRepository.findByName(r).orElseGet(() -> roleRepository.save(new Role(null, r)));
            }

            // create default admin if not exists
            String adminEmail = "admin@neurofleetx.com";
            if (userRepository.findByEmail(adminEmail).isEmpty()) {
                Role adminRole = roleRepository.findByName("ADMIN").get();
                User admin = new User();
                admin.setEmail(adminEmail);
                admin.setFullName("NeuroFleetX Admin");
                admin.setPassword(encoder.encode("Admin@123")); 
                admin.setRoles(new HashSet<>(Collections.singletonList(adminRole)));
                userRepository.save(admin);
                System.out.println("✅ Default admin created: " + adminEmail + " / Admin@123");
            }

            // create default manager if not exists
            String managerEmail = "manager@neurofleetx.com";
            if (userRepository.findByEmail(managerEmail).isEmpty()) {
                Role managerRole = roleRepository.findByName("MANAGER").get();
                User manager = new User();
                manager.setEmail(managerEmail);
                manager.setFullName("Fleet Manager");
                manager.setPassword(encoder.encode("Manager@123")); 
                manager.setRoles(new HashSet<>(Collections.singletonList(managerRole)));
                userRepository.save(manager);
                System.out.println("✅ Default manager created: " + managerEmail + " / Manager@123");
            }

            // create default driver if not exists
            String driverEmail = "driver@neurofleetx.com";
            if (userRepository.findByEmail(driverEmail).isEmpty()) {
                Role driverRole = roleRepository.findByName("DRIVER").get();
                User driver = new User();
                driver.setEmail(driverEmail);
                driver.setFullName("Demo Driver");
                driver.setPassword(encoder.encode("Driver@123")); 
                driver.setRoles(new HashSet<>(Collections.singletonList(driverRole)));
                userRepository.save(driver);
                System.out.println("✅ Default driver created: " + driverEmail + " / Driver@123");
            }

            // create default customer if not exists
            String customerEmail = "customer@neurofleetx.com";
            if (userRepository.findByEmail(customerEmail).isEmpty()) {
                Role customerRole = roleRepository.findByName("CUSTOMER").get();
                User customer = new User();
                customer.setEmail(customerEmail);
                customer.setFullName("Demo Customer");
                customer.setPassword(encoder.encode("Customer@123")); 
                customer.setRoles(new HashSet<>(Collections.singletonList(customerRole)));
                userRepository.save(customer);
                System.out.println("✅ Default customer created: " + customerEmail + " / Customer@123");
            }
        };
    }
}
