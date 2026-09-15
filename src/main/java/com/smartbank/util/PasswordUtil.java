package com.smartbank.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordUtil {

    private static final BCryptPasswordEncoder encoder =
            new BCryptPasswordEncoder();

    // Encrypt password during registration
    public static String encrypt(String password) {

        return encoder.encode(password);
    }

    // Compare login password with encrypted database password
    public static boolean matches(
            String rawPassword,
            String encryptedPassword) {

        return encoder.matches(
                rawPassword,
                encryptedPassword
        );
    }
}