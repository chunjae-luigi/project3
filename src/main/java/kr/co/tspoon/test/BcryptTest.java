package kr.co.tspoon.test;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BcryptTest {
    public static void main(String[] args) {
        String pw = "1234";
        BCryptPasswordEncoder pwEncoding = new BCryptPasswordEncoder();
        System.out.println(pwEncoding.encode(pw));
    }

}
