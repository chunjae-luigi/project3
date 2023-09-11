package kr.co.tspoon.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Dat {
    private int dno;
    private String author;
    private String content;
    private String regdate;
    private int par;
}
