package kr.co.tspoon.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    private String id;
    private String pw;
    private String name;
    private String email;
    private String tel;
    private String addr1;
    private String addr2;
    private String postcode;
    private String regdate;
    private String birth;
    private int point = 0;
    private int grade;
    private boolean state = true;
}
