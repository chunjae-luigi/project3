package kr.co.tspoon.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Member {
    private String id;
    private String pw;
    private String name;
    private String email;
    private String tel;
    private String regdate;
    private int point = 0;
    private int grade = 1;
}
