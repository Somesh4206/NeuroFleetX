package com.infosys.config;

import com.infosys.model.Role;
import com.infosys.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 * Initialize roles on application startup
 * Ensures ADMIN, MANAGER, DRIVER, CUSTOMER roles exist in database
 */
@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public void run(String... args) throws Exception {
        // Check if roles already exist
        if (roleRepository.count() > 0) {
            System.out.println("✅ Roles already initialized in database");
            return;
        }

        System.out.println("🔧 Initializing roles...");

        // Create and save roles
        Role adminRole = new Role();
        adminRole.setName("ADMIN");
        roleRepository.save(adminRole);
        System.out.println("✅ Created ADMIN role");

        Role managerRole = new Role();
        managerRole.setName("MANAGER");
        roleRepository.save(managerRole);
        System.out.println("✅ Created MANAGER role");

        Role driverRole = new Role();
        driverRole.setName("DRIVER");
        roleRepository.save(driverRole);
        System.out.println("✅ Created DRIVER role");

        Role customerRole = new Role();
        customerRole.setName("CUSTOMER");
        roleRepository.save(customerRole);
        System.out.println("✅ Created CUSTOMER role");

        System.out.println("✅ All roles initialized successfully!");
    }
}
