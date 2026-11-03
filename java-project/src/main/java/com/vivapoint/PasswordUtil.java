package com.vivapoint;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/** Salted PBKDF2 password hashing. Stored format: base64(salt):base64(hash). */
public final class PasswordUtil {
    private static final int ITERATIONS = 120_000;
    private PasswordUtil() {}

    public static String hash(String password) {
        byte[] salt = new byte[16];
        new SecureRandom().nextBytes(salt);
        Base64.Encoder b = Base64.getEncoder();
        return b.encodeToString(salt) + ":" + b.encodeToString(pbkdf2(password, salt));
    }

    public static boolean verify(String password, String stored) {
        String[] parts = stored.split(":");
        if (parts.length != 2) return false;
        Base64.Decoder d = Base64.getDecoder();
        return MessageDigest.isEqual(pbkdf2(password, d.decode(parts[0])), d.decode(parts[1]));
    }

    private static byte[] pbkdf2(String password, byte[] salt) {
        try {
            return SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256")
                .generateSecret(new PBEKeySpec(password.toCharArray(), salt, ITERATIONS, 256)).getEncoded();
        } catch (Exception e) { throw new IllegalStateException(e); }
    }
}
