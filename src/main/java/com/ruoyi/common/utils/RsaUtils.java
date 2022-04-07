package com.ruoyi.common.utils;

import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

/**
 * RSA加密解密
 * 生成公钥私钥  http://web.chacuo.net/netrsakeypair
 * 生成公钥私钥  RsaUtils.generateKeyPair();
 **/
public class RsaUtils {

    // Rsa 公钥
    public static String publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCv06UX91BPfk7OhrgNOHZztpNW\n" +
            "z7lDU+eerIKnjScR3bchhVZfc09P9lVulaKbhhfU+oyLWfHh6/25S7n7M9e5IlAI\n" +
            "uNtqvO/3MzCRtsYfPO6EOemSPMM+17BiVviWfewp/XAqByV4KChqop3/X0qs9vmq\n" +
            "rJRQs30W1kksimwwMQIDAQAB";

    // Rsa 私钥
    public static String privateKey = "MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAK/TpRf3UE9+Ts6G\n" +
            "uA04dnO2k1bPuUNT556sgqeNJxHdtyGFVl9zT0/2VW6VopuGF9T6jItZ8eHr/blL\n" +
            "ufsz17kiUAi422q87/czMJG2xh887oQ56ZI8wz7XsGJW+JZ97Cn9cCoHJXgoKGqi\n" +
            "nf9fSqz2+aqslFCzfRbWSSyKbDAxAgMBAAECgYA9tLFD7++ndlSB9pWxTheEFJcw\n" +
            "6EXEczXeYfyYgNktU/ppMTpW1UkIbxMcdDdVDYJfpG6emTpiZ0fsN79VgaQ7J5Dr\n" +
            "ybghlS7ukbY4xhH4RIgj5VeDprOVJuBYkN0j+h+MxQw+Vyp18rqAKWban7UTmcfc\n" +
            "FVrr7R3SN5N4L//t4QJBAOTD1dqj6kUiX0c4Y740MnB1IHoTNkgWM/sVpg96YF46\n" +
            "14CYl0/VYsCYaQNFOMJPBjNyECpdmrYRBIQ/QWtaLLsCQQDEwmOLoT+smaOrF6xd\n" +
            "bP2OOm5foebLXkj8mVElgQHGQPYv/H0KYahEvdThEmL9VNYPAAOcZ1B63W5rnrZ1\n" +
            "Q14DAkEAsn1SGFuYaASfjnQi7r7PNAtPIbBnw+r+98M2ZBE5q4wBpOZp+PInMNo5\n" +
            "5UFXPdRmpDE1B7ktAy1X9s9b/aTIDQJBAIdGpq4fROnkD9TXx9fL0V/x6GSzqTv1\n" +
            "LPUOa+3/DjtB+oDvdQCoN8pbQXsk6w4FP868Ub88gOaYSwyO6B8jHAUCQBQFL0QY\n" +
            "ae/KTNOAPCz37f3LTKNJiBpiYj4LkgilXZQhBh9Tie8Nf/3HlLBt/Zv1PvQt9uGG\n" +
            "P2rH82KrsHFtSNw=";

    /**
     * 私钥解密
     * privateKey 私钥
     *
     * @param text 待解密的文本
     * @return 解密后的文本
     */
    public static String decryptByPrivateKey(String text) throws Exception {
        return decryptByPrivateKey(privateKey, text);
    }

    /**
     * 公钥解密
     *
     * @param publicKeyString 公钥
     * @param text            待解密的信息
     * @return 解密后的文本
     */
    public static String decryptByPublicKey(String publicKeyString, String text) throws Exception {
        X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(Base64.decodeBase64(publicKeyString));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PublicKey publicKey = keyFactory.generatePublic(x509EncodedKeySpec);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, publicKey);
        byte[] result = cipher.doFinal(Base64.decodeBase64(text));
        return new String(result);
    }

    /**
     * 私钥加密
     *
     * @param privateKeyString 私钥
     * @param text             待加密的信息
     * @return 加密后的文本
     */
    public static String encryptByPrivateKey(String privateKeyString, String text) throws Exception {
        PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(Base64.decodeBase64(privateKeyString));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PrivateKey privateKey = keyFactory.generatePrivate(pkcs8EncodedKeySpec);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE, privateKey);
        byte[] result = cipher.doFinal(text.getBytes());
        return Base64.encodeBase64String(result);
    }

    /**
     * 私钥解密
     *
     * @param privateKeyString 私钥
     * @param text             待解密的文本
     * @return 解密后的文本
     */
    public static String decryptByPrivateKey(String privateKeyString, String text) throws Exception {
        PKCS8EncodedKeySpec pkcs8EncodedKeySpec5 = new PKCS8EncodedKeySpec(Base64.decodeBase64(privateKeyString));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PrivateKey privateKey = keyFactory.generatePrivate(pkcs8EncodedKeySpec5);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] result = cipher.doFinal(Base64.decodeBase64(text));
        return new String(result);
    }

    /**
     * 公钥加密
     *
     * @param publicKeyString 公钥
     * @param text            待加密的文本
     * @return 加密后的文本
     */
    public static String encryptByPublicKey(String publicKeyString, String text) throws Exception {
        X509EncodedKeySpec x509EncodedKeySpec2 = new X509EncodedKeySpec(Base64.decodeBase64(publicKeyString));
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PublicKey publicKey = keyFactory.generatePublic(x509EncodedKeySpec2);
        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.ENCRYPT_MODE, publicKey);
        byte[] result = cipher.doFinal(text.getBytes());
        return Base64.encodeBase64String(result);
    }

    /**
     * 构建RSA密钥对
     *
     * @return 生成后的公私钥信息
     */
    public static RsaKeyPair generateKeyPair() throws NoSuchAlgorithmException {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(1024);
        KeyPair keyPair = keyPairGenerator.generateKeyPair();
        RSAPublicKey rsaPublicKey = (RSAPublicKey) keyPair.getPublic();
        RSAPrivateKey rsaPrivateKey = (RSAPrivateKey) keyPair.getPrivate();
        String publicKeyString = Base64.encodeBase64String(rsaPublicKey.getEncoded());
        String privateKeyString = Base64.encodeBase64String(rsaPrivateKey.getEncoded());
        return new RsaKeyPair(publicKeyString, privateKeyString);
    }

    /**
     * RSA密钥对对象
     */
    public static class RsaKeyPair {
        private final String publicKey;
        private final String privateKey;

        public RsaKeyPair(String publicKey, String privateKey) {
            this.publicKey = publicKey;
            this.privateKey = privateKey;
        }

        public String getPublicKey() {
            return publicKey;
        }

        public String getPrivateKey() {
            return privateKey;
        }
    }

}
